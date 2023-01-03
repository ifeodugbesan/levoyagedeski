module ApplicationHelper
  def is_video?(content)
    content.content_type.split('/')[0] == 'video'
  end

  def is_photo?(content)
    content.content_type.split('/')[0] == 'image'
  end
end
