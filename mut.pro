TEMPLATE = subdirs
SUBDIRS = modules

!no-mut-examples {
    SUBDIRS += examples
    examples.depends = modules
}

!no-mut-tests {
    SUBDIRS += tests
    tests.depends = modules
}

