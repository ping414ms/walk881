class UserStatus < ActiveRecord::Base
  belongs_to :location
  belongs_to :next_location, :foreign_key => 'next_location_id', :class_name => 'Location'
  belongs_to :user


  # @param [User] user
  # @return [UserStatus]
  def self.init(user)
    model = self.new(user_id: user.id)
    model.update_user_status
  end

  def self.all_data(reverse_mode)
    query = UserStatus.all
    query = query.where('user_statuses.total_distance > 0') if Settings.user_status.show_user_only_more_that_one_step
    query = query.order('user_statuses.total_distance desc')
    add_map(query)
  end

  def self.add_map(query)
    query.
        eager_load(:location, :user => :user_setting).
        map {|us| {
        id: us.user_id,
        lat: us.lat,
        lon: us.lon,
        bearing: us.bearing,
        nickname: us.user.nickname,
        location: us.location,
        next_location: us.next_location,
        total_step: us.total_step,
        total_distance: us.total_distance,
        next_distance: us.next_distance,
        last_walk_day: us.last_walk_day,
        image: us.user.image,
        is_reverse: us.user.user_setting.reverse_mode == UserSetting::REVERSE_MODE,
    }}
  end

  def self.update_user_status(user_id)
    us = UserStatus.find_by(user_id: user_id)
    if us
      us.update_user_status
    end
    us
  end

  # @return [UserStatus]
  def update_user_status
    query = UserRecord.where(user_id: user_id)
    unless Settings.user_status.start_day.to_s.empty?
      query = query.where('day >= ?', Settings.user_status.start_day.to_s)
    end
    unless Settings.user_status.end_day.to_s.empty?
      query = query.where('day < ?', Settings.user_status.end_day.to_s)
    end
    rec = query.select('sum(steps) as steps, sum(distance) as distance').first
    last_day = query.maximum(:day)
    setting = UserSetting.find_by(user_id: user_id)
    self.total_step = rec.steps || 0

    if Settings.use_fix_step_length
      self.total_distance = self.total_step * Settings.use_fix_step_length / 1000.0
    else
      self.total_distance = rec.distance || 0
    end

    self.last_walk_day = last_day

    unless setting.is_reverse_mode?
      cl = Location.current_location(total_distance)
      nl = Location.find_by(number: cl.number+1)
      rt = LocationRoute.find_by(start_id: cl.number)
      cl_total_distance = cl.total_distance
      next_distance_from_cl_to_nl = cl.next_distance
    else
      cl = Location.reverse_current_location(total_distance)
      nl = Location.find_by(number: cl.number-1)
      rt = LocationRoute.find_by(end_id: cl.number)
      cl_total_distance = Location.max_total_distance - cl.total_distance
      next_distance_from_cl_to_nl = nl.next_distance if nl
    end

    self.location_id = cl.id
    if nl
      self.next_location_id = nl.id
      passed = total_distance - cl_total_distance
      self.next_distance = next_distance_from_cl_to_nl - passed

      lines = []
      lines += Polylines::Decoder.decode_polyline rt.polyline if rt.polyline != ''
      lines.reverse! if setting.is_reverse_mode?
      lines.unshift [cl.lat, cl.lon]
      lines.push [nl.lat, nl.lon]

      while true
        distance = Geocoder::Calculations.distance_between(lines[0], lines[1], units: :km)
        break if passed <= distance
        passed -= distance
        lines.shift
      end

      progress = passed / distance
      progress = 1 - progress if setting.is_reverse_mode?

      self.lat = lines[1][0] * progress + lines[0][0] * (1 - progress)
      self.lon = lines[1][1] * progress + lines[0][1] * (1 - progress)

      self.bearing = Geocoder::Calculations.bearing_between(lines[0], lines[1])
    else
      self.next_location_id = cl.id
      self.next_distance = 0
      self.lat = cl.lat
      self.lon = cl.lon
      self.bearing = 0
    end
    save
    self
  end
end
