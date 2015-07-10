import QtQuick 2.4
import QtTest 1.0

import Mut 0.1


TestCase {
    name: "Tests_Units"

    /* tests dp computes correct component size */
    function test_dp() {
        Units.pixelDensity = 5;
        compare(Units.dp(10), 8);

        Units.pixelDensity = 10;
        compare(Units.dp(10), 16);
    }

    /* tests sp computes correct font size */
    function test_sp() {
        Units.pixelDensity = 5;
        compare(Units.sp(10), 8);

        Units.fontScale = 4;
        compare(Units.sp(10), 32)
    }
}
