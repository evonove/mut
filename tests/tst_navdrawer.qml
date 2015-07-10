import QtQuick 2.4
import QtQuick.Controls 1.3
import QtTest 1.0

import Mut 0.1

Item {
    id: container
    width: 800; height: 600

    NavDrawer {
        id: drawer
        focus: true
    }

    TestCase {
        id: testCase
        name: "Tests_NavDrawer"
        when: windowShown
        width: 800; height: 600

        function initTestCase() {
            Units.pixelDensity = 5;
        }

        /* it should be closed as default */
        function test_state_default() {
            compare(drawer.state, "DRAWER_CLOSED");
        }

        /* it should change the current state when open() is called */
        function test_state_open() {
            drawer.open();
            compare(drawer.state, "DRAWER_OPENED");
            drawer.state = "DRAWER_CLOSED";
        }

        /* it should change the current state when close() is called */
        function test_state_close() {
            drawer.state = "DRAWER_OPENED";
            drawer.close();
            compare(drawer.state, "DRAWER_CLOSED");
        }

        /* it should expose a toggle() state that opens and closes the component */
        function test_state_toggle() {
            drawer.toggle();
            compare(drawer.state, "DRAWER_OPENED");
            drawer.toggle();
            compare(drawer.state, "DRAWER_CLOSED");
        }

        /* it should close the component when the Scrim is clicked */
        function test_close_on_scrim_click() {
            drawer.state = "DRAWER_OPENED";

            // transitions require this wait otherwise the Scrim is not ready to
            // accept events
            wait(150);

            mouseClick(container);
            compare(drawer.state, "DRAWER_CLOSED");
        }

        /* it should expose two status getters */
        function test_state_getters() {
            drawer.state = "DRAWER_OPENED";
            verify(drawer.opened);
            drawer.state = "DRAWER_CLOSED";
            verify(!drawer.opened);
        }

        /* the ESC button should close the drawer */
        function test_esc_button() {
            drawer.state = "DRAWER_OPENED";
            keyClick(Qt.Key_Escape);
            compare(drawer.state, "DRAWER_CLOSED");
        }

        /* the mobile back button should close the drawer */
        function test_back_button() {
            drawer.state = "DRAWER_OPENED";
            keyClick(Qt.Key_Back);
            compare(drawer.state, "DRAWER_CLOSED");
        }
    }
}
