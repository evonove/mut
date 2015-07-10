import QtQuick 2.4
import QtQuick.Controls.Styles 1.3 as Styles

import Mut 0.1
import Mut.Themes 0.1

Styles.ButtonStyle {
    id: root

    property real elevation

    property ButtonPalette palette

    /*! \internal */
    property color backgroundColor: {
        if (!control.enabled)
            root.palette.disabled;
        else if (control.pressed)
            root.palette.pressed;
        else if (control.hovered)
            root.palette.hovered;
        else
            root.palette.normal;
    }

    property color iconColor: {
        control.enabled ? root.palette.icon : root.palette.textDisabled
    }

    /*! \internal */
    property color textColor: {
        control.enabled ? root.palette.text : root.palette.textDisabled
    }

    padding {
        left: Units.dp(12)
        right: Units.dp(12)
        top: 0
        bottom: 0
    }
    background: Item {
        id: background
        implicitWidth: Units.dp(88)
        implicitHeight: Units.dp(48)

        Paper {
            implicitWidth: background.width
            implicitHeight: Units.dp(36)
            anchors.centerIn: parent
            radius: Units.dp(1)
            elevation: control.enabled ? root.elevation : 0
            backgroundColor: root.backgroundColor
        }
    }
    label: Item {
        implicitWidth: row.implicitWidth
        implicitHeight: row.implicitHeight

        Row {
            id: row
            anchors.centerIn: parent
            spacing: 2

            Icon {
                id: icon
                anchors.verticalCenter: parent.verticalCenter

                image.source: control.iconSource
                colorOverlay: root.iconColor
            }

            Text {
                id: text
                anchors.verticalCenter: parent.verticalCenter
                text: control.text

                color: root.textColor
                font {
                    capitalization: Font.AllUppercase
                    pixelSize: Units.sp(14)
                    weight: Font.DemiBold
                }
            }
        }
    }
}
