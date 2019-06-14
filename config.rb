require 'lib/short-code.rb'

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
        config.host = "https://wkwkrnht-blog-test.netlify.com/" # (required) Host of your website
    end
    activate :minify_html
    activate :minify_css
    activate :gzip
end