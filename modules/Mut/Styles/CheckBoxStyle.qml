import QtQuick 2.5
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.3 
import Mut 0.1
import Mut.Themes 0.1

CheckBoxStyle {
    id: root 

    spacing: 0
    property CheckBoxPalette palette: Theme.p.checkBox
    property bool disabled

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
        implicitHeight: implicitWidth

        Rectangle {
            id: indicatorRect

            color: control.checked ? root.palette.backgroundSelected : root.palette.backgroundUnselected

            anchors.centerIn: parent
            anchors.right: text.left

            border.width: Units.dp(2)
            border.color: control.checked ? root.palette.borderSelected : root.palette.borderUnselected 

            width: Units.dp(18)
            height: width
            radius: Units.dp(2)

            Behavior on color {
                ColorAnimation {
                    easing.type: Easing.InOutQuad
                    duration: 200
                }
            }

            Behavior on border.color {
                ColorAnimation {
                    easing.type: Easing.InOutQuad
                    duration: 200
                }
            }

            Icon {
                anchors.centerIn: parent
                image.source: Theme.image("done.svg")
                image.visible: true
                image.smooth: true
                image.opacity: control.checked ? 1 : 0
                image.width: Units.dp(17)
                image.height: Units.dp(17)
                colorOverlay: "#FFFFFF"

                Behavior on opacity {
                    NumberAnimation {
                        easing.type: Easing.InOutQuad
                        duration: 200
                    }
                }
            }
        }
    }
}

