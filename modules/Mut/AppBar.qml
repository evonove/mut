import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1


ToolBar {
    id: root

    property Page page

    property Action defaultNavAction: null

    implicitHeight: {
        if (Device.size >= Device.sizeLarge) {
            Units.dp(64);
        } else if (Device.primaryOrientation == Qt.PortraitOrientation) {
            Units.dp(56);
        } else {
            Units.dp(48);
        }
    }

    elevation: 2
    fillWidth: true

    RowLayout {
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        spacing: Units.dp(1)
        Button {
            action: page && page.navAction ? page.navAction : root.defaultNavAction
            style: ToolButtonStyle {}
        }
        Text {
            id: title
            text: page ? page.title : ""
            color: Theme.p.textPrimary
            font {
                pixelSize: Units.sp(20)
                weight: Font.DemiBold
            }
            Layout.fillWidth: true
        }

        Repeater {
            model: page ? page.actions : null
            Button {
                action: modelData
                style: ToolButtonStyle {}
            }
        }
    }
}
