require 'lib/embed.rb'
require 'lib/short-code.rb'

set :markdown, :fenced_code_blocks => true, :autolink => true, :with_toc_data => true

# Layouts(Per-page layout changes): https://middlemanapp.com/basics/layouts/
#page '/path/to/file.html', layout: 'other_layout'
page "/*.xml", layout: false
page "/*.yml", layout: false
page "/*.toml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false
page '/404.html', directory_index: false

# Activate and configure extensions: https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :embed
activate :shortcode
activate :blog do |blog|
    blog.sources = "blog/articles/{title}.html"
    blog.default_extension = ".md"
    blog.layout = "article"
    blog.tag_template = "partials/tag"
    blog.calendar_template = "partials/calender"
end
activate :search do |search|
    search.resources = ['blog/', 'index.html', '404.html']
    search.language = 'jp' # defaults to 'en'
    search.fields = {
        title:   {boost: 100, store: true, required: true},
        content: {boost: 50},
        url:     {index: false, store: true},
        author:  {boost: 30}
    }
end

# Build-specific configuration: https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
    activate :sitemap_ping do |config|
        config.host = "https://wkwkrnht-blog-test.netlify.com/" # (required) Host of your website
    end
    activate :robots,
        :rules => [
            {
                :user_agent => "Googlebot",
                :allow => %w(/),
                :disallow => %w(404.html)
            },
            {
                :user_agent => "Googlebot-Image",
                :allow => %w(/),
                :disallow => %w(404.html)
            }
        ],
        :sitemap => "https://wkwkrnht-blog-test.netlify.com/sitemap.xml"
    activate :minify_html
    activate :minify_css
    activate :gzip
end