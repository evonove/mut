import QtQuick 2.4
import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1

BaseButtonStyle {
    id: root
    elevation: 1
    palette: Theme.p.actionButton

    background: Paper {
        implicitWidth: Units.dp(56)
        implicitHeight: Units.dp(56)
        radius: Units.dp(28)
        circular: true

        elevation: control.enabled ? root.elevation : 0
        backgroundColor: root.backgroundColor
    }
    label: Icon {
        image.source: control.iconSource
        colorOverlay: root.iconColor
    }
}
