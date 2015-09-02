import QtQuick 2.5
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.3 
import Mut 0.1

CheckBoxStyle {
    id: style

    spacing: 0

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

            color: control.checked ? "#0D9B56" : "transparent"

            anchors.centerIn: parent
            anchors.right: text.left

            border.width: Units.dp(2)
            border.color: control.checked ? "#0D9B56" : "#7B7B7B" 

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

            Image {
                source: control.source 
                anchors.centerIn: indicatorRect

                height: parent.height
                width: parent.width

                opacity: control.checked ? 1 : 0

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

