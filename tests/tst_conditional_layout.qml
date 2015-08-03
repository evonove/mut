import QtQuick 2.4
import QtTest 1.0

import Mut 0.1
import Mut.Layouts 0.1

Item {
    id: container
    width: 300; height: 300

    Component {
        id: first_layout

        Item {
            Rectangle { width: 80; height: 80; border.width: 1 }
        }
    }

    Component {
        id: second_layout

        Item {
            Rectangle { width: 80; height: 80; border.width: 1 }
        }
    }

    ConditionalLayout {
        id: layout
    }

    TestCase {
        id: testCase
        name: "Tests_ConditionalLayout"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5;
        }

        /* it shouldn't draw any component */
        function test_no_components() {
            layout.layouts = []
            layout.when = -1
            compare(layout.activeComponent, null);
        }

        /* it should draw the first layout */
        function test_one_layout() {
            layout.layouts = [first_layout]
            layout.when = 0
            compare(layout.activeComponent, first_layout);
        }

        /* it should draw the first layout and the second when 'when' property changes */
        function test_layout_switching() {
            layout.layouts = [first_layout, second_layout]
            layout.when = 0
            compare(layout.activeComponent, first_layout);
            layout.when = 1
            compare(layout.activeComponent, second_layout);
        }

        /* it should fallback to a previous layout if the chosen is not available */
        function test_layout_fallback() {
            layout.layouts = [first_layout, second_layout]
            layout.when = 4
            compare(layout.activeComponent, second_layout);
        }
    }
}
