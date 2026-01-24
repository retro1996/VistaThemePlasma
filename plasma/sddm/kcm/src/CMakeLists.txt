include_directories(
    /usr/include/KF6/KAuth/
    /usr/include/KF6/KAuthCore/
    /usr/include/KF6/KConfigCore/
    /usr/include/KF6/KConfig/
)

add_subdirectory(helper)

kcmutils_add_qml_kcm(kcm_sddmsmod SOURCES kcm.cpp)
target_link_libraries(kcm_sddmsmod
    Qt6::Core
    Qt6::Widgets
    Qt6::Quick
    KF6::KCMUtils
    KF6::CoreAddons
    KF6::I18n
    KF6::AuthCore
)
