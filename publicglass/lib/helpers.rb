module ApplicationHelpers
  def root?
    request.path == 'index.html'
  end

  def title
    ["\u2117 " + I18n.t('app.name'), current_page.data['title']].compact.join(" - ") 
  end

  def excerpt(article)
    ::Redcarpet::Markdown.new(article.data.excerpt).to_html rescue article.summary
  end

  def toc(page)
    ::Redcarpet::Markdown.new(::Redcarpet::Render::HTML_TOC).render(::File.read(page.source_file))
  end

  def uri(link)
    URI.join(I18n.t('app.url'), link)
  end
end
