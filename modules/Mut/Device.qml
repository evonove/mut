pragma Singleton

import QtQuick 2.4
import QtQuick.Window 2.2

import Mut 0.1

Item {
    id: device

    property int size
    property int density
    property int primaryOrientation

    readonly property int sizeSmall: 0
    readonly property int sizeNormal: 1
    readonly property int sizeLarge: 2
    readonly property int sizeXLarge: 3

    readonly property int densityLDPI: 120
    readonly property int densityMDPI: 160
    readonly property int densityHDPI: 240
    readonly property int densityXHDPI: 320
    readonly property int densityXXHDPI: 480
    readonly property int densityXXXHDPI: 640
}
