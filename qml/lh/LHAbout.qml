import QtQuick 1.0

Rectangle {
    width: parent.width
    height: parent.height

    color: "black"

    Image {
        id: lh
        source: "qrc:/lh"
        smooth: true
        width: (parent.width / 6.0) * 5.0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 100
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.openUrlExternally("http://linuxhispano.net");
            }
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Tira cómica de LinuxHispano, disfruta de más tiras cómicas y mucho más contenido sobre linux en http://linuxhispano.net"
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        color: "white"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.openUrlExternally("http://linuxhispano.net");
            }
        }
    }

    Text {
        anchors.bottom: wadobo.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: "app by"
        color: "white"
    }

    Image {
        id: wadobo
        source: "qrc:/wadobo"
        smooth: true
        width: (parent.width / 3.0) * 2.0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.openUrlExternally("http://wadobo.com");
            }
        }
    }
}
