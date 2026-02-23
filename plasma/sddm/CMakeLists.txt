add_subdirectory(login-sessions)
add_subdirectory(kcm)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/plasma/sddm/sddm-theme-mod DESTINATION ${CMAKE_INSTALL_PREFIX}/share/sddm/themes)
