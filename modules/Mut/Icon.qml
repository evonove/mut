import QtQuick 2.4
import QtGraphicalEffects 1.0

import Mut 0.1

Item {
    implicitWidth: __image.implicitWidth
    implicitHeight: __image.implicitHeight

    property alias image: __image
    property color colorOverlay: "transparent"

    Image {
        id: __image
        smooth: false
        sourceSize {
            height: Units.dp(24)
            width: Units.dp(24)
        }
        anchors.centerIn: parent

        visible: false
    }

    ColorOverlay {
        id: __overlay
        anchors.fill: image
        source: image
        cached: true

        color: Qt.rgba(colorOverlay.r, colorOverlay.g, colorOverlay.b)
        opacity: colorOverlay.a
    }
}

