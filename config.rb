require 'uglifier'
require 'lib/embed.rb'

# Layouts(Per-page layout changes): https://middlemanapp.com/basics/layouts/
#page '/path/to/file.html', layout: 'other_layout'
page '/*.keep', layout: false
page '/*.xml', layout: false
page '/*.yml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false
# Proxy pages(proxy product.yml files to product.html): https://middlemanapp.com/advanced/dynamic-pages/\
#data.products.each do |product|
    # product is an array: [filename, {data}]
#    proxy "/product/#{product[1][:title].parameterize}/index.html", "product.html",
#    locals: {product: product[1]},
#    layout: 'product-detail',
#    ignore: true
#end

# Activate and configure extensions: https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :blog do |blog|
    blog.permalink = "{year}/{month}/{day}/{title}.html"
    blog.sources = "articles/{title}.html"
    blog.layout = 'article'
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

# Helpers(Methods defined in the helpers block are available in templates): https://middlemanapp.com/basics/helper-methods/
helpers do
    def background_image(image)
        "background-image: url('" << image_path(image) << "')"
    end

    def markdown(content)
        Tilt['markdown'].new { content }.render
    end
end

# Build-specific configuration: https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
    activate :minify_html
    activate :gzip
end