module ApplicationHelper
  
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    image_url = "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{size}"
    image_tag(image_url, alt:user.username, class: "rounded shadow mx-auto d-block")
  end
  
end
