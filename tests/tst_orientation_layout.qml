import QtQuick 2.4
import QtTest 1.0

import Mut 0.1
import Mut.Layouts 0.1

Item {
    id: container
    width: 300; height: 300

    Component {
        id: portrait

        Item {
            Rectangle { width: 80; height: 80; border.width: 1 }
        }
    }

    Component {
        id: landscape

        Item {
            Rectangle { width: 80; height: 80; border.width: 1 }
        }
    }

    OrientationLayout {
        id: layout
    }

    TestCase {
        id: testCase
        name: "Tests_OrientationLayout"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5;
            layout.layouts = [portrait, landscape]
        }

        /* it should use the portrait layout when in portrait mode */
        function test_portrait_layout() {
            Device.primaryOrientation = Qt.PortraitOrientation
            compare(layout.activeComponent, portrait);
        }

        /* it should use the landscape layout when in landscape mode */
        function test_landscape_layout() {
            Device.primaryOrientation = Qt.LandscapeOrientation
            compare(layout.activeComponent, landscape);
        }
    }
}
