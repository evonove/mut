import QtQuick 2.4
import QtTest 1.0

import Mut 0.1
import Mut.Layouts 0.1

Item {
    id: container
    width: 300; height: 300

    Component {
        id: small

        Item {
            Rectangle { width: 80; height: 80; border.width: 1 }
        }
    }

    Component {
        id: normal

        Item {
            Rectangle { width: 80; height: 80; border.width: 1 }
        }
    }

    Component {
        id: large

        Item {
            Rectangle { width: 80; height: 80; border.width: 1 }
        }
    }

    DeviceLayout {
        id: layout
    }

    TestCase {
        id: testCase
        name: "Tests_DeviceLayout"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5;
            layout.layouts = [small, normal, large]
        }

        /* it should use the right layout according to device size */
        function test_size_layout() {
            Device.size = Device.sizeSmall;
            compare(layout.activeComponent, small);
            Device.size = Device.sizeNormal;
            compare(layout.activeComponent, normal);
            Device.size = Device.sizeLarge;
            compare(layout.activeComponent, large);
        }

        /* it should use the layout that best fits the device size */
        function test_size_fallback_layout() {
            Device.size = Device.sizeXLarge;
            compare(layout.activeComponent, large);
        }
    }
}
