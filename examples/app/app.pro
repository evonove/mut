TEMPLATE = app

QT += qml quick widgets svg

SOURCES += main.cpp

RESOURCES += qml.qrc

include(deployment.pri)

QML_IMPORT_PATH += $$OUT_PWD/../../modules
