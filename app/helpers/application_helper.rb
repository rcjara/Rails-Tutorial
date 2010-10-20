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

  def signin_link
    if signed_in?
      link_to "Sign Out", signout_path
    else
      link_to "Sign In", signin_path
    end
  end
end
