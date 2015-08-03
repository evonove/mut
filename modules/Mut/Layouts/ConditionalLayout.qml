import QtQuick 2.4

/*! \qmltype ConditionalLayout
    \inqmlmodule Mut.Layout 0.1

    \brief Provides a layout that could change dinamically.

    ConditionalLayout uses a \l {QtQuick::Loader} that loads a layout
    dinamically according to the following properties:
    * `layouts`: contains a list of possible layouts that should be defined as a {QtQuick::Component}.
    * `when`: is a condition that should return the `layouts` index for the chosen layout

    ConditionalLayout provides a fallback system that chooses the nearest available layout
    so if the `when` property is set to 5 but `layouts` contains only 3 layouts, the
    rightmost element of the array will be used.

    \qml
    import QtQuick 2.4
    import Mut 0.1
    import Mut.Layouts 0.1

    Component {
        id: first_layout
        RowLayout {
            ...
        }
    }

    Component {
        id: second_layout
        ColumnLayout {
            ...
        }
    }

    ConditionalLayout {
        when: aReallyLongCondition ? 0 : 1
        layouts: [
            first_layout,
            second_layout
        ]

    }
    \endqml
*/
FocusScope {
    id: root

    property list<Component> layouts
    property int when: -1

    property alias activeComponent: __layoutLoader.sourceComponent
    property alias activeLayout: __layoutLoader.item

    Loader {
        id: __layoutLoader
        anchors.fill: parent
        sourceComponent: layoutSelection()
    }

    function layoutSelection () {
        var index = root.when;
        var layout;

        // manages layouts fallback
        while (typeof root.layouts[index] === 'undefined' && index > -1) {
            index -= 1;
        }

        // chooses the most similar layout available,
        // 'empty' otherwise (no layout will be loaded)
        if (index === -1) {
            layout = undefined;
        } else {
            layout = root.layouts[index];
        }

        return layout;
    }
}
