require 'cgi'
require 'nokogiri'
require 'middleman-core'

class Middleman::ImgAttribute < ::Middleman::Extension
    option :loading, 'auto', 'A value of "loading" attribute in <img> tag'
    def initialize(app, options_hash={}, &block)
        # Call super to build options from the options_hash
        super
        # Require libraries only when activated
        # require 'necessary/library'
        # set up your extension
        # puts options.my_option
    end
    def after_configuration
        #do something
    end

    def after_build(builder)
        files = Dir.glob(File.join(app.config[:build_dir], "**", "*.html"))
        files.each do |file|
            doc = Nokogiri::HTML(File.read(file))
            doc.css('img').each do |elem|
                next if elem.path.include?('pre') || elem.path.include?('code') || elem.path.include?('blockquote')
                elem['loading'] = options[:loading]
            end
            File.open(file, 'w') do |f|
                f.write doc.to_html
            end
        end
    end
    # A Sitemap Manipulator
    # def manipulate_resource_list(resources)
    # end
    # helpers do
    #   def a_helper
    #   end
    # end
end

class String
    def extract_columun_embed!()
        shortcode = "<aside class='columun'><h6>\\1</h6>\\2</aside>"
        replace self.gsub(/COLUMUN ([^#\&\?<]+) ([^#\&\?<]+)/,shortcode)
    end
    def extract_notice_embed!()
        shortcode = "<aside class='notice'><span class='info-literal'>!</span>\\1</aside>"
        replace self.gsub(/NOTICE ([^#\&\?<]+)/,shortcode)
    end
    def extract_question_embed!()
        shortcode = "<aside class='question'><span class='info-literal'>?</span>\\1</aside>"
        replace self.gsub(/QUESTION ([^#\&\?<]+)/,shortcode)
    end
    def extract_search_embed!()
        shortcode = "<aside class='search-form'><div class='query'>\\1</div><div class='search-btn'><span class='fas fa-search'></span>検索</div></aside>"
        replace self.gsub(/SEARCH ([^#\&\?<]+)/,shortcode)
    end
    def extract_button_embed!()
        shortcode = "<a class='linkbutton' href='\\1' title='\\2' tabindex='0'>\\2</a>"
        replace self.gsub(/BUTTON ([^#\&\?<]+) ([^#\&\?<]+)/,shortcode)
    end

    def embed_youtube!()
        embed43 = "<figure class='embed-responsive embed-4x3'><iframe src='https://www.youtube.com/embed/\\1' width='360' height='240' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'  allowfullscreen></iframe></figure>"
        replace self.gsub(/YOUTUBE43 ([^#\&\?<]+)/,embed43)
        embed169 = "<figure class='embed-responsive embed-16x9'><iframe src='https://www.youtube.com/embed/\\1' width='320' height='180' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'  allowfullscreen></iframe></figure>"
        replace self.gsub(/YOUTUBE169 ([^#\&\?<]+)/,embed169)
    end

    def embed_spotify!()
        embed = "<figure class='embed-responsive spotifycard'><iframe src='https://open.spotify.com/embed/playlist/\\1' width='300' height='380' frameborder='0' allowtransparency='true' allow='encrypted-media'>></iframe></figure>"
        replace self.gsub(/SPOTIFY ([^#\&\?<]+)/,embed)
    end

    def embed_hatena!()
        embed = "<figure class='embed-responsive hatenablogcard'><iframe src='https://hatenablog-parts.com/embed?url=\\1' frameborder='0' scrolling='no'></iframe></figure>"
        replace self.gsub(/HATENA ([^<]+)/,embed)
    end

    def embed_embedly!()
        embed = "<a class='embedly-card' href='\\1'></a><script async='' src='//cdn.embedly.com/widgets/platform.js'></script>"
        replace self.gsub(/EMBEDLY ([^<]+)/,embed)
    end

    def shortcode_extract!
        extract_columun_embed!()
        extract_notice_embed!()
        extract_question_embed!()
        extract_search_embed!()
        extract_button_embed!()

        embed_youtube!()
        embed_youtube!()
        embed_spotify!()
        embed_hatena!()
        embed_embedly!()
    end
end

module Middleman
    class Shortcode < Extension
        def initialize(app,options_hash={},&block)
            super
            app.after_render do |body, path, locs, template|
                body.shortcode_extract!
                body
            end
        end
    end
end
::Middleman::Extensions.register(:shortcode,::Middleman::Shortcode)
::Middleman::Extensions.register(:imgattribute,::Middleman::ImgAttribute)