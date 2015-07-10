import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3 as Styles

import Mut 0.1


Styles.ToolBarStyle {
    id: style

    padding {
        // FIXME: adjust paddings depending on device size
        left: Units.dp(4)
        right: Units.dp(4)
        top: 0
        bottom: 0
    }
    background: Paper {
        backgroundColor: control.backgroundColor

        fillWidth: control.fillWidth
        elevation: control.elevation
    }
}
