require 'lib/embed.rb'
#require 'lib/short-code.rb'

# Layouts(Per-page layout changes): https://middlemanapp.com/basics/layouts/
#page '/path/to/file.html', layout: 'other_layout'
page "/*.html", layout: "layouts/layout"
page "/*.xml", layout: false
page "/*.yml", layout: false
page "/*.toml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false
# Proxy pages(proxy product.yml files to product.html): https://middlemanapp.com/advanced/dynamic-pages
#data.products.each do |product|
#    product is an array: [filename, {data}]
#    proxy "/product/#{product[1][:title].parameterize}/index.html", "product.html",
#    locals: {product: product[1]},
#    layout: 'product-detail',
#    ignore: true
#end

# Activate and configure extensions: https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :embed
#activate :shortcode
activate :automatic_image_sizes
activate :syntax, :line_numbers => true
activate :blog do |blog|
    blog.sources = "blog/articles/{title}.html"
    blog.default_extension = ".md"
    blog.layout = "layouts/article"
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
    #activate :minify_html
    activate :gzip
end