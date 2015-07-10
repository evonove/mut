import QtQuick 2.4
import QtTest 1.0

import Mut 0.1
import Mut.Themes 0.1


TestCase {
    name: "Tests_Theme"

    /* tests image function returns the correct path
       based on the imageAssetsPath value
    */
    function test_image() {
        var result = Theme.image('foo.svg');
        compare(result, "");

        Theme.imageAssetsPath = "/assets/";
        result = Theme.image('foo.svg');
        compare(result, "file:///assets/foo.svg");
    }
}

