import QtQuick 2.4

import Mut 0.1
import Mut.Layouts 0.1

/*! \qmltype DeviceLayout
    \inqmlmodule Mut.Layout 0.1

    \brief Provides a layout that changes according to device screen size.
    Screen size values are defined in \l {Mut::Device} singleton
    having values in the range [0, 3].

    DeviceLayout makes use of the \l {Mut.Layouts::ConditionalLayout}
    fallback system so if only `sizeSmall` and `sizeNormal` layouts are defined
    but the current device requires a `sizeXLarge` layout, `sizeNormal` layout
    will be used.

    \qml
    import QtQuick 2.4
    import Mut 0.1
    import Mut.Layouts 0.1

    Component {
        id: small_layout
        ColumnLayout {
            ...
        }
    }

    Component {
        id: normal_layout
        ColumnLayout {
            ...
        }
    }

    Component {
        id: large_layout
        RowLayout {
            ...
        }
    }

    DeviceLayout {
        layouts: [
            small_layout,
            normal_layout,
            large_layout
        ]

    }
    \endqml
*/
ConditionalLayout {
    when: Device.size
}
