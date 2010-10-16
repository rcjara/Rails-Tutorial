module ApplicationHelper
  def title
    base_title = "Ruby on Rails Tutorial"
    if @title.nil?
      base_title
    else
      base_title + " | " + @title
    end
  end

  def logo_image
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
end
