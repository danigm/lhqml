import QtQuick 1.0

XmlListModel {
    source: "http://feeds.feedburner.com/tiralinuxhispano.xml"
    query: "/rss/channel/item"
    namespaceDeclarations: "declare namespace content=\"http://purl.org/rss/1.0/modules/content/\";"

    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "link"; query: "link/string()" }
    XmlRole { name: "pubDate"; query: "pubDate/string()" }
    XmlRole { name: "lhcontent"; query: "content:encoded/string()" }
}
