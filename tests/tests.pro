TEMPLATE = app
TARGET = tst_mut
CONFIG += qmltestcase
SOURCES += tests.cpp

IMPORTPATH = $$PWD/../modules

RESOURCES += tests.qrc

OTHER_FILES += \
    tst_appbar.qml \
    tst_application_window \
    tst_button_style.qml \
    tst_conditional_layout.qml \
    tst_device_layout.qml \
    tst_divider.qml \
    tst_icon.qml \
    tst_orientation_layout.qml \
    tst_page.qml \
    tst_paper.qml \
    tst_theme.qml \
    tst_toolbar.qml \
    tst_units.qml

