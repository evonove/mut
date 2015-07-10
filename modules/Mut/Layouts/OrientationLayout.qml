import QtQuick 2.4

import Mut 0.1
import Mut.Layouts 0.1

/*! \qmltype OrientationLayout
    \inqmlmodule Mut.Layout 0.1

    \brief Provides a layout that changes according to device orientation.

    \qml
    import QtQuick 2.4
    import Mut 0.1
    import Mut.Layouts 0.1

    Component {
        id: portrait_layout
        ColumnLayout {
            ...
        }
    }

    Component {
        id: landscape_layout
        RowLayout {
            ...
        }
    }

    OrientationLayout {
        layouts: [
            portrait_layout,
            landscape_layout
        ]

    }
    \endqml
*/
ConditionalLayout {
    when: Device.primaryOrientation === Qt.PortraitOrientation ? 0 : 1
}
