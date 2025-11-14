# frozen_string_literal: true

# Default meta tags configuration for social sharing
MetaTags.configure do |config|
  # Set default site configuration
  config.defaults = {
    site: "Rogue Media Lab",
    title: "Rogue Media Lab",
    description: "Full-stack development, design, and creative content by Mason Roberts",
    keywords: "web development, rails, ruby, design, full stack, blog",
    separator: "|",
    reverse: true,
    og: {
      site_name: "Rogue Media Lab",
      type: "website",
      locale: "en_US"
    },
    twitter: {
      card: "summary_large_image",
      site: "@roguemedialab" # Update with your Twitter handle if you have one
    }
  }
end
