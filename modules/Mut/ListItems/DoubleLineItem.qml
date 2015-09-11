import QtQuick 2.4
import QtQuick.Controls 1.3

import Mut 0.1
import Mut.Themes 0.1
import Mut.Styles 0.1

Tile {
    id: root

    property string primaryText
    property string secondaryText
    property Action primaryAction
    property Action secondaryAction

    primaryComponent: Item {
        Icon {
            id: __icon

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
            }

            image.source: root.primaryAction.iconSource
            colorOverlay: Theme.p.dark.icon
        }

        Text {
            id: __primaryText

            anchors {
                left: parent.left
                leftMargin: __icon.image.source != Qt.resolvedUrl("") ? Units.dp(56) : 0
            }

            text: root.primaryText
            font.pixelSize: Units.sp(16)
        }

        Text {
            id: __secondaryText
            anchors {
                left: parent.left
                leftMargin: __icon.image.source != Qt.resolvedUrl("") ? Units.dp(56) : 0
            }

            text: root.secondaryText
            font.pixelSize: Units.dp(14)
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
        onClicked: primaryAction.trigger()
    }
}


