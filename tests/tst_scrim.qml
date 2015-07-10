import QtQuick 2.4
import QtQuick.Controls 1.3
import QtTest 1.0

import Mut 0.1

Item {
    id: container
    width: 300; height: 300

    SignalSpy {
        id: button_spy
        target: button
        signalName: "clicked"
    }

    Button {
        id: button
    }

    Scrim {
        id: scrim
        anchors.fill: parent
    }

    TestCase {
        id: testCase
        name: "Tests_Scrim"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5;
        }

        /* should capture all mouse events */
        function test_overlay_events_capture() {
            mouseClick(button);
            compare(button_spy.count, 0);
            button_spy.clear();
        }
    }
}
