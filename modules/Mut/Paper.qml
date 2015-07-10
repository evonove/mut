import QtQuick 2.4
import QtGraphicalEffects 1.0
import Mut 0.1

/*! \qmltype Paper
    \inqmlmodule Mut

    \brief Provides a generic sheet of paper.

    Paper is the base building block of all the components
    of the application.
*/
FocusScope {
    id: paper

    /*! \qmlproperty color Paper::backgroundColor

        This property holds the background color of the
        sheet of paper.
    */
    property alias backgroundColor: background.color
    property alias radius: background.radius

    /*! \qmlproperty real Paper::elevation

        This property holds the elevation level of the sheet
        paper and determines the appearance of its shadow.
    */
    property real elevation: 0

    property bool fillWidth: false
    property bool fillHeight: false

    property bool circular: false

    /*! \internal */
    property bool __hasShadow: paper.backgroundColor.a != 0 && elevation > 0

    /*! \internal */
    property real __effectWidth: paper.width + Units.dp(10) * paper.fillWidth
    /*! \internal */
    property real __effectHeight: paper.height + Units.dp(20) * paper.fillHeight

    RectangularGlow {
        visible: paper.__hasShadow && paper.circular
        //width: paper.__effectWidth; height: paper.__effectHeight
        width: paper.__effectWidth * .95; height: paper.__effectHeight * .95

        anchors.centerIn: parent
        anchors.verticalCenterOffset: Units.dp(paper.elevation * 1.5)

        glowRadius: Units.dp(0.75)
        opacity: 0.6
        spread: 0.7
        color: "black"
        cornerRadius: paper.radius
    }

    RectangularGlow {
        id: topEffect
        visible: paper.__hasShadow && !paper.circular
        width: paper.__effectWidth; height: paper.__effectHeight
        anchors.centerIn: parent
        anchors.verticalCenterOffset: Units.dp(paper.elevation * 3)
        glowRadius: Units.dp(paper.elevation * 3)
        spread: 0.05
        color: "black"
        opacity: 0.08 + (0.04 * paper.elevation)
        cornerRadius: paper.radius + glowRadius * 2.5
    }

    RectangularGlow {
        id: bottomEffect
        visible: paper.__hasShadow && !paper.circular
        width: paper.__effectWidth; height: paper.__effectHeight
        anchors.centerIn: parent
        anchors.verticalCenterOffset: Units.dp(paper.elevation * 2.5)
        glowRadius: Units.dp(paper.elevation)
        spread: 0.05
        color: "black"
        opacity: 0.25 - (0.01 * paper.elevation)
        cornerRadius: paper.radius + glowRadius * 2.5
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
    }
}

