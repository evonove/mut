import QtQuick 2.4
import QtQuick.Controls 1.3
import QtTest 1.0

import Mut 0.1

Item {
    width: Units.dp(100); height: Units.dp(200)
    StackView {
        id: stackView
        anchors.fill: parent
    }
    TestCase {
        id: testCase
        name: "Tests_Page"
        when: windowShown

        function initTestCase() {
            Units.pixelDensity = 5.0;
        }

        /* tests the api to push and pop pages */
        function test_pagePushPop() {
            var page = Qt.createQmlObject(
                'import Mut 0.1; Page {id: page1}',
                testCase, '');
            var tmp = Qt.createQmlObject(
                'import Mut 0.1; Page {id: page2}',
                testCase, '');

            stackView.push(page);
            page.push(tmp);
            compare(stackView.currentItem, tmp);

            tmp.pop();
            compare(stackView.currentItem, page);

            stackView.clear();
            page.destroy();
            tmp.destroy();
        }

        /* tests that the default navigation action pops the
           current page from the stack.
        */
        function test_defaultNavAction() {
            var page = Qt.createQmlObject(
                'import Mut 0.1; Page {id: page1}',
                testCase, '');
            var tmp = Qt.createQmlObject(
                'import Mut 0.1; Page {id: page1}',
                testCase, '');

            stackView.push(page);
            page.push(tmp);
            tmp.navAction.trigger();
            compare(stackView.currentItem, page);

            stackView.clear();
            page.destroy();
            tmp.destroy();
        }
    }
}
