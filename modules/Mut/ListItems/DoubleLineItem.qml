import QtQuick 2.4
import QtQuick.Controls 1.3

import Mut 0.1
import Mut.Themes 0.1
import Mut.Styles 0.1

Tile {
    id: root
    height: Units.dp(72)

    property string primaryText
    property string secondaryText
    property Action primaryAction
    property Action secondaryAction

    primaryComponent: Item {
        anchors.fill: parent
        Icon {
            id: __icon
            visible: root.primaryAction

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
            }

            image.source: root.primaryAction ? root.primaryAction.iconSource : ""
            colorOverlay: Theme.p.dark.icon
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            width: secondaryAction ? parent.width - Units.dp(48) : parent.width

            Text {
                id: __primaryText
                elide: Text.ElideRight
                width: parent.width

                text: root.primaryText
                font.pixelSize: Units.sp(16)
            }

            Text {
                id: __secondaryText
                color: Theme.p.textSecondary
                width: parent.width
                elide: Text.ElideRight

                text: root.secondaryText
                font.pixelSize: Units.dp(14)
            }
        }
    }

    secondaryComponent: Button {
        visible: secondaryAction
        enabled: secondaryAction

        action: secondaryAction
        style: ToolButtonStyle {
            palette: Theme.p.flatButton
        }
    }

    Surface {
        anchors.fill: parent
        anchors.right: secondaryComponent.left
        onClicked: primaryAction.trigger()
        enabled: root.primaryAction
        visible: enabled
    }
}


