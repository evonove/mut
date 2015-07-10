pragma Singleton

import QtQuick 2.4
import QtQuick.Window 2.2

QtObject {
    id: units

    /*! Global font scale factor */
    property real fontScale: 1.0;

    /*! System pixel density. Usually this is Screen.pixelDensity */
    property real pixelDensity;

    /*! Method to compute component size using device independent pixels */
    function dp(number) {
        return Math.round(number*((pixelDensity*25.4)/160));
    }

    /*! Method to compute device independent pixels from real pixels */
    function pxToDp(number) {
        return number / Math.round(((pixelDensity*25.4)/160));
    }

    /*! Method to compute font sizes using device independent pixels
        and a global font scaling factor.
    */
    function sp(number) {
        return dp(number) * units.fontScale;
    }
}
