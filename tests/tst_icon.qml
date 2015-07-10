import QtQuick 2.4
import QtTest 1.0

import Mut 0.1

Item {
    id: container
    width: 300; height: 300

    TestCase {
        id: testCase
        name: "Tests_Icon"
        when: windowShown

        function initTestCase() {
            Units.pixelDensity = 5.0;
        }

        /* tests that the default value of the properties are correct */
        function test_defaults() {
            var tmp = Qt.createQmlObject(
                'import QtQuick 2.4; import Mut 0.1;' +
                'Icon {id: icon1; image.source: Qt.resolvedUrl("test.svg")}',
                testCase, '');
            compare(tmp.image.visible, false);
            tmp.destroy();
        }

        function benchmark_overlayicon_transparent() {
            var tmp = Qt.createQmlObject(
                'import QtQuick 2.4; import Mut 0.1;' +
                'Icon {id: icon2; image.source: Qt.resolvedUrl("test.svg")}',
                testCase, '');
            tmp.destroy();
        }
        function benchmark_overlayicon_solid() {
            var tmp = Qt.createQmlObject(
                'import QtQuick 2.4; import Mut 0.1;' +
                'Icon {id: icon3; colorOverlay: "#ff0000";' +
                'image.source: Qt.resolvedUrl("test.svg")}',
                testCase, '');
            tmp.destroy();
        }
        function benchmark_normal_image() {
            var tmp = Qt.createQmlObject(
                'import QtQuick 2.4; import Mut 0.1;' +
                'Image {' +
                'sourceSize {height: Units.dp(24); width: Units.dp(24)}' +
                'anchors.centerIn: parent; smooth: false;' +
                'source: Qt.resolvedUrl("test.svg")}',
                testCase, '');
            tmp.destroy();
        }
    }
}

