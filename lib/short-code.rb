require 'cgi'
require 'middleman-core'

module Middleman
    class Shortcode < Extension
        def initialize(app,options_hash={},&block)
            super
            app.after_render do |body, path, locs, template|
                if (path.to_s.index "blog_post") != nil
                    body.shortcode_extract!
                end
                body
            end
        end
    end
end
::Middleman::Extensions.register(:shortcode,::Middleman::Shortcode)

class String
    def shortcode_extract!
        #extract_code_embed!('code')
    end

    #def extract_code_embed!(match)
    #    shortcode = "<pre class='prettyprint linenums'><code>\\1</code></pre><script async='' src='//cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=doxy'></script>"
    #    replace self.gsub(/<code>#{match}<\/code>/,shortcode)
    #end
end