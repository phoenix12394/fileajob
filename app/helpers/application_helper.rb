module ApplicationHelper
def title
  base_title = "tutorial"
  if @title.nil?
    base_title
  else
    "#{base_title} | #{@title}"
  end
end

  def logo
     image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
  
def set_focus_to_id(id)
  javascript_tag("$('#{id}').focus()");
end  
end
