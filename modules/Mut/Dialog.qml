import QtQuick 2.4
import QtQuick.Window 2.2

Item {
    id: root
    property Item __lastFocus
    property Item __dialogInstance

    function open() {
        __lastFocus = Window.activeFocusItem;
        __dialogInstance = __panel.createObject(Window.contentItem, {"focus": "true"});
    }

    function close() {
        __lastFocus.forceActiveFocus();
        __dialogInstance.destroy();
    }

    property Component __panel: Component {
        Scrim {
            id: __dialogRoot
            anchors.fill: parent

            onClicked: root.close()

            Loader {
                anchors.centerIn: parent
                sourceComponent: root.dialogComponent
                focus: true
            }

            Keys.onReleased: {
                if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
                    root.close();
                    event.accepted = true;
                }
            }
        }
    }

    property Component dialogComponent: null
}

