require "lib/short-code.rb"

set :markdown, :fenced_code_blocks => true, :autolink => true, :with_toc_data => true

page "/*.xml", layout: false
page "/*.yml", layout: false
page "/*.json", layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false, directory_index: false
page "/404.html", directory_index: false

activate :shortcode
activate :imgattribute do |img|
    img.loading = 'lazy'
end
activate :blog do |blog|
    blog.sources = "blog/articles/{title}.html"
    blog.default_extension = ".md"
    blog.layout = "article"
    blog.tag_template = "partials/tag"
    blog.calendar_template = "partials/calender"
end

configure :build do
    activate :gzip
end