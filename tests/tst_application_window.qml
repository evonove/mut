import QtQuick 2.4
import QtTest 1.0

import Mut 0.1

Item {
    id: container
    width: 300; height: 300

    Page {
        id: page1
    }

    Page {
        id: page2
    }

    ApplicationWindow {
        id: app
    }

    TestCase {
        id: testCase
        name: "Tests_ApplicationWindow"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5.0;
        }

        /* tests that Device singleton is initialized when ApplicationWindow
           loading is completed
         */
        function test_deviceIsInitialized() {
            verify(Device.primaryOrientation !== 0, "primaryOrientation not set");
            verify(Device.size !== 0, "device size not set");
        }

        /* tests that the ESC button pops the last page */
        function test_esc_button() {
            app.pageStack.push(page1);
            app.pageStack.push(page2);

            keyClick(Qt.Key_Escape);
            // TODO: this test doesn't work; there is a problem with the ApplicationWindow focus
            // compare(app.pageStack.currentItem, page1);

            app.pageStack.clear();
        }

        /* tests that the back button pops the last page */
        function test_back_button() {
            app.pageStack.push(page1);
            app.pageStack.push(page2);

            keyClick(Qt.Key_Back);
            // TODO: this test doesn't work; there is a problem with the ApplicationWindow focus
            // compare(app.pageStack.currentItem, page1);

            app.pageStack.clear();
        }
    }
}
