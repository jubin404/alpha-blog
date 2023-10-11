module ApplicationHelper
  def gravatar_for(user, options = {size: 80})
    email = user.email.downcase
    hash = Digest::MD5.hexdigest(email)
    size = options[:size]
    gravatr_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatr_url, alt: user.username)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
end
