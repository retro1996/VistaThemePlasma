set(configs
    ksplashrc
    kwinrc
    kdeglobals
    kvantum.kvconfig
    kcm-about-distrorc
    klaunchrc
    kscreenlockerrc
    ksmserverrc
    kcminputrc
    smodrc
    uacpolkitagentrc
)

foreach(conf IN LISTS configs)
    install(FILES ${conf} DESTINATION ${KDE_INSTALL_SYSCONFDIR}/xdg/vistathemeplasma/)
endforeach()

install(FILES autostart/x-vtpootb.desktop DESTINATION ${KDE_INSTALL_SYSCONFDIR}/xdg/autostart/)
