import QtQuick 1.0

Rectangle {
    property string imgSource: ""
    width: parent.width
    height: 100
    color: "black"

    Rectangle {

        radius: 5
        smooth: true
        width: 340
        height: 90

        anchors.centerIn: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 0.80; color: "#eee" }
            GradientStop { position: 1.0; color: "#efefef" }
        }

        Text {
            id: txt
            text: title
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        Image {
            id: img
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 200
            source: imgSource
            fillMode: Image.PreserveAspectFit
            smooth: true
            onStatusChanged:{
                if (img.status == Image.Ready){
                    loading.opacity = 0;
                }
            }
        }

        Image {
            id: loading
            anchors.centerIn: parent
            source: "qrc:/spinning"
            smooth: true

            NumberAnimation on rotation {
                from: 0; to: 360; running: loading.opacity == 1; loops: Animation.Infinite; duration: 900
            }
            opacity: 0
        }
    }

    onImgSourceChanged: {
        loading.opacity = 1;
    }

    Component.onCompleted: {
        var tira = lhcontent.match(/[^/]*\.png/);
        var image = "http://linuxhispano.net/tira/" + tira;
        imgSource = image;
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            detail.imgSource = imgSource
            main.goDetail(index)
        }
    }
}
