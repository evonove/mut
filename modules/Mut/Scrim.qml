import QtQuick 2.4

/*! \qmltype Scrim
    \inqmlmodule Mut 0.1

    \brief Provides a Scrim that creates an opacity overlay over all components

    Scrim implements an overlay over all components. By default, its opacity
    controls the `visible` and `enabled` properties so that when the component
    opacity is 0.0, the Scrim is disabled and not visible in the QML hierarchy.
    On the other hand, when its opacity is 1.0, the Scrim is enabled and its
    `hoverEnabled: true` property prevents any interaction with components
    below.

    To use this component, remember to set its `width`, `height` or `anchors`
    properties.

    \qml
    import QtQuick 2.4

    import Mut 0.1

    FocusScope {
        Scrim {
            anchors.fill: parent
            onClicked: console.log("Scrim is clicked!")
        }
    }
    \endqml
*/
FocusScope {
    id: root
    visible: root.opacity != 0.0
    enabled: root.opacity != 0.0

    property alias background: __background

    signal clicked()

    MouseArea {
        id: __mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()
    }

    Rectangle {
        id: __background
        color: "#000000"
        opacity: 0.54
        anchors.fill: parent
    }
}

