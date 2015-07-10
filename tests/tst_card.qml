import QtQuick 2.4
import QtQuick.Controls 1.3
import QtTest 1.0

import Mut 0.1

Item {
    id: container
    width: 800; height: 600

    Card {
        id: card
        width: Units.dp(200); height: Units.dp(200)
    }

    TestCase {
        id: testCase
        name: "Tests_Card"
        when: windowShown
        width: 800; height: 600

        function initTestCase() {
            Units.pixelDensity = 5;
        }

        /* it should have a radius and an elevation */
        function test_state_default() {
            compare(card.elevation, 1);
            compare(card.radius, Units.dp(2));
        }
    }
}
