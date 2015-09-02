import QtQuick 2.5
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.3 
import Mut 0.1

CheckBoxStyle {
    id: style

    property color color: "black"
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
                onPressed: labelRectangle.color = "black"
                onReleased: labelRectangle.color = "white"
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

            Item {
                id: container

                anchors.centerIn: indicatorRect

                height: parent.height
                width: parent.width

                opacity: control.checked ? 1 : 0

                property int thickness: Units.dp(3)

                Behavior on opacity {
                    NumberAnimation {
                        easing.type: Easing.InOutQuad
                        duration: 200
                    }
                }

                Rectangle {
                    id: vert

                    anchors {
                        top: parent.top
                        right: parent.right
                        bottom: parent.bottom
                    }

                    radius: Units.dp(1)
                    color: "#FFFFFF"
                    width: container.thickness * 2
                }

                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }

                    radius: Units.dp(1)
                    color: "#FFFFFF"
                    height: container.thickness

                }

                transform: [
                    Scale {
                        origin { x: container.width / 2; y: container.height / 2 }
                        xScale: 0.5
                        yScale: 1
                    },
                    Rotation {
                        origin { x: container.width / 2; y: container.height / 2 }
                        angle: 45;
                    },
                    Scale {
                        id: widthScale

                        origin { x: container.width / 2; y: container.height / 2 }
                        xScale: control.checked ? 0.6 : 0.2
                        yScale: control.checked ? 0.6 : 0.2

                        Behavior on xScale {
                            NumberAnimation {
                                easing.type: Easing.InOutQuad
                                duration: 200
                            }
                        }

                        Behavior on yScale {
                            NumberAnimation {
                                easing.type: Easing.InOutQuad
                                duration: 200
                            }
                        }
                    },
                    Translate { y: -(container.height - (container.height * 0.9)) }
                ]
            }
        }
    }
}

