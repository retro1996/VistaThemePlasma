import QtQuick
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Controls as QQC2

import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    id: root

    property alias enableStartup: enableStartup.checked
    onEnableStartupChanged: changed();

    property alias playSound: playSound.checked
    onPlaySoundChanged: changed();

    property alias forceUserSelect: forceUserSelect.checked
    onForceUserSelectChanged: changed();

    property alias rdpBackground: rdpBackground.checked
    onRdpBackgroundChanged: changed();

    property alias backgroundSrc: background.source
    onBackgroundSrcChanged: changed();

    signal changed()

    FileDialog {
        id: fileDlg

        onAccepted: backgroundSrc = selectedFile
        nameFilters: ["PNG files (*.png)", "JPEG files (*.jpg *.jpeg)"]
    }

    ColumnLayout {
        anchors.fill: parent

        QQC2.CheckBox {
            id: enableStartup
            text: "Enable Vista Startup Pearl Animation"
        }

        QQC2.CheckBox {
            id: playSound
            text: "Play Startup sound"
        }

        QQC2.CheckBox {
            id: forceUserSelect
            text: "Force user selection"
        }

        QQC2.CheckBox {
            id: rdpBackground
            text: "Use RDP background"
        }

        QQC2.GroupBox {
            id: groupBox

            Layout.fillWidth: true

            Layout.minimumHeight: 395
            Layout.maximumHeight: 395

            title: "Background"
            enabled: !rdpBackground.checked

            ColumnLayout {
                anchors.fill: parent

                spacing: 2

                Image {
                    id: background

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    fillMode: Image.PreserveAspectFit

                    visible: enabled
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: "#1D5F7A"

                    visible: !enabled
                }

                RowLayout {
                    QQC2.Button {
                        id: changeBackground

                        Layout.fillWidth: true

                        text: "Change..."
                        onClicked: fileDlg.open();
                    }
                }
            }
        }

        Item { Layout.fillHeight: true }
    }
}
