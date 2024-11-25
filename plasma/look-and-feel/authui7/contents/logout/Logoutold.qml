import QtQuick
import QtQuick.Layouts 1.2
import Qt5Compat.GraphicalEffects

import org.kde.kirigami as Kirigami
import org.kde.ksvg as KSvg
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.private.sessions 2.0


Image {
    id: root

    height: screenGeometry.height
    width: screenGeometry.width

    fillMode: Image.Stretch
    source: Qt.resolvedUrl("/usr/share/sddm/themes/sddm-theme-mod/bgtexture.jpg")

    signal logoutRequested()
    signal haltRequested()
    signal suspendRequested(int spdMethod)
    signal rebootRequested()
    signal cancelRequested()
    signal lockScreenRequested()

    Plasma5Support.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
    }

    QQC2.Action {
        onTriggered: root.cancelRequested()
        shortcut: "Escape"
    }

    Item {
        anchors.fill: parent

        ColumnLayout {
            id: mainColumn
            anchors.centerIn: parent
            anchors.verticalCenterOffset: Kirigami.Units.gridUnit*5 // use accurate values idk i just approximated this rq
            spacing: 15

            KSvg.FrameSvgItem {
                id: lockCommand

                imagePath: Qt.resolvedUrl("../svgs/command.svg")
                prefix: lockma.containsMouse ? (lockma.containsPress ? "pressed" : "hover") : ""

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

                        source: "../images/command" + lockma.containsMouse ? "-hover.png" : ".png"
                    }
                    Text {
                        text: "Lock this computer"
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
                    id: lockma

                    hoverEnabled: true
                    propagateComposedEvents: true

                    onClicked: {
                        root.lockScreenRequested()
                    }
                }
            }

        }

        RowLayout {
            anchors.rightMargin: 35
            anchors.leftMargin: 35
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottomMargin: Kirigami.Units.gridUnit*2 // Same goes for here I just used Kirigami Units

            MouseArea {
                Layout.preferredWidth: 40
                Layout.preferredHeight: 25
                Layout.topMargin: 35
                Layout.alignment: Qt.AlignHCenter

                hoverEnabled: true
                propagateComposedEvents: true
                onEntered: {
                    accessButton.source = "../images/accessButton-hover.png"
                }
                onExited: {
                    accessButton.source = "../images/accessButton.png"
                }
                onClicked: {
                    root.cancelRequested()
                    executable.exec("systemsettings kcm_access")
                }
                onPressed: {
                    accessButton.source = "../images/accessButton-pressed.png"
                }
                Image {
                    id: accessButton

                    width: 38
                    source: "../images/accessButton.png"

                    Image {
                        anchors.centerIn: parent

                        source: "../images/access.png"
                    }
                }
            }

            Item {
                Layout.fillWidth: true
            }
            Item {
                Layout.preferredWidth: 40
            }

            Image {
                Layout.bottomMargin: -33
                Layout.alignment: Qt.AlignRight

                source: "../images/watermark.png"
            }

            Item {
                Layout.fillWidth: true
            }

            MouseArea {
                Layout.preferredWidth: 36
                Layout.preferredHeight: 28
                Layout.bottomMargin: -35
                Layout.rightMargin: -3

                hoverEnabled: true
                propagateComposedEvents: true
                onEntered: {
                    power.source = "../images/halt-hover.png"
                }
                onExited: {
                    power.source = "../images/halt.png"
                }
                onClicked: {
                    root.haltRequested()
                }
                onPressed: {
                    power.source = "../images/halt-pressed.png"
                }
                Image {
                    id: power

                    Layout.rightMargin: -5

                    source: "../images/halt.png"

                    Image {
                        anchors.centerIn: parent

                        source: "../images/halt-glyph.png"
                    }
                }
            }
            MouseArea {
                Layout.preferredWidth: 33
                Layout.preferredHeight: 28
                Layout.bottomMargin: -35

                hoverEnabled: true
                propagateComposedEvents: true
                onEntered: {
                    powerRIGHT.source = "../images/reboot-hover.png"
                }
                onExited: {
                    powerRIGHT.source = "../images/reboot.png"
                }
                onClicked: {
                    root.rebootRequested()
                }
                onPressed: {
                    powerRIGHT.source = "../images/reboot-pressed.png"
                }
                Image {
                    id: powerRIGHT

                    source: "../images/reboot.png"

                    Image {
                        anchors.centerIn: parent

                        source: "../images/reboot-glyph.png"
                    }
                }
            }
        }
    }
}
