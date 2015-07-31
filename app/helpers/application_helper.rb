module ApplicationHelper
  def flash_class(type)
    case type
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-warning'
    when 'alert' then 'alert alert-danger'
    end
  end

  def active_class(link_path)
    'active' if current_page?(link_path)
  end
end
