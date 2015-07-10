import QtQuick 2.4
import QtTest 1.0

import Mut 0.1
import Mut.Themes 0.1

TestCase {
    id: testCase
    name: "Tests_AppBar"

    function initTestCase() {
        Units.pixelDensity = 5.0;
    }

    /* tests that the default value of the properties are correct */
    function test_defaults() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; AppBar {id: appbar1}',
            testCase, '');

        compare(tmp.defaultNavAction, null);
        compare(tmp.elevation, 2);
        compare(tmp.fillWidth, true);
        tmp.destroy();
    }

    /* tests that appbar is resized properly when device size and
       screen orientation changes.
    */
    function test_implicitHeight() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; AppBar {id: appbar1}',
            testCase, '');

        Device.size = Device.sizeXLarge;
        compare(tmp.implicitHeight, Units.dp(64));

        Device.size = Device.sizeNormal;
        Device.primaryOrientation = Qt.PortraitOrientation;
        compare(tmp.implicitHeight, Units.dp(56));

        Device.primaryOrientation = Qt.LandscapeOrientation;
        compare(tmp.implicitHeight, Units.dp(48));

        tmp.destroy();
    }

    function test_defaultNavAction() {
        var tmp = Qt.createQmlObject(
            'import QtQuick.Controls 1.3; import Mut 0.1;' +
            'AppBar {id: appbar1; defaultNavAction: Action {}}',
            testCase, '');
        tmp.destroy();
    }
}
