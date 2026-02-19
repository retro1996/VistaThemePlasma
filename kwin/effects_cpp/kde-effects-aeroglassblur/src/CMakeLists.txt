add_subdirectory(kcm)

set(aeroglassblur_SOURCES
    blur.cpp
    aeroblur.qrc
    main.cpp
)

kconfig_add_kcfg_files(aeroglassblur_SOURCES
    blurconfig.kcfgc
)

add_library(aeroglassblur MODULE ${aeroglassblur_SOURCES})


configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/config-effect.h.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/config-effect.h"
    @ONLY
)

target_link_libraries(aeroglassblur PRIVATE
    KF6::ConfigGui
    KDecoration3::KDecoration
    KF6::Svg
)
if (KWIN_BUILD_WAYLAND)
    target_compile_definitions(aeroglassblur PRIVATE "KWIN_BUILD_WAYLAND")
    target_link_libraries(aeroglassblur PRIVATE
        KWin::kwin
    )
    install(TARGETS aeroglassblur DESTINATION ${KDE_INSTALL_PLUGINDIR}/kwin/effects/plugins)
else()
    target_link_libraries(aeroglassblur PRIVATE
        KWinX11::kwin
    )
    install(TARGETS aeroglassblur DESTINATION ${KDE_INSTALL_PLUGINDIR}/kwin-x11/effects/plugins)
endif()


