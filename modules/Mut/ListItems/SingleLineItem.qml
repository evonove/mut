import QtQuick 2.4
import QtQuick.Controls 1.3

import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1

/*! \qmltype SingleLineItem
    \inqmlmodule Mut.ListItems 0.1

    \brief Provides the single-line list component.

    SingleLineItem implements the text only item type, providing a Text
    component as a `primaryComponent` and a Button as a supplemental action.
    Exposed properties are:
    * `text`: is the `primaryComponent` text
    * `primaryAction`: defines the triggered action when users click the line; it
      should be a Qt.Action
    * `secondaryAction`: defines the icon and the triggered action for the
      supplemental action; it should be a Qt.Action

    SingleLineItem includes a material `Surface` area, which `onClicked` handler is
    bounded to `primaryAction.trigger` method.

    \qml
    import QtQuick 2.4
    import QtQuick.Controls 1.3

    import Mut 0.1
    import Mut.ListItems 0.1

    ListView {
        anchors.fill: parent
        model: 5

        delegate: SingleLineItem {
            text: "Single line item"
            primaryAction: Action {
                iconSource: Qt.resolvedUrl("./icons/folder.svg")
                onTriggered: {
                    console.log("Primary action")
                }
            }
            secondaryAction: Action {
                iconSource: Qt.resolvedUrl("./icons/star.svg")
                onTriggered: {
                    console.log("Secondary action")
                }
            }
        }
    }
    \endqml
*/
Tile {
    id: root

    property string text
    property Action primaryAction
    property Action secondaryAction

    primaryComponent: Item {
        Row {
            anchors.fill: parent

            spacing: Units.dp(16)
            Icon {
                id: __icon
                visible: root.primaryAction

                anchors.verticalCenter: parent.verticalCenter
                image.source: root.primaryAction.iconSource
                colorOverlay: Theme.p.dark.icon
            }

            Text {
                id: __text

                anchors.verticalCenter: parent.verticalCenter
                width: parent.width - __icon.width
                text: root.text
                elide: Text.ElideRight
                font.pixelSize: Units.sp(16)
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
        onClicked: primaryAction.trigger()
    }
}
