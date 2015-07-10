import QtQuick 2.4
import QtTest 1.0

import Mut 0.1


TestCase {
    id: testCase
    name: "Tests_Paper"

    function initTestCase() {
        Units.pixelDensity = 5.0;
    }

    /* tests that the default value of the properties are correct */
    function test_defaults() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; Paper {id: paper1}',
            testCase, '');
        compare(tmp.elevation, 0);
        compare(tmp.fillWidth, false);
        compare(tmp.fillHeight, false);
        tmp.destroy()
    }

    /* tests that effect's properties change accordingly to elevation
     * attribute */
    function test_elevation() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; Paper {id: paper1}',
            testCase, '');
        compare(tmp.children[0].glowRadius, 0);  // topEffect
        compare(tmp.children[1].glowRadius, 0);  // bottomEffect

        tmp.elevation = 1.0;
        compare(tmp.children[0].glowRadius, 2.0);  // topEffect
        compare(tmp.children[1].glowRadius, 1.0);  // bottomEffect

        tmp.destroy();
    }

    /* tests that there is no shadow when elevation is 0 */
    function test_no_shadow_when_elevation_is_zero() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; ' +
            'Paper {id: paper1; elevation: 0}',
            testCase, '');
        compare(tmp.__hasShadow, false);
        compare(tmp.children[0].visible, false);
        compare(tmp.children[1].visible, false);
    }

    /* tests that there is no shadow when paper background is
     * transparent */
     function test_no_shadow_when_transparent() {
        var tmp = Qt.createQmlObject(
            'import Mut 0.1; ' +
            'Paper {id: paper1; backgroundColor: "transparent"}',
            testCase, '');
        compare(tmp.__hasShadow, false);
        compare(tmp.children[0].visible, false);
        compare(tmp.children[1].visible, false);
     }
}
