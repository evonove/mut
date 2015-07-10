import QtQuick 2.4
import QtQuick.Controls 1.3 as Controls
import QtQuick.Window 2.2

import Mut 0.1
import Mut.Themes 0.1

/*! \qmltype ApplicationWindow
    \inqmlmodule Mut 0.1
    \ingroup applicationwindow

    \brief Provides a top-level application window.

    ApplicationWindow extends \l {QtQuick.Controls::ApplicationWindow} that adds
    convenience for sizing items and components.

    \qml
    import QtQuick 2.4
    import Mut 0.1

    ApplicationWindow {
        title: "Application Name"

        width: Units.dp(800)
        height: Units.dp(600)
    }
    \endqml
*/
Controls.ApplicationWindow {
    id: app

    width: 800
    height: 600

    color: Theme.p.background

    /*!
        \qmlproperty AppBar ApplicationWindow::appBar

        This property holds the \l AppBar.

        By default, this value is set and the page property is bound to currentItem
        of the page stack.

        Note that the default toolBar property is bound to the appBar so developers
        should only interact with the appBar property.
    */
    property AppBar appBar: AppBar {
        id: appBar
        page: __stack.currentItem
    }

    toolBar: appBar

    property alias pageStack: __stack

    Controls.StackView {
        id: __stack
        anchors.fill: parent

        Keys.onReleased: {
            if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
                if (__stack.depth > 1) {
                    __stack.pop();
                    event.accepted = true;
                }
            }
        }
    }

    Component.onCompleted: {
        /* FIXME: both Units and Device should be implemented at C++
           level. It's easier to bind and change values from QScreen */
        Units.pixelDensity = Qt.binding(function() { return Screen.pixelDensity; });
        initDevice();
    }

    function initDevice() {
        Device.primaryOrientation = Qt.binding(function () { return Screen.primaryOrientation; });
        Device.size = Qt.binding(function() {
            var dpWidth = Units.pxToDp(Screen.width);
            var dpHeight = Units.pxToDp(Screen.height);

            var minLength = Math.min(dpWidth, dpHeight);
            var maxLength = Math.max(dpWidth, dpHeight);

            // set the device size
            if (maxLength >= "960" && minLength >= "720")
                return Device.sizeXLarge;
            else if (maxLength >= "640" && minLength >= "480")
                return Device.sizeLarge;
            else if (maxLength >= "470" && minLength >= "320")
                return Device.sizeNormal;
            else // if (maxLength >= "426" && minLength >= "320")
                return Device.sizeSmall;
        });
    }
}
