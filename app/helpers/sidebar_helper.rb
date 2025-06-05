module SidebarHelper
  SIDEBAR_CONTROLLER = "music--sidebar".freeze
  def sidebar_link_to(name, path, icon_name, options = {})
    content_tag :li, class: "flex h-11 items-center rounded-xs p-1 hover:bg-[#FFC9A4]/50 transition-colors w-full",
                     data: { "#{SIDEBAR_CONTROLLER}-target": "link",
                     action: "click->#{SIDEBAR_CONTROLLER}#setActive" } do
      link_to path, class: "flex items-center w-full cursor-pointer", data: options[:data] || {} do
        concat icon(icon_name)
        concat content_tag(:span, name, class: "ms-3")
      end
    end
  end

  def icon(name)
    # Render SVG icons in icons folder, based on the name
    render "icons/#{name}"
  end
end
