# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
require "uglifier"

# Use '#id' and '.classname' as div shortcuts in slim
# http://slim-lang.com/
Slim::Engine.set_options shortcut: {
    '#' => {tag: 'div', attr: 'id'},
    '.' => {tag: 'div', attr: 'class'}
}

activate :autoprefixer do |prefix|
    prefix.browsers = "last 2 versions"
end
activate :automatic_image_sizes
activate :syntax, :line_numbers => true
activate :directory_indexes # pretty urls
activate :sitemap_ping do |config|
    config.host = 'https://wkwkrnht-blog-by-middleman.netlify.com' # (required) Host of your website
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
    :sitemap => 'https://wkwkrnht-blog-by-middleman.netlify.com/sitemap.xml'

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false

activate :blog do |blog|
    blog.permalink = "news/{year}/{title}.html"
    blog.sources = "blog/articles/{title}.html"
    blog.layout = 'article'
    blog.tag_template = 'layouts/tag'
    blog.calendar_template = 'layouts/calender'
end

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

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

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  #helper to set background images with asset hashes in a style attribute
    def background_image(image)
        "background-image: url('" << image_path(image) << "')"
    end

    def nav_link(link_text, url, options = {})
        options[:class] ||= ""
        options[:class] << " active" if url == current_page.url
        link_to(link_text, url, options)
    end

    def markdown(content)
        Tilt['markdown'].new { content }.render
    end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
    # Minify HTML, css, Javascript on build
    activate :minify_html
    activate :minify_css
    activate :minify_javascript, :ignore => "**/admin/**", compressor: ::Uglifier.new(mangle: true, compress: { drop_console: true }, output: {comments: :none})

    # Use Gzip
    activate :gzip

    #Use asset hashes to use for caching
    activate :asset_hash
end
