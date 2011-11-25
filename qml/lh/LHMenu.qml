import QtQuick 1.0

Rectangle {
    id: root
    width: parent.width
    height: 62
    color: "black"

    property string title: "LinuxHispano"

    Text {
        id: titleText
        text: title
        anchors.centerIn: parent
        color: "white"

        MouseArea {
            anchors.fill: parent
            onClicked: main.state = "list"
        }
    }

    Image {
        id: quit
        source: "qrc:/quit"
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }

    Image {
        id: about
        source: "qrc:/about"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        MouseArea {
            anchors.fill: parent
            onClicked: {
                main.about();
            }
        }
    }

    Image {
        id: back
        source: "qrc:/back"
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (root.state == "back") {
                    main.state = "list"
                } else {
                    main.goBack();
                }
            }
        }
    }

    Image {
        id: next
        source: "qrc:/next"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        MouseArea {
            anchors.fill: parent
            onClicked: {
                main.goNext();
            }
        }
    }

    state: "quit"

    states: [
        State { name: "quit";
                PropertyChanges { target: back; opacity: 0 }
                PropertyChanges { target: next; opacity: 0 }
        },
        State { name: "detail";
                PropertyChanges { target: back; opacity: 1 }
                PropertyChanges { target: next; opacity: 1 }
                PropertyChanges { target: quit; opacity: 0 }
                PropertyChanges { target: about; opacity: 0 }
        },
        State { name: "back"
                PropertyChanges { target: back; opacity: 1 }
                PropertyChanges { target: next; opacity: 0 }
                PropertyChanges { target: quit; opacity: 0 }
                PropertyChanges { target: about; opacity: 0 }
        }
    ]
}
