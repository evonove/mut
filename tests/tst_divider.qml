import QtQuick 2.4
import QtTest 1.0

import Mut 0.1
import Mut.Themes 0.1

TestCase {
    id: testCase
    name: "Tests_Divider"

    function initTestCase() {
        Units.pixelDensity = 5.0;
    }

    /* tests that the default value of the properties are correct */
    function test_defaults() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; Divider {id: divider1}',
            testCase, '');
        compare(tmp.height, Units.dp(1));
        Theme.p.divider = "blue";
        compare(tmp.color, "#0000ff");
        tmp.destroy();
    }
}
