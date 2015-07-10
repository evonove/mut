import QtQuick 2.4
import QtQuick.Controls.Styles 1.3
import Mut 0.1
import Mut.Themes 0.1

SwitchStyle {
    id: style

    property SwitchPalette palette: Theme.p.switchToggle

    property color thumbColor: {
        control.enabled ?
            control.checked ? palette.thumbOn : palette.thumbOff
        : palette.thumbDisabled
    }
    property color trackColor: {
        control.enabled ?
            control.checked ? palette.trackOn : palette.trackOff
        : palette.trackDisabled
    }

    handle: Item {
        width: Units.dp(24)
        height: Units.dp(24)
        Paper {
            anchors.centerIn: parent
            width: control.pressed ? Units.dp(56) : Units.dp(24)
            height: width

            radius: width/2

            backgroundColor: style.trackColor
            opacity: control.pressed ? 0.4 : 0

            Behavior on width {
                NumberAnimation {duration: 500}
            }
            Behavior on opacity {
                NumberAnimation {duration: 500}
            }
        }
        Paper {
            anchors.centerIn: parent
            width: Units.dp(24)
            height: Units.dp(24)
            radius: width/2
            circular: true

            elevation: 1
            backgroundColor: style.thumbColor
        }
    }

    groove: Item {
        width: Units.dp(42)
        height: Units.dp(24)

        Rectangle {
            anchors.centerIn: parent

            width: parent.width - Units.dp(2)
            height: Units.dp(16)

            radius: height/2

            color: style.trackColor

            Behavior on color {
                ColorAnimation {duration: 200}
            }
        }
    }
}
