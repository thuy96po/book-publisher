module ApplicationHelper
  def full_title page_title = ""
    base_title = "Book Publisher"
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
end
