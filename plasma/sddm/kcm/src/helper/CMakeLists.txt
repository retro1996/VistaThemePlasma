add_executable(kcmsddmsmodhelper helper.h helper.cpp)

target_link_libraries(kcmsddmsmodhelper
    PRIVATE
        KF6::AuthCore
        KF6::ConfigCore
)
install(TARGETS kcmsddmsmodhelper DESTINATION ${KAUTH_HELPER_INSTALL_DIR})

kauth_install_helper_files(kcmsddmsmodhelper io.gitgud.catpswin56.kcmsddmsmod root)
kauth_install_actions(io.gitgud.catpswin56.kcmsddmsmod kcm_sddmsmod.actions)
