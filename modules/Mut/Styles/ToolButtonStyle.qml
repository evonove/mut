import QtQuick 2.4
import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1

BaseButtonStyle {
    id: root
    palette: Theme.p.toolButton

    background: Paper {
        implicitHeight: Units.dp(48)

        backgroundColor: root.backgroundColor
    }
    label: Icon {
        image.source: control.iconSource
        colorOverlay: root.iconColor
    }
}
