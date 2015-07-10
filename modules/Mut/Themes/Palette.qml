import QtQuick 2.4

QtObject {
    id: palette

    /*! \qmlproperty color Palette::background

        Color that matches (as closely as possible) the window background.
    */
    property color background

    /*! \qmlproperty color Palette::primary

        The primary branding color for the app.
        By default, this is the color applied to the action bar background.
    */
    property color primary
    property color primaryLight
    property color primaryDark

    /*! \qmlproperty color Palette::accent

        Bright complement to the primary branding color.
    */
    property color accent
    property color accentLight
    property color accentDark

    /*! \qmlproperty color Palette::textPrimary

        The most prominent text color.
    */
    property color textPrimary

    /*! \qmlproperty color Palette::textSecondary

        Secondary text color.
    */
    property color textSecondary
}
