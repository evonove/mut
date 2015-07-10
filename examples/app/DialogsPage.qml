import QtQuick 2.4
import QtQuick.Controls 1.3 as Q
import Mut 0.1
import Mut.Styles 0.1

Page {
    id: root
    title: qsTr("Dialogs")

    Paper {
        anchors.fill: parent

        Q.Button {
            text: "open dialog"
            style: RaisedButtonStyle {}
            onClicked: dialogRoot.open()
        }
    }

    Dialog {
        id: dialogRoot

        dialogComponent: Card {
            implicitWidth: __column.implicitWidth + Units.dp(48)
            implicitHeight: __column.implicitHeight + Units.dp(24)

            Column {
                id: __column
                anchors {
                    fill: parent
                    topMargin: Units.dp(24)
                    leftMargin: Units.dp(24)
                    rightMargin: Units.dp(24)
                }
                Text {
                    text: qsTr("This is a dialog example")
                }
                TextField {
                    id: nameField
                    placeholderText: qsTr("Enter some text")
                    style: NormalTextFieldStyle {}
                }

                Row {
                    Q.Button {
                        text: qsTr("ok")
                        style: FlatButtonStyle {}
                        onClicked: dialogRoot.close()
                    }
                    Q.Button {
                        text: qsTr("cancel")
                        style: FlatButtonStyle {}
                        onClicked: dialogRoot.close()
                    }
                }
            }
        }
    }
}
