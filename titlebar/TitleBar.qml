import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15


Rectangle {
    id: titleBar
    width: parent.width
    height: 30
    color: "#373737"

    Image {
        id: homeicon
        source: "qrc:/icon/homeicon.png"
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
    }

    Label {
        id: titleLabel
        Text {
            text: rootWindow.title
            font.pixelSize: 16
            color: "#ffffff"
            font.pointSize: 12
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
        }
        anchors.left: homeicon.right
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
    }

    function minimizeWindow() {
        rootWindow.visibility = Window.Minimized;
    }

    function maximizeWindow() {
        rootWindow.visibility = Window.Maximized;
    }

    function toggleMaximizeWindow() {
        if (rootWindow.visibility === Window.Maximized) {
            rootWindow.visibility = Window.Windowed;
        } else {
            rootWindow.visibility = Window.Maximized;
        }
    }

    Rectangle {
        id: minimizeButton
        color: "transparent"
        border.color: "transparent"
        width: parent.height
        height: parent.height
        anchors.right: maximizeButton.left
        anchors.rightMargin: 4
        z: parent.z + 1

        Image {
            id: minimizeIcon
            source: "qrc:/icon/minimize.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                minimizeWindow()
            }
        }
    }

    Rectangle {
        id: maximizeButton
        color: "transparent"
        border.color: "transparent"
        width: parent.height
        height: parent.height
        anchors.right: closeButton.left
        anchors.rightMargin: 4
        z: parent.z + 1

        Image {
            id: maximizeIcon
            source: "qrc:/icon/toggle2.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                toggleMaximizeWindow()
            }
        }
    }

    Rectangle {
        id: closeButton
        color: "transparent"
        border.color: "transparent"
        width: parent.height
        height: parent.height
        anchors.right: parent.right
        z: parent.z + 1

        Image {
            id: closeIcon
            source: "qrc:/icon/close.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit()
            }
        }
    }

    MouseArea {

        anchors.fill: titleBar

        acceptedButtons: Qt.LeftButton

        onPressed: {
            rootWindow.rootWindowTitleMousePos = Qt.point(mouseX,mouseY)
            rootWindow.isMoveWindow = true
        }

        onReleased: {
            if(mouse.button === Qt.LeftButton){

                rootWindow.isMoveWindow = false
            }
        }

        onMouseXChanged: {
            if(rootWindow.isMoveWindow){

                rootWindow.x += mouseX - rootWindow.rootWindowTitleMousePos.x;
            }
        }

        onMouseYChanged: {
            rootWindow.y += mouseY - rootWindow.rootWindowTitleMousePos.y;
        }
}
}
