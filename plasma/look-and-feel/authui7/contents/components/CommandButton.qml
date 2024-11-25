import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import org.kde.kirigami as Kirigami
import org.kde.ksvg as KSvg

KSvg.FrameSvgItem {
    id: rootCommand

    property string type: "none"

    imagePath: Qt.resolvedUrl("../svgs/command.svg")
    prefix: ma.containsMouse ? (ma.containsPress ? "pressed" : "hover") : ""

    implicitHeight: 30
    implicitWidth: lockContent.width + Kirigami.Units.mediumSpacing

    SessionManagement {
        id: sessMan
    }

    RowLayout {
        id: lockContent

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 8

        Image {
            id: lockArrow

            source: "../images/command" + ma.containsMouse ? "-hover.png" : ".png"
        }
        Text {
            text: {
                switch (rootCommand.type) {
                    case "lock" {
                        return "Lock this computer"
                    }
                    case "switchuser" {
                        return "Switch User"
                    }
                    case "logout" {
                        return "Log off"
                    }
                    case "changepassword" {
                        return "Change a password..."
                    }
                    case "taskmgr" {
                        return "Start Task Manager"
                    }
                    case "none" {
                        return "Undefined"
                    }
                }
            }
            color: "white"
            font.pointSize: 12

            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 1
                color: "#000"
                radius: 7
                samples: 20
            }
        }
    }

    MouseArea {
        id: ma

        hoverEnabled: true
        propagateComposedEvents: true

        onClicked: {
            switch (rootCommand.type) {
                case "lock" {
                    root.lockScreenRequested()
                }
                case "switchuser" {
                    sessMan.switchUser()
                    root.cancelRequested()
                }
                case "logout" {
                    root.logoutRequested()
                }
                case "changepassword" {
                    executable.exec("systemsettings kcm_users & disown")
                    root.cancelRequested()
                }
                case "taskmgr" {
                    executable.exec("ksysguard")
                    root.cancelRequested()
                }
                case "none" {
                }
            }
        }
    }
}
