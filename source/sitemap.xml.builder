xml.instruct!
xml.feed 'xmlns' => 'http://www.w3.org/2005/Atom' do
    site_url = "#{data.front.base_url}/"
    xml.title data.front.title
    xml.id URI.join(site_url, blog.options.prefix.to_s)
    xml.link 'href' => URI.join(site_url)
    xml.link 'href' => URI.join(site_url, URI.encode(current_page.path)), 'rel' => 'self'
    xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
    page_articles.each_with_index do |article, i|
        xml.entry do
            xml.title article.title
            xml.link 'rel' => 'alternate', 'href' => URI.join(site_url, URI.encode(article.url))
            xml.id URI.join(site_url, URI.encode(article.url))
            xml.published article.date.to_time.iso8601
            xml.updated File.mtime(article.source_file).iso8601
            xml.content article.body, 'type' => 'html'
        end
    end
end