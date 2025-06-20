module SaltAndTarHelper
  def responsive_width_class
    "w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]"
  end

  def social_media_data
    @social_media_data ||= YAML.load_file(Rails.root.join("config/salt_and_tar.yml"))["social_media"].transform_values do |data|
      data.symbolize_keys.merge(
        icon_path: image_path("saltandtar/#{data["icon"]}"),
        formatted_count: formatted_count(data["count"].to_i)
      )
    end
  end

  def formatted_count(count)
    count > 1000 ? "#{(count / 1000.0).round(1)}K" : count.to_s
  end

  def promotion_heading(text, extra_classes = "")
    content_tag(:div, class: "text-center font-fell text-4xl md:text-6xl drop-shadow-dark #{extra_classes}") do
      content_tag(:h1, text)
    end
  end

  def standard_link(text, path, options = {})
    base_classes = "flex justify-center items-center h-12 w-32 mx-1 border-2 rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none"
    classes = "#{base_classes} #{options[:class]}"

    link_to text, path, class: classes
  end

  def feature_card_data
    @feature_card_data ||= YAML.load_file(Rails.root.join("config/salt_and_tar.yml"))["feature_cards"]
  end

  def left_feature_card
    feature_card_data["left"]
  end

  def right_feature_card
    feature_card_data["right"]
  end

  def feature_button(button_data)
    if button_data["path"].starts_with?("#")
      button_tag(button_data["text"], class: feature_button_classes)
    else
      link_to(button_data["text"],
              send(button_data["path"]), # Converts string to route helper
              class: feature_button_classes)
    end
  end

  def feature_button_classes
    "flex justify-center items-center h-12 w-32 mx-1 mb-4 text-swabbie-st-drk-primary bg-white border-2 border-swabbie-st-drk-primary rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none"
  end
end
