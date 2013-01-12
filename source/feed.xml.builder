xml.instruct!
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.title     I18n.t('app.name')
  xml.subtitle  I18n.t('app.tagline')
  xml.id        I18n.t('app.url')
  xml.link      I18n.t('app.url')
  xml.link      href: request.path, rel: "self"
  xml.updated   blog.articles.first.date.to_time.iso8601 rescue Time.now.iso8601
  xml.author do
    xml.name   "Public Glass"
    xml.email  "info@publicglass.org"
  end

  blog.articles.each do |article|
    xml.entry do
      xml.link rel: "alternate", href: uri(article.url)
      xml.title     article.title
      xml.id        uri(article.url)
      xml.published article.date.to_time.iso8601
      xml.updated   article.date.to_time.iso8601

      if article.data.author
        xml.author do
          xml.name article.data.author.name rescue nil
          xml.email article.data.author.email rescue nil
        end
      end

      xml.summary excerpt(article), type: "html"
      xml.content article.body, type: "html"
    end
  end
end
