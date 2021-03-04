TEMPLATE = app

# Make sure we do not accidentally #include files placed in 'res'
CONFIG += no_include_pwd
CONFIG += console
CONFIG -= app_bundle
CONFIG += 1zconsole
CONFIG += c++14

SOURCES += $$PWD/src/*.cpp

HEADERS += $$PWD/src/*.h

# set up flags for the compiler and Stanford C++ libraries
QMAKE_CXXFLAGS += -std=c++17 \
    -Wall \
    -Wextra \
    -Wreturn-type \
    -Werror=return-type \
    -Wunreachable-code \

# Copies the given files to the destination directory
# The rest of this file defines how to copy the resources folder
defineTest(copyToDestdir) {
    files = $$1

    for(FILE, files) {
        DDIR = $$OUT_PWD

        # Replace slashes in paths with backslashes for Windows
        win32:FILE ~= s,/,\\,g
        win32:DDIR ~= s,/,\\,g

        !win32 {
            copyResources.commands += cp -r '"'$$FILE'"' '"'$$DDIR'"' $$escape_expand(\\n\\t)
        }
        win32 {
            copyResources.commands += xcopy '"'$$FILE'"' '"'$$DDIR'"' /e /y $$escape_expand(\\n\\t)
        }
    }
    export(copyResources.commands)
}

macx {
    cache()
    QMAKE_MAC_SDK = macosx
}
