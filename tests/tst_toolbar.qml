import QtQuick 2.4
import QtTest 1.0

import Mut 0.1
import Mut.Themes 0.1

TestCase {
    id: testCase
    name: "Tests_ToolBar"

    /* tests that the default value of the properties are correct */
    function test_defaults() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; ToolBar {id: toobar1}',
            testCase, '');

        Theme.p.primary = "blue";
        compare(tmp.backgroundColor, "#0000ff");
        Theme.p.primary = "red";
        compare(tmp.backgroundColor, "#ff0000");

        compare(tmp.elevation, 0);
        compare(tmp.fillWidth, false);
        tmp.destroy()
    }
}
