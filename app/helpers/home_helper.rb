module HomeHelper
  def google_api_access
    "http://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_KEY']}&libraries=geometry&sensor=false"
  end

  def google_javascript_tag
    content_tag :script , :type => 'text/javascript', :src => google_api_access do
    end
  end
end
