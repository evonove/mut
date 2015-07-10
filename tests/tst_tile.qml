import QtQuick 2.4
import QtQuick.Controls 1.3
import QtTest 1.0

import Mut 0.1
import Mut.Themes 0.1
import Mut.ListItems 0.1

Item {
    id: container
    width: 300; height: 300

    Component {
        id: primary

        Text {
            text: "Hello world!"
        }
    }

    Component {
        id: secondary

        Button {
            action: Action {
                iconSource: Qt.resolvedUrl("test.svg")
            }
        }
    }

    Tile {
        id: tile
        primaryComponent: primary
    }

    TestCase {
        id: testCase
        name: "Tests_Tile"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5;
        }

        /* default background color should be white */
        function test_background_default() {
            compare(tile.backgroundColor, Theme.p.background);
        }
    }
}
