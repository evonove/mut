import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3 as Styles

import Mut 0.1
import Mut.Themes 0.1

Styles.TextFieldStyle {
    id: root

    property TextFieldPalette palette

    property bool floatingLabel: false

    // exposing internal properties
    property color textColor: palette.text
    property color normalColor: palette.normal
    property color pressedColor: palette.pressed
    property color errorColor: palette.error
    property color hintColor: palette.hint
    property color placeholderTextColor: "transparent"

    padding {
        left: 0
        right: 0
        top: Units.dp(16)
        bottom: Units.dp(8)
    }

    font.pixelSize: Units.sp(16)

    background: Item {
        id: __background
        implicitWidth: Units.dp(188)
        implicitHeight: Units.dp(48)

        Rectangle {
            id: underline
            height: control.activeFocus ? Units.dp(2) : Units.dp(1)

            color: control.hasError ? root.errorColor : control.activeFocus ? root.pressedColor : root.normalColor

            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            Behavior on height {
                NumberAnimation { duration: 200 }
            }

            Behavior on color {
                ColorAnimation { duration: 200 }
            }
        }

        Label {
            id: __placeholder

            text: control.placeholderText

            anchors {
                verticalCenter: parent.verticalCenter
                margins: -Units.dp(8)
            }

            font.pixelSize: Units.sp(16)

            color: control.hasError ? root.errorColor : floatingLabel && control.text && control.activeFocus ? root.pressedColor : root.normalColor

            states: [
                State {
                    name: "floating"
                    when: control.displayText.length > 0 && root.floatingLabel

                    AnchorChanges {
                        target: __placeholder
                        anchors {
                            verticalCenter: undefined
                            top: parent.top
                        }
                    }

                    PropertyChanges {
                        target: __placeholder
                        font.pixelSize: Units.dp(12)
                    }
                },
                State {
                    name: "hidden"
                    when: control.displayText.length > 0 && !root.floatingLabel

                    PropertyChanges {
                        target: __placeholder
                        visible: false
                    }
                }
            ]

            transitions: [
                Transition {
                    id: transition
                    enabled: false

                    AnchorAnimation {
                        duration: 200
                    }

                    NumberAnimation {
                        duration: 200
                        property: "font.pixelSize"
                    }
                }
            ]

            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            Component.onCompleted: transition.enabled = true
        }

        RowLayout {
            anchors {
                left: parent.left
                right: parent.right
                top: underline.top
                topMargin: Units.dp(4)
            }

            Label {
                id: __hint
                visible: control.hintText
                text: control.hintText

                font.pixelSize: Units.dp(12)
                color: control.hasError ? root.errorColor : root.hintColor

                Behavior on color {
                    ColorAnimation { duration: 200 }
                }
            }
        }
    }
}
