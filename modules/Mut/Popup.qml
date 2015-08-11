import QtQuick 2.4
import QtQuick.Window 2.2

Item {
    id: root
    property Item __lastFocus
    property Item __popupInstance

    function open() {
        __lastFocus = Window.activeFocusItem;
        __popupInstance = root.content.createObject(Window.contentItem, {"focus": "true"});
    }

    function close() {
        __lastFocus.forceActiveFocus();
        __popupInstance.destroy();
    }

    property Component content: null
}

