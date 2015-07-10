import QtQuick 2.4
import Mut 0.1

MouseArea {
    id: surface
    clip: true

    onPressed: {
        ripple.startX = mouse.x;
        ripple.startY = mouse.y;
        ripple.opacity = 1;
    }
    onCanceled: {
        ripple.opacity = 0;
        ripple.radius = 0;
    }
    onReleased: {
        ripple.opacity = 0;
        ripple.radius = 0;
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.05)
        opacity: surface.pressed

        Behavior on opacity {
            NumberAnimation {}
        }
    }
    Rectangle {
        id: ripple
        property int startX;
        property int startY;

        x: startX - radius; y: startY - radius
        width: radius*2; height: radius*2
        radius: 0

        color: Qt.rgba(0, 0, 0, 0.05)
        opacity: 0

        Behavior on opacity {
            NumberAnimation {}
        }
        SmoothedAnimation on radius {
            to: Math.max(surface.width, surface.height)
            running: surface.pressed
            velocity: Units.dp(100)
        }
    }
}
