TEMPLATE = aux

deployment.files += \
  qmldir \
  *.qml \
  Mut

INSTALLS += deployment
OTHER_FILES += $$deployment.files

isEmpty(DESTDIR) {
  DESTDIR = $$OUT_PWD
}

# does not work when template is subdirs
!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_modules.target = mymodule
    win32 {
        modulePath = $$PWD/Mut
        destPath = $$DESTDIR/Mut
        copy_modules.commands = \
            $(COPY_DIR) $$replace(modulePath, \/, \\) $$replace(destPath, \/, \\)
    } else {
        copy_modules.commands = $(COPY_DIR) $$PWD/Mut $$DESTDIR
    }

    QMAKE_EXTRA_TARGETS += copy_modules
    POST_TARGETDEPS += $$copy_modules.target
}

