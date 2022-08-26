cmake_minimum_required(VERSION 3.14)

project(DBusInterfaceLib VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt5 REQUIRED COMPONENTS Core Quick DBus)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick DBus)

find_package(Qt5 COMPONENTS Quick QmlImportScanner)

set(PROJECT_SOURCES
        main.cpp
        qml.qrc
        sources/dbus_interface.cpp
        sources/dbus_property_map.cpp
        sources/dbus_qml_connector.cpp
        headers/dbus_interface.h
        headers/dbus_property_map.h
        headers/dbus_qml_connector.h
)

add_executable(DBusInterfaceLib
  ${PROJECT_SOURCES}
)

target_link_libraries(DBusInterfaceLib
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick Qt${QT_VERSION_MAJOR}::DBus)

set_target_properties(DBusInterfaceLib PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS DBusInterfaceLib
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(QT_VERSION_MAJOR EQUAL 5)
    qt5_import_qml_plugins(DBusInterfaceLib)
#    qt5_finalize_executable(DBusInterfaceLib)
endif()
