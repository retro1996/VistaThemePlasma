# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2025 WackyIdeas <wackyideas@disroot.org>

# Target: static library
qt_add_qml_module(vtpootb_static
    STATIC
    URI io.gitgud.catpswin56.vtpootb
    VERSION 1.0
    QML_FILES
        contents/ui/Main.qml

)

set(vtpootb_SRCS
    app.cpp
    effectsmodel.cpp
)
qt_add_dbus_interface(vtpootb_SRCS
    ${CMAKE_INSTALL_PREFIX}/share/dbus-1/interfaces/org.kde.kwin.Effects.xml kwin_effects_interface
)

target_sources(vtpootb_static PUBLIC
    ${vtpootb_SRCS}
)

target_link_libraries(vtpootb_static PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Svg
    KF6::AuthCore
    KF6::I18n
    KF6::CoreAddons
    KF6::ConfigCore
    KF6::ConfigGui
    KF6::KCMUtils
    KF6::Package
    KWin::kwin
)
target_include_directories(vtpootb_static PUBLIC ${CMAKE_BINARY_DIR})

target_link_libraries(vtpootb_static PUBLIC Qt::Widgets)

kconfig_add_kcfg_files(vtpootb_static GENERATE_MOC vtpootbconfig.kcfgc)

# Target: main executable
qt_add_executable(vtpootb main.cpp contents/ui/assets.qrc)
target_link_libraries(vtpootb PUBLIC vtpootb_static vtpootb_staticplugin)
install(TARGETS vtpootb ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
