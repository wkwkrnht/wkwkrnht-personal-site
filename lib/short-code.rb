require 'cgi'
require 'middleman-core'

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

class String
    def shortcode_extract!
        #extract_code_embed!()
    end

    #def extract_columun_embed!(match)
    #    shortcode = "<pre class='prettyprint linenums'><code>\\1</code></pre><script async='' src='//cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=doxy'></script>"
    #    replace self.gsub(/columun ([^#\&\?<]+) ([^#\&\?<]+)/,shortcode)
    #end
    #def extract_notice_embed!(match)
    #    shortcode = "<pre class='prettyprint linenums'><code>\\1</code></pre><script async='' src='//cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=doxy'></script>"
    #    replace self.gsub(/notice ([^#\&\?<]+)/,shortcode)
    #end
    #def extract_question_embed!(match)
    #    shortcode = "<pre class='prettyprint linenums'><code>\\1</code></pre><script async='' src='//cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=doxy'></script>"
    #    replace self.gsub(/question ([^#\&\?<]+)/,shortcode)
    #end
    #def extract_search_embed!(match)
    #    shortcode = "<pre class='prettyprint linenums'><code>\\1</code></pre><script async='' src='//cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=doxy'></script>"
    #    replace self.gsub(/search ([^#\&\?<]+)/,shortcode)
    #end
    #def extract_search_embed!(match)
    #    shortcode = "<pre class='prettyprint linenums'><code>\\1</code></pre><script async='' src='//cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=doxy'></script>"
    #    replace self.gsub(/button ([^#\&\?<]+) ([^#\&\?<]+)/,shortcode)
    #end
end