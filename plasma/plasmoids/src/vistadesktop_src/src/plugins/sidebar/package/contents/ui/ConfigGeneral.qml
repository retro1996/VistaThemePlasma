/*
    SPDX-FileCopyrightText: 2014 Eike Hein <hein@kde.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    id: root

    property alias cfg_width: width.text
    property alias cfg_location: location.currentIndex

    component CustomGroupBox: GroupBox {
        id: gbox
        label: Label {
            id: lbl
            x: gbox.leftPadding + 2
            y: lbl.implicitHeight/2-gbox.bottomPadding-1
            width: lbl.implicitWidth
            text: gbox.title
            elide: Text.ElideRight
            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: -2
                anchors.rightMargin: -2
                color: Kirigami.Theme.backgroundColor
                z: -1
            }
        }
        background: Rectangle {
            y: gbox.topPadding - gbox.bottomPadding*2
            width: parent.width
            height: parent.height - gbox.topPadding + gbox.bottomPadding*2
            color: "transparent"
            border.color: "#d5dfe5"
            radius: 3
        }
    }

    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Kirigami.Units.gridUnit*4
        anchors.rightMargin: Kirigami.Units.gridUnit*4

        CustomGroupBox {
            Layout.fillWidth: true
            title: i18n("Sidebar settings")

            ColumnLayout {
                anchors.fill: parent

                spacing: 4

                RowLayout {
                    Layout.fillWidth: true

                    uniformCellSizes: true

                    Text {
                        Layout.fillWidth: true

                        text: i18n("Width:")
                    }
                    TextField {
                        id: width

                        Layout.fillWidth: true
                        Layout.preferredHeight: 27

                        text: Plasmoid.configuration.width
                        onTextChanged: {
                            if(isNaN(Number(width.text))) width.text = Plasmoid.configuration.width;
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true

                    uniformCellSizes: false

                    Text {
                        Layout.fillWidth: true

                        text: i18n("Location:")
                    }
                    ComboBox {
                        id: location

                        Layout.minimumWidth: 25

                        currentIndex: Plasmoid.configuration.location
                        model: [
                            i18n("Right"),
                            i18n("Left")
                        ]
                    }
                }
            }
        }
    }
}
