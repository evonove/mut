import QtQuick 2.4

import Mut 0.1

/*! \qmltype NavDrawer
    \inqmlmodule Mut 0.1

    \brief Provides a `NavDrawer` that uses a `Scrim` to prevent any interaction with the components below

    `NavDrawer` component makes use of a \l {Mut::Scrim} as an overlay
    for all underlying components and uses a \l {Mut::Paper} as a main
    container for all `NavDrawer` children.

    As a default behavior, it provides two states:
    * `DRAWER_CLOSED`: the drawer `x` property is set to the far left, while the
      `Scrim` component has 0.0 opacity
    * `DRAWER_OPENED`: the drawer is visible to users, while the `Scrim` component
      has 1.0 opacity. The `Scrim` \l {QtQuick::MouseArea} catches keyboard and
      mouse inputs, preventing any interaction with the components below

    Even if a `NavDrawer` is flexible and can contain any kind of component, the
    Material Design specifications suggest following the keylines and metrics
    for lists.

    \qml
    import QtQuick 2.4
    import QtQuick.Controls 1.3

    import Mut 0.1
    import Mut.ListItems 0.1

    ApplicationWindow {
        id: app

        property list<Action> actions: [
            Action {
                text: "Item 1"
                iconSource: Qt.resolvedUrl("./icon1.svg")
                onTriggered: {
                    console.log("NavDrawer action 1");
                }
            },
            Action {
                text: "Item 2"
                iconSource: Qt.resolvedUrl("./icon2.svg")
                onTriggered: {
                    console.log("NavDrawer action 2");
                }
            }
        ]

        NavDrawer {
            id: drawer

            ListView {
                anchors.fill: parent
                model: app.actions

                delegate: SingleLineItem {
                    text: model.text
                    primaryAction: modelData
                }
            }
        }
    }
    \endqml
*/
FocusScope {
    id: drawer
    state: "DRAWER_CLOSED"

    signal drawerOpened()
    signal drawerClosed()

    default property alias data: __paper.data
    property bool opened: state === "DRAWER_OPENED"

    implicitWidth: parent.width
    implicitHeight: parent.height

    Keys.onReleased: {
        if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
            if (drawer.opened) {
                drawer.close();
                event.accepted = true;
            }
        }
    }

    Scrim {
        id: __scrim

        anchors.fill: parent
        onClicked: drawer.close()
    }

    Paper {
        id: __paper

        implicitHeight: parent.height
        implicitWidth: Units.dp(320)

        elevation: 2
    }

    function open() {
        drawer.state = "DRAWER_OPENED";
        drawerOpened();
    }

    function close() {
        drawer.state = "DRAWER_CLOSED";
        drawerClosed();
    }

    function toggle() {
        if (drawer.opened) {
            drawer.close();
        } else {
            drawer.open();
        }
    }

    states: [
        State {
            name: "DRAWER_OPEN"
            PropertyChanges { target: __paper; x: 0; }
            PropertyChanges { target: __scrim; opacity: 1.0; }
        },
        State {
            name: "DRAWER_CLOSED"
            PropertyChanges { target: __paper; x: Units.dp(-320); }
            PropertyChanges { target: __scrim; opacity: 0.0; }
        }
    ]

    transitions: [
        Transition {
            to: "*"
            NumberAnimation { target: __paper; properties: "x"; duration: 450; easing.type: Easing.OutCubic; }
            NumberAnimation { target: __scrim; properties: "opacity"; duration: 100; easing.type: Easing.Linear; }
        }
    ]
}
