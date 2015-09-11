import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1
import Mut.Layouts 0.1
import Mut.ListItems 0.1


ApplicationWindow {
    id: app

    title: qsTr("Mut App")
    visible: true

    pageStack.initialItem: page1
    pageStack.onCurrentItemChanged: drawer.close()
    pageStack.focus: !drawer.opened

    Component.onCompleted: {
        Theme.imageAssetsPath = "qrc:///icons/";
    }

    property list<Action> actions: [
        Action {
            text: "Item 1"
            iconSource: Qt.resolvedUrl("./icons/apps.svg")
            onTriggered: {
                console.log("NavDrawer action 1");
            }
        },
        Action {
            text: "Item 2"
            iconSource: Qt.resolvedUrl("./icons/hamburger.svg")
            onTriggered: {
                console.log("NavDrawer action 2");
            }
        },
        Action {
            text: "Dialogs"
            iconSource: Qt.resolvedUrl("./icons/hamburger.svg")
            onTriggered: pageStack.push(Qt.resolvedUrl("DialogsPage.qml"))
        }
    ]

    NavDrawer {
        id: drawer
        focus: drawer.opened

        ListView {
            anchors.fill: parent
            model: app.actions

            delegate: SingleLineItem {
                text: model.text
                primaryAction: modelData
            }
        }
    }

    Component {
        id: page1

        Page {
            title: qsTr("NavDrawer")

            navAction: Action {
                iconSource: Qt.resolvedUrl("./icons/hamburger.svg")
                onTriggered: {
                    drawer.toggle();
                }
            }

            actions: [
                Action {
                    iconSource: Qt.resolvedUrl("./icons/apps.svg")
                },
                Action {
                    iconSource: Qt.resolvedUrl("./icons/more_vert.svg")
                    onTriggered: {
                        push(page2);
                    }
                },
                Action {
                    iconSource: Qt.resolvedUrl("./icons/more_vert.svg")
                    onTriggered: {
                        push(page3);
                    }
                },
                Action {
                    iconSource: Qt.resolvedUrl("./icons/more_vert.svg")
                    onTriggered: {
                        push(page4);
                    }
                }
            ]
        }
    }

    Component {
        id: page2

        Page {
            title: qsTr("ListViews")

            Paper {
                anchors.fill: parent

                ListView {
                    anchors.fill: parent
                    model: 5

                    delegate: SingleLineItem {
                        text: "Single line item"
                        primaryAction: Action {
                            iconSource: Qt.resolvedUrl("./icons/apps.svg")
                            onTriggered: {
                                console.log("primary")
                            }
                        }
                        secondaryAction: Action {
                            iconSource: Qt.resolvedUrl("./icons/apps.svg")
                            onTriggered: {
                                console.log("secondary")
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: page3

        Page {
            title: qsTr("Components")

            Item {
                anchors.fill: parent
                anchors.margins: Units.dp(16)
                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: Units.dp(24)

                    TextField {
                        placeholderText: "Enter your username"
                        style: NormalTextFieldStyle {}
                    }

                    TextField {
                        placeholderText: "Enter your password"
                        hintText: "This is an hint"
                        hasError: text === "error"

                        style: FloatingTextFieldStyle {}
                    }

                    // flat button
                    Button {
                        text: qsTr("excellent")
                        style: FlatButtonStyle {}
                        onClicked: {
                            pop();
                        }
                    }

                    // raised button
                    Button {
                        text: qsTr("pupp")
                        style: RaisedButtonStyle {}
                    }
                    // raised button
                    Button {
                        text: qsTr("foobar")
                        style: RaisedButtonStyle {}
                        enabled: false
                    }

                    Button {
                        iconSource: Qt.resolvedUrl("./icons/apps.svg")
                        style: ActionButtonStyle {}
                    }
                    Switch {
                        style: SwitchStyle {}
                    }
                    Switch {
                        enabled: false
                        style: SwitchStyle {}
                    }
                    CheckBox {
                        style: CheckBoxStyle {}
                        text: "Enabled"
                    }
                    CheckBox {
                        style: CheckBoxStyle {}
                        enabled: false
                        text: "Disabled"
                    }
                    CheckBox {
                        style: CheckBoxStyle {}
                        enabled: false
                        checked: true
                        text: "Disabled checked"
                    }
                    DoubleLineItem {
                        primaryText: "TEEXT"
                        secondaryText: "teeeext"
                    }

                    Rectangle {
                        width: Units.dp(48); height: Units.dp(48)
                        color: "blue"
                        Icon {
                            image.source: Qt.resolvedUrl("./icons/apps.svg")
                        }
                    }
                    Icon {
                        image.source: Qt.resolvedUrl("./icons/apps.svg")
                        colorOverlay: 'red'
                    }
                    Paper {
                        width: Units.dp(200); height: Units.dp(100)
                        elevation: 2

                        Surface {
                            anchors.fill: parent
                        }
                    }
                    Card {
                        width: Units.dp(200); height: Units.dp(200)
                    }
                }
            }
        }
    }

    Component {
        id: page4

        Page {
            id: layoutPage
            title: qsTr("Layouting")

            property int model: 3

            Component {
                id: layout_landscape

                RowLayout {
                    anchors.margins: 20

                    Repeater {
                        model: layoutPage.model
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#5d5b59"

                            Label {
                                anchors.centerIn: parent
                                text: "I'm a box!"
                                color: "white"
                            }
                        }
                    }
                }
            }

            Component {
                id: layout_portrait

                ColumnLayout {
                    anchors.margins: 20

                    Repeater {
                        model: layoutPage.model

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#5d5b59"

                            Label {
                                anchors.centerIn: parent
                                text: "I'm a box!"
                                color: "white"
                            }
                        }
                    }
                }
            }

            ConditionalLayout {
                anchors.fill: parent
                when: app.width > 600 ? 1 : 0

                layouts: [
                    layout_portrait,
                    layout_landscape
                ]
            }
        }
    }
}

