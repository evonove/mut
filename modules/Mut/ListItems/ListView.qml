import QtQuick 2.4 as Q

import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1

/*! \qmltype ListView
    \inqmlmodule Mut.ListItems 0.1

    \brief Provides a generic ListView component compliant to material design guidelines.

    ListView extends \l {QtQuick::ListView}
*/
Q.ListView {
    id: root

    header: Q.Item {
        height: Units.dp(8)
    }

    footer: Q.Item {
        height: Units.dp(8)
    }
}
