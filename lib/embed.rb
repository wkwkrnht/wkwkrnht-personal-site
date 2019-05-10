require 'cgi'
require 'middleman-core'

class String
    def embed_youtube!(match,css_class)
        #(HOW CALL:youtube {videoID},E.X.:youtube aLvJ1mqlM98) -> <figure class="embed-responsive embed-responsive-16by9"><iframe src="//www.youtube.com/embed/aLvJ1mqlM98" frameborder="0" allowfullscreen></iframe></figure>
        embed = "<figure class='embed-responsive #{css_class}'><iframe src='//www.youtube.com/embed/\\1' frameborder='0' allowfullscreen></iframe></figure>"
        replace self.gsub(/<p>#{match} ([^#\&\?<]+)<\/p>/,embed)
    end

    def embed_spotify!()
        #(HOW CALL:spotify {URL},E.X.:spotify https://google.com) -> <figure class="embed-responsive spotifycard"><iframe src="https://embed.spotify.com/?uri=" width="300" height="380" frameborder="0" allowtransparency="true"></iframe></figure>
        embed = "<figure class='embed-responsive spotifycard'><iframe src='https://embed.spotify.com/?uri=\\1' width='300' height='380' frameborder='0' allowtransparency='true'></iframe></figure>"
        replace self.gsub(/SPOTIFY ([^#\&\?<]+)/,embed)
    end

    def embed_hatena!()
        #(HOW CALL:hatena {URL},E.X.:hatena https://google.com) -> <figure class="embed-responsive hatenablogcard"><iframe src="https://hatenablog-parts.com/embed?url=https://google.com" frameborder="0" scrolling="no"></iframe></figure>
        embed = "<figure class='embed-responsive hatenablogcard'><iframe src='https://hatenablog-parts.com/embed?url=\\1' frameborder='0' scrolling='no'></iframe></figure>"
        replace self.gsub(/HATENA ([^#\&\?<]+)/,embed)
    end

    def embed_embedly!()
        #(HOW CALL:embedly {URL},E.X.:embedly https://google.com) -> <a class='embedly-card' href='https://google.com'>https://google.com</a><script async='' src='//cdn.embedly.com/widgets/platform.js'></script>"
        embed = "<a class='embedly-card' href='\\1'></a><script async='' src='//cdn.embedly.com/widgets/platform.js'></script>"
        replace self.gsub(/embedly ([^#\&\?<]+)/,embed)
    end

    def embed_items!
        embed_youtube!('youtube43','embed-responsive-4by3')
        embed_youtube!('youtube','embed-responsive-16by9')
        embed_spotify!()
        embed_hatena!()
        embed_embedly!()
    end
end

module Middleman
    class Embed < Extension
        def initialize(app,options_hash={},&block)
            super
            app.after_render do |body, path, locs, template|
                if (path.to_s.index "blog_post") != nil
                    body.embed_items!
                end
                body
            end
        end
    end
end
::Middleman::Extensions.register(:embed,::Middleman::Embed)