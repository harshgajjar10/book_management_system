module ApplicationHelper
  def admin?
    current_user.has_role?(:admin)
  end

  def user?
    current_user.has_role?(:user)
  end

  #---------------------page_index-------------------------
  def page_index(page, index, count=10)
    if page.present? && page.to_i > 1
      "<td>#{((page.to_i - 1) * count) + (index+1)}</td>".html_safe
    else
      "<td>#{index+1}</td>".html_safe
    end
  end
end
