module ApplicationHelper
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def link_to(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}
    html_options = convert_options_to_data_attributes(options, html_options)
    url = url_for(options)
    html_options['href'] ||= url if url.present?
    if html_options["require_login"] and not user_signed_in?
      html_options.delete "data-toggle"
      html_options.delete "data-remote"
      html_options.delete "data-target"
      html_options.delete "data-method"
      html_options['href'] = '#'
      html_options['onclick'] = "$('#sign-in-modal').modal('show')"
      html_options['class'] = "" if html_options['class'].nil?
      html_options['class'] = html_options['class']
    end
    content_tag(:a, name || url, html_options, &block)
  end
  
end
