require "lib/short-code.rb"

set :markdown, :fenced_code_blocks => true, :autolink => true, :with_toc_data => true

page "/*.xml", layout: false
page "/*.yml", layout: false
page "/*.json", layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false, directory_index: false
page "/blog/articles/template/*", layout: false, directory_index: false
page "/blog/articles/.obsidian/*", layout: false, directory_index: false
page "/404.html", directory_index: false
page "wkwkrnht-personal-site/source/google94502eafcdddcd40.html", layout: false

activate :shortcode
activate :blog do |blog|
    blog.sources = "blog/articles/{title}.html"
    blog.default_extension = ".md"
    blog.layout = "article"
    blog.tag_template = "partials/tag"
    blog.calendar_template = "partials/calender"
end

configure :build do
    activate :imgattribute do |img|
        img.loading = 'lazy'
    end
    activate :gzip
end