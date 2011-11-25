import QtQuick 1.0

Rectangle {
    width: parent.width
    height: parent.height
    color: "black"

    property string imgSource: ""


    Image {
        id: loading
        anchors.centerIn: parent
        source: "qrc:/spinning-black"
        smooth: true

        NumberAnimation on rotation {
            from: 0; to: 360; running: loading.opacity == 1; loops: Animation.Infinite; duration: 900
        }
        opacity: 0
    }

    Flickable {
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: img.height
        contentWidth: img.width
        contentHeight: img.height

        Image {
            id: img
            source: imgSource
            smooth: true

            onStatusChanged:{
                if (img.status == Image.Ready){
                    loading.opacity = 0;
                }
            }
        }
    }

    onImgSourceChanged: {
        loading.opacity = 1;
    }
}
