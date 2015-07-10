import QtQuick.Controls 1.2 as Controls
import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1

/*! \qmltype ToolBar
    \inqmlmodule Mut 0.1
    \ingroup toolbar

    \brief Provides a generic toolbar component.

    ToolBar extends \l {QtQuick.Controls::ToolBar}
*/
Controls.ToolBar {
    id: toolbar

    /*! \qmlproperty color ToolBar::backgroundColor

        The background color for the toolbar.
    */
    property color backgroundColor: Theme.p.primary

    /*! \qmlproperty color ToolBar::elevation

        The elevation level for the toolbar.
        Default elevation is 0.
    */
    property real elevation: 0

    property bool fillWidth: false

    style: ToolBarStyle {}
}

