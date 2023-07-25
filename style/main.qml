import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Window {
    width: 640
    height: 480
    visible: true

    Row{
        BusyIndicator {
            running: true
            Material.accent: "#3BB8F7"

        }
        BusyIndicator {
            running: true
            Material.accent: "#68C421"

        }
        BusyIndicator {
            running: true
            Material.accent: "#FFB247"

        }
        BusyIndicator {
            running: true
            Material.accent: "#FF4935"

        }
    }
}
