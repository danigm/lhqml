import QtQuick 1.0

Rectangle {
    id: main
    width: 360
    height: 360

    color: "black"

    property int index: 0

    LHModel {
        id: lhmodel
    }

    LHMenu {
        id: menu
        z: 2
    }

    ListView {
        anchors.top: menu.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        id: lhview
        delegate: LHDelegate{}
        model: lhmodel
    }

    DetailView {
        id: detail
        opacity: 0
        z: 1
    }

    LHAbout {
        id: about
        opacity: 0
    }

    state: "list"

    states: [
        State { name: "list";
                PropertyChanges { target: menu; title: "LinuxHispano - tira" }
                PropertyChanges { target: menu; state: "quit" }
        },
        State { name: "detail";
                PropertyChanges { target: detail; opacity: 1 }
                PropertyChanges { target: lhview; opacity: 0 }
                PropertyChanges { target: menu; state: "detail" }
        },
        State { name: "about";
                PropertyChanges { target: about; opacity: 1 }
                PropertyChanges { target: lhview; opacity: 0 }
                PropertyChanges { target: menu; state: "back" }
                PropertyChanges { target: menu; title: "About" }
        }
    ]

    function goNext() {
        index++;
        if (index >= lhmodel.count)
            state = "list"
        else
            go(index);
    }

    function goBack() {
        index--;
        if (index < 0)
            state = "list"
        else
            go(index);
    }

    function go(idx) {
        var tira = lhmodel.get(idx).lhcontent.match(/[^/]*\.png/);
        var image = "http://linuxhispano.net/tira/" + tira;
        detail.imgSource = image;
        menu.title = lhmodel.get(idx).title;
    }

    function goDetail(idx) {
        index = idx;
        state = "detail"
        menu.title = lhmodel.get(idx).title;
    }

    function setTitle(txt) {
        menu.title = txt;
    }

    function about() {
        state = "about"
    }
}
