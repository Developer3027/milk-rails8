module BlogsHelper
  def display_blog_body(blog)
    sanitize(blog.processed_body,
              tags: %w[h1 h2 h3 h4 p a ul ol li strong em br img span pre code div],
              attributes: %w[href src id class style title alt])
  end
end
