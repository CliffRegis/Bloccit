module ApplicationHelper

  def simple_form_for(errors, &block)
    if errors.any?
        content_tag :div, capture(&block), class: 'form_group has-error'
    else
        content_tag :div, capture(&block), class: 'form_group'  
    end
  end
end
