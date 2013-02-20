xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "UbuntuFeed"
    xml.description "Centralizador de feeds de los blogs mas famosos sobre Ubuntu y Linux en español."
    xml.link "http://ubuntufeed.co"

    for post in @posts
      xml.item do
        xml.title post.title
        xml.pubDate post.pubdate.to_s(:rfc822)
        xml.link post.link
        xml.guid post.link
      end
    end
  end
end
