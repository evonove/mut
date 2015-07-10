import QtQuick 2.4
import QtQuick.Controls.Styles 1.3 as Styles
import Mut 0.1
import Mut.Themes 0.1

Styles.ProgressBarStyle {
    id: progressBarStyle

    property color color: Theme.p.primary

    background: Rectangle {
        implicitWidth: Units.dp(200)
        implicitHeight: Units.dp(4)
        color: progressBarStyle.color
        opacity: 0.2
    }

    progress: Rectangle {
        color: control.indeterminate ? "transparent" : progressBarStyle.color

        Rectangle {
            id: __progress
            visible: control.indeterminate
            property int end: 0
            width: end - x;
            height: parent.height
            color: progressBarStyle.color
            ParallelAnimation {
                running: control.width && control.indeterminate
                SequentialAnimation {
                    loops: Animation.Infinite
                    PauseAnimation {
                        duration: 500
                    }

                    NumberAnimation{
                        target: __progress; property: "x"
                        from: 0; to: control.width
                        duration: 2000
                        easing.type: Easing.InCubic
                    }
                }
                SequentialAnimation {
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: __progress; property: "end"
                        from: 0; to: control.width
                        duration: 2000
                    }
                    PauseAnimation {
                        duration: 500
                    }
                    ScriptAction {
                        script: __progress.x = 0
                    }
                }
            }
        }
    }
}

