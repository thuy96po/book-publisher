module ApplicationHelper
  include Pagy::Frontend
  def full_title page_title = ""
    base_title = t "base_title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_class? path
    return "active" if request.path == path
    ""
  end

  def current_controller? name
    return "active" if controller.controller_name == name
    ""
  end

  def convert_date str
    str.strftime("%m/%d/%Y")
  end
end
