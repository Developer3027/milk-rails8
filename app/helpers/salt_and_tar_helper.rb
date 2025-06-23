module SaltAndTarHelper
  # Returns a string containing responsive width CSS classes for
  # different screen sizes. The classes define width values for
  # standard, small, large, and extra-large screens.
  def responsive_width_class
    "w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]"
  end

  # Returns a Hash of social media data, with platform names as keys and
  # hashes as values. Each value hash contains the following keys:
  #
  # - `:name`
  # - `:url`
  # - `:icon`: the path to the icon image
  # - `:count`: the integer count of the platform
  # - `:label`: the label to display next to the count
  # - `:formatted_count`: the count formatted as a string, with values
  #   over 1000 shown in "K" notation (e.g. 1.2K)
  def social_media_data
    @social_media_data ||= YAML.load_file(Rails.root.join("config/salt_and_tar.yml"))["social_media"].transform_values do |data|
      data.symbolize_keys.merge(
        icon_path:  secure_asset_path(data["icon"]),
        formatted_count: formatted_count(data["count"].to_i)
      )
    end
  end

  # Formats a count as a string.
  #
  # For counts over 1000, the count is formatted as a string using "K" notation
  # (e.g. 1.2K). Otherwise, the count is formatted as a string in the standard
  # way (e.g. 123).
  def formatted_count(count)
    count > 1000 ? "#{(count / 1000.0).round(1)}K" : count.to_s
  end

  # Returns a secure asset path for the given image.
  #
  # If the Propshaft gem is defined, it attempts to resolve the asset path
  # using the Propshaft resolver. If the asset cannot be resolved, it defaults
  # to a path within the "saltandtar" directory.
  #
  # If Propshaft is not defined, it uses the standard Rails asset_path helper
  # to generate the path.
  #
  # @param image_path [String] the relative path to the image
  # @return [String] the resolved asset path
  def secure_asset_path(image_path)
    if defined?(Propshaft)
      Rails.application.assets.resolver.resolve("saltandtar/#{image_path}")&.then { |p| "#{p}" } ||
        "/saltandtar/#{image_path}"
    else
      asset_path("saltandtar/#{image_path}")
    end
  end

  # Generates a promotion heading within a styled div.
  #
  # @param text [String] the text to be displayed as the heading
  # @param extra_classes [String] additional CSS classes to be applied to the div
  # @return [ActiveSupport::SafeBuffer] HTML content for the promotion heading
  def promotion_heading(text, extra_classes = "")
    content_tag(:div, class: "text-center font-fell text-4xl md:text-6xl drop-shadow-dark #{extra_classes}") do
      content_tag(:h1, text)
    end
  end

  # Generates a styled link with a base class set.
  #
  # @param text [String] the text to be displayed as the link
  # @param path [String] the path to which the link should point
  # @param options [Hash] additional options to be passed to the `link_to` helper
  # @option options [String] :class additional CSS classes to be applied to the link
  # @return [ActiveSupport::SafeBuffer] HTML content for the link
  def standard_link(text, path, options = {})
    base_classes = "flex justify-center items-center h-12 w-32 mx-1 border-2 rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none"
    classes = "#{base_classes} #{options[:class]}"

    link_to text, path, class: classes
  end

  # Loads and caches feature card data from a YAML configuration file.
  #
  # @return [Hash] the feature card data parsed from the YAML file
  def feature_card_data
    @feature_card_data ||= YAML.load_file(Rails.root.join("config/salt_and_tar.yml"))["feature_cards"]
  end

  # Returns the data for the left feature card, as a Hash.
  #
  # @return [Hash] the data for the left feature card
  def left_feature_card
    feature_card_data["left"]
  end

  # Returns the data for the right feature card, as a Hash.
  #
  # @return [Hash] the data for the right feature card
  def right_feature_card
    feature_card_data["right"]
  end

  # Generates a button or link based on the given button data.
  #
  # @param button_data [Hash] a Hash containing the button text and path
  # @option button_data [String] :text the text to be displayed on the button
  # @option button_data [String] :path the path to which the link should point, or "#" for a button
  # @return [ActiveSupport::SafeBuffer] the generated button or link
  def feature_button(button_data)
    if button_data["path"].starts_with?("#")
      button_tag(button_data["text"], class: feature_button_classes)
    else
      link_to(button_data["text"],
              send(button_data["path"]),
              class: feature_button_classes)
    end
  end

  # Returns a string containing CSS classes for styling feature buttons.
  #
  # These classes position the button at the center of its parent, with a
  # standard size, margin, and padding. They also set the text color, background
  # color, border color, and font family. Additionally, they add a drop shadow
  # effect, which is removed when the button is hovered over.
  def feature_button_classes
    "flex justify-center items-center h-12 w-32 mx-1 mb-4 text-swabbie-st-drk-primary bg-white border-2 border-swabbie-st-drk-primary rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none"
  end
end
