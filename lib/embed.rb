require 'cgi'
require 'middleman-core'

class String
    def embed_youtube!()
        #(HOW CALL:youtube {videoID},E.X.:youtube aLvJ1mqlM98) -> <figure class="embed-responsive embed-responsive-16by9"><iframe src="//www.youtube.com/embed/aLvJ1mqlM98" frameborder="0" allowfullscreen></iframe></figure>
        embed43 = "<figure class='embed-responsive embed-4x3'><iframe src='https://www.youtube.com/embed/\\1' width='360' height='240' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'  allowfullscreen></iframe></figure>"
        replace self.gsub(/YOUTUBE43 ([^#\&\?<]+)/,embed43)
        embed169 = "<figure class='embed-responsive embed-16x9'><iframe src='https://www.youtube.com/embed/\\1' width='320' height='180' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'  allowfullscreen></iframe></figure>"
        replace self.gsub(/YOUTUBE169 ([^#\&\?<]+)/,embed169)
    end

    def embed_spotify!()
        #(HOW CALL:spotify {URL},E.X.:spotify https://google.com) -> <figure class="embed-responsive spotifycard"><iframe src="https://embed.spotify.com/?uri=" width="300" height="380" frameborder="0" allowtransparency="true"></iframe></figure>
        embed = "<figure class='embed-responsive spotifycard'><iframe src='https://open.spotify.com/embed/playlist/\\1' width='300' height='380' frameborder='0' allowtransparency='true' allow='encrypted-media'>></iframe></figure>"
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
        replace self.gsub(/EMBEDLY ([^#\&\?<]+)/,embed)
    end

    def embed_items!
        embed_youtube!()
        embed_youtube!()
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
                body.embed_items!
                body
            end
        end
    end
end
::Middleman::Extensions.register(:embed,::Middleman::Embed)