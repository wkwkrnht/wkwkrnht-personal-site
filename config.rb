require 'lib/short-code.rb'

site_data = data.front

def make_rss(site_data)
    require 'rss'
    rss = RSS::Maker.make('atom') do |maker|
        maker.channel.about = site_data.baseurl + '/sitemap.xml'
        maker.channel.title = site_data.title
        maker.channel.description = site_data.description
        maker.channel.link = site_data.base_url
        maker.channel.author = site_data.author || site_data.title
        maker.channel.update = Time.now
        maker.items.do_sort = true
        page_articles.each_with_index do |article, i|
            maker.items.new_item do |item|
                item.link = article.url
                item.title = article.title
                item.date = Time.parse(article.date)
                item.description = article.description
            end
        end
    end
    File.open(Rails.root.join('build', 'sitemap.xml'), 'w') { |f| f.puts(rss) }
end

set :markdown, :fenced_code_blocks => true, :autolink => true, :with_toc_data => true

page "/*.xml", layout: false
page "/*.yml", layout: false
page "/*.json", layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false, directory_index: false
page '/404.html', directory_index: false

# Activate and configure extensions: https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :shortcode
activate :blog do |blog|
    blog.sources = "blog/articles/{title}.html"
    blog.default_extension = ".md"
    blog.layout = "article"
    blog.tag_template = "partials/tag"
    blog.calendar_template = "partials/calender"
end

# Build-specific configuration: https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
    activate :sitemap_ping do |config|
        config.host = site_data.base_url
    end
    activate :minify_html
    activate :gzip
end