import QtQuick 2.4

import Mut 0.1
import Mut.Themes 0.1

/*! \qmltype Tile
    \inqmlmodule Mut.ListItems 0.1

    \brief Provides the Tile component used in material lists.

    Tile component uses two \l {QtQuick::Loader} to render a primary component
    and a secondary component. Exposed properties are:
    * `backgroundColor`: defines the Tile background color
    * `primaryComponent`: is the Loader sourceComponent
    * `secondaryComponent`: is the Loader sourceComponent

    The primary component owns the majority of line space, while the secondary
    component should be considered as a right button that provides a
    supplemental action.

    Tile is a base component required to realize Lists Components such as
    `SingleLineItem`, `TwoLineItem`, `ThreeLineItem`

    \qml
    import QtQuick 2.4
    import QtQuick.Controls 1.3

    import Mut 0.1
    import Mut.Styles 0.1
    import Mut.Themes 0.1

    Tile {
        id: root

        primaryComponent: Text {
            text: "Hello world!"
            font.pixelSize: Units.sp(16)
        }

        secondaryComponent: Button {
            action: secondaryAction
            style: ToolButtonStyle {
                palette: Theme.p.flatButton
            }
        }

        Surface {
            anchors.fill: parent
            onClicked: "Are you clicking me?!"
        }
    }
    \endqml
*/
FocusScope {
    id: tile

    implicitHeight: Units.dp(48)
    implicitWidth: parent.width

    property alias backgroundColor: background.color
    property Component primaryComponent
    property Component secondaryComponent

    Rectangle {
        id: background
        anchors.fill: parent

        color: "transparent"
    }

    Loader {
        id: __primary

        sourceComponent: primaryComponent

        anchors {
            left: parent.left
            right: __secondary.sourceComponent ? __secondary.left : parent.right
            leftMargin: Units.dp(16)
            rightMargin: Units.dp(16)
            verticalCenter: parent.verticalCenter
        }
    }

    Loader {
        id: __secondary
        width: Units.dp(48)

        sourceComponent: secondaryComponent

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            leftMargin: Units.dp(16)
            rightMargin: Units.dp(16)
        }

        z: 1
    }
}
