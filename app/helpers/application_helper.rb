module ApplicationHelper
  def flash_class(key)
    case (key)
    when "notice"
      "alert alert-info"
    when "alert"
      "alert alert-danger"
    end
  end
end
