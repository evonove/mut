import QtQuick 2.4
import QtQuick.Controls 1.3
import QtTest 1.0

import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1

Item {
    id: container
    width: 300; height: 300

    Button {
        id: button
        style: BaseButtonStyle {
            id: style
            elevation: 1
            palette: ButtonPalette {
                 normal: "#ff0000"
                 hovered: "#00ff00"
                 pressed: "#0000ff"
                 disabled: "#aaaaaa"
                 text: "#ffffff"
                 textDisabled: "#eeeeee"

            }
         }
    }

    TestCase {
        id: testCase
        name: "Tests_ButtonStyle"
        when: windowShown
        width: 300; height: 300

        function initTestCase() {
            Units.pixelDensity = 5;
        }

        /* tests default elevation */
        function test_defaultElevation() {
            compare(button.__style.elevation, 1);
        }

        /* tests colors on normal state */
        function test_defaultColors() {
            compare(button.__style.backgroundColor, "#ff0000");
            compare(button.__style.textColor, "#ffffff");
        }

        /* tests colors on pressed state */
        function test_pressedColors() {
            mousePress(button);
            compare(button.__style.backgroundColor, "#0000ff");
            mouseRelease(button);
        }

        /* tests colors on hovered state */
        function test_hoveredColors() {
            mouseMove(button);
            compare(button.__style.backgroundColor, "#00ff00");
        }

        /* tests colors on disabled state */
        function test_disabledColors() {
            button.enabled = false;
            compare(button.__style.backgroundColor, "#aaaaaa");
            compare(button.__style.textColor, "#eeeeee");
            button.enabled = true;
        }
    }

}
