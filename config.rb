require "uglifier"
require 'lib/embed.rb'

# Layouts
# https://middlemanapp.com/basics/layouts/
# Per-page layout changes
# page '/path/to/file.html', layout: 'other_layout'
page '/*.xml', layout: false
page '/*.yml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false
# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/
# proxy product.yml files to product.html
#data.products.each do |product|
    # product is an array: [filename, {data}]
#    proxy "/product/#{product[1][:title].parameterize}/index.html", "product.html",
#    locals: {product: product[1]},
#    layout: 'product-detail',
#    ignore: true
#end

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :autoprefixer do |prefix|
    prefix.browsers = "last 2 versions"
end
#activate :embed
activate :automatic_image_sizes
activate :syntax, :line_numbers => true
activate :directory_indexes # pretty urls
activate :sitemap_ping do |config|
    config.host = 'https://wkwkrnht-blog-test.netlify.com/' # (required) Host of your website
end
activate :robots,
    :rules => [
        {
            :user_agent => 'Googlebot',
            :allow => %w(/),
            :disallow => %w(404.html)
        },
        {
            :user_agent => 'Googlebot-Image',
            :allow => %w(/),
            :disallow => %w(404.html)
        }
    ],
    :sitemap => 'https://wkwkrnht-blog-test.netlify.com/sitemap.xml'
activate :blog do |blog|
    blog.default_extension = '.md'
    blog.permalink = 'blog/:year/:title.html'
    blog.sources = 'blog/articles/:title.html'
    blog.layout = 'article'
    #blog.tag_template = 'layouts/tag'
    #blog.calendar_template = 'layouts/calender'
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/
helpers do
    def background_image(image)
        "background-image: url('" << image_path(image) << "')"
    end

    def markdown(content)
        Tilt['markdown'].new { content }.render
    end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
    activate :minify_html
    activate :gzip
end