cmake_minimum_required(VERSION 3.16)

project(io.gitgud.catpswin56.vistastart)
 
find_package(ECM 1.4.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})
set(CMAKE_AUTOMOC ON)
set(QT_MAJOR_VERSION 6)

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

find_package(KF6 REQUIRED REQUIRED
    COMPONENTS
        WindowSystem
        Svg
        Config
        Service
        I18n
        CoreAddons
)

find_package(Qt6 CONFIG REQUIRED
    COMPONENTS
        Quick
        Core
)

find_package(Plasma 6.0.0 REQUIRED)

add_subdirectory(src)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
