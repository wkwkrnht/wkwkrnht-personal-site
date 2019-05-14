require 'cgi'
require 'middleman-core'

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

    def shortcode_extract!
        extract_columun_embed!()
        extract_notice_embed!()
        extract_question_embed!()
        extract_search_embed!()
        extract_button_embed!()
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