module ApplicationHelper
  def inline_asset(path)
    Rails.application.assets.load_path.find(path).content.html_safe
  end

  def navigation_link(text = nil, path = nil, options = {})
    active = options[:active] ? "active" : nil
    options[:class] = class_names(options[:class], active)
    options[:active] = nil

    link_to text, path, options
  end
end
