pragma Singleton

import QtQuick 2.4


QtObject {
    id: root

    property url imageAssetsPath

    /*! This is property allows the access to the general
        palette and other component-specific palettes.
    */
    property Palette p: Palette {
        id: palette

        background: "#eeeeee"

        primary: "#3f51b5"
        primaryLight: "#3949ab"
        primaryDark: "#303f9f"

        accent: "#ff4081"
        accentLight: "#f50057"
        accentDark: "#c51162"

        textPrimary: palette.light.text

        property ElementPalette light: ElementPalette {
            text: "#ffffff"
            icon: "#ffffff"
            secondaryText: Qt.rgba(1, 1, 1, 0.7)
            hintText: Qt.rgba(1, 1, 1, 0.3)
            disabled: Qt.rgba(1, 1, 1, 0.3)
            divider: Qt.rgba(1, 1, 1, 0.12)
        }

        property ElementPalette dark: ElementPalette {
            text: Qt.rgba(0, 0, 0, 0.87)
            icon: Qt.rgba(0, 0, 0, 0.54)
            secondaryText: Qt.rgba(0, 0, 0, 0.54)
            hintText: Qt.rgba(0, 0, 0, 0.26)
            disabled: Qt.rgba(0, 0, 0, 0.26)
            divider: Qt.rgba(0, 0, 0, 0.12)
        }

        property color divider: palette.dark.divider

        property ButtonPalette flatButton: ButtonPalette {
            normal: "transparent"
            hovered: "#33999999"
            pressed: "#66999999"
            disabled: "transparent"
            icon: palette.dark.icon
            text: palette.dark.text
            textDisabled: palette.dark.disabled
        }

        property ButtonPalette raisedButton: ButtonPalette {
            normal: palette.primary
            hovered: palette.primaryLight
            pressed: palette.primaryDark
            disabled: "#1f000000"
            icon: palette.light.icon
            text: palette.light.text
            textDisabled: palette.dark.disabled
        }

        property ButtonPalette toolButton: ButtonPalette {
            normal: "transparent"
            hovered: "#33999999"
            pressed: "#66999999"
            disabled: "transparent"
            icon: palette.light.icon
            text: palette.light.text
            textDisabled: palette.light.disabled
        }

        property ButtonPalette actionButton: ButtonPalette {
            normal: palette.accent
            hovered: palette.accentLight
            pressed: palette.accentDark
            disabled: "#1f000000"
            icon: palette.light.icon
            text: palette.light.text
            textDisabled: palette.light.disabled
        }

        property TextFieldPalette textField: TextFieldPalette {
            text: palette.dark.text
            placeholder: palette.dark.hintText
            normal: palette.dark.hintText
            pressed: palette.primary
            hint: palette.dark.hintText
            error: "#f44336"
            disabled: palette.dark.disabled
        }

        property SwitchPalette switchToggle: SwitchPalette {
            thumbOn: palette.accent
            thumbOff: "#fafafa"
            thumbDisabled: "#bdbdbd"

            trackOn: Qt.rgba(thumbOn.r, thumbOn.g, thumbOn.b, 0.5)
            trackOff: palette.dark.disabled
            trackDisabled: palette.dark.divider
        }

        property CheckBoxPalette checkBox: CheckBoxPalette {
            backgroundSelected: palette.accent
            backgroundUnselected: "transparent"
            backgroundSelectedDisabled: palette.dark.disabled

            borderEnabled: palette.dark.secondaryText
            borderDisabled: palette.dark.disabled

            iconOverlay: "transparent"
        }
    }

    function image(name) {
        if (root.imageAssetsPath == "") {
            return "";
        }
        return Qt.resolvedUrl(root.imageAssetsPath + name);
    }
}
