module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: "alert") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def is_current_user_admin?
    !current_user.nil? && current_user.roles.where(name: "admin").exists?
  end

  def is_user_admin?(user)
    return false if user.nil?
    user.admin?
  end

  def does_user_have_role?(user, role)
    return false if user.nil?
    user.roles.where(name: "admin").exists?
  end

  def is_current_user_mentor?
    !current_user.nil? && current_user.roles.where(name: "mentor").exists?
  end

  def resource_name
  :user
  end

  def resource
  @resource ||= User.new
  end

  def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
  end


end
