import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: rootWindow
    width: 400
    height: 300
    visible: true
    color: '#444444'
    title: qsTr("LunaTestTitleBar")
    flags: Qt.Window | Qt.FramelessWindowHint
    property point rootWindowTitleMousePos: Qt.point(x,y)
    property bool isMoveWindow: false

    TitleBar {
        id: customTitleBar
        width: parent.width
    }
}
