import QtQuick 2.4
import QtQuick.Controls 1.3
import QtTest 1.0

import Mut 0.1
import Mut.Themes 0.1
import Mut.ListItems 0.1

Item {
    id: container
    width: 300; height: 300

    Action {
        id: primary_action
        onTriggered: {
            console.log("primary")
        }
    }

    Action {
        id: primary_action_with_icon
        iconSource: Qt.resolvedUrl("test.svg")
        onTriggered: {
            console.log("primary with icon")
        }
    }

    Action {
        id: secondary_action
        iconSource: Qt.resolvedUrl("test.svg")
        onTriggered: {
            console.log("secondary")
        }
    }

    SingleLineItem {
        id: single_line
        text: "Single line item"

        SignalSpy {
            id: primary_spy
            target: primary_action
            signalName: "triggered"
        }

        SignalSpy {
            id: secondary_spy
            target: secondary_action
            signalName: "triggered"
        }

        primaryAction: primary_action
        secondaryAction: secondary_action
    }

    TestCase {
        id: testCase
        name: "Tests_SingleLineItem"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5;
        }

        /* it should trigger the surface action */
        function test_click_on_surface() {
            mouseClick(single_line);
            compare(primary_spy.count, 1);
            compare(secondary_spy.count, 0);
            primary_spy.clear();
            secondary_spy.clear();
        }

        /* it should trigger the supplemental action */
        function test_click_on_supplemental_action() {
            mouseClick(single_line, single_line.width - Units.dp(16));
            compare(primary_spy.count, 0);
            compare(secondary_spy.count, 1);
            primary_spy.clear();
            secondary_spy.clear();
        }
    }
}
