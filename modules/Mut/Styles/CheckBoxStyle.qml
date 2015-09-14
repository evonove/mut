import QtQuick 2.5
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.3 
import Mut 0.1
import Mut.Themes 0.1

CheckBoxStyle {
    id: root 

    spacing: 0
    property CheckBoxPalette palette: Theme.p.checkBox
    property color backgroundColor: {
        control.checked ?
            control.enabled ? palette.backgroundSelected : palette.backgroundSelectedDisabled
        : palette.backgroundUnselected
    }

    property color borderColor: {
        control.checked ? palette.backgroundUnselected :
        control.enabled ? palette.borderEnabled : palette.borderDisabled
    }

    label: Rectangle {
        id: labelRectangle
        height: Units.dp(48)

        Text {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            text: control.text
        
            MouseArea {
                anchors.fill: parent
                onClicked: control.checked = !control.checked
            }
        }
    }
    
    indicator: Item {
        id: parentRect
            
        implicitWidth: Units.dp(48)
        implicitHeight: Units.dp(48)

        Rectangle {
            id: indicatorRect

            color: root.backgroundColor

            anchors.centerIn: parent

            border.width: Units.dp(2)
            border.color: root.borderColor

            width: Units.dp(18)
            height: Units.dp(18)
            radius: Units.dp(2)

            Behavior on color {
                ColorAnimation {
                    easing.type: Easing.InOutQuad
                    duration: 200
                }
            }

            Icon {
                anchors.centerIn: parent
                image.source: Theme.image("check.svg")
                image.visible: true
                image.smooth: true
                image.opacity: control.checked ? 1 : 0
                image.width: Units.dp(18)
                image.height: Units.dp(18)
                colorOverlay: root.palette.iconOverlay
            }
        }
    }
}

