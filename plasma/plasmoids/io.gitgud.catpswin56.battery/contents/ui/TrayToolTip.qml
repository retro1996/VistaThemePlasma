/*
 *    SPDX-FileCopyrightText: 2013-2015 Sebastian Kügler <sebas@kde.org>
 *
 *    SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Layouts

import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid

import org.kde.kirigami as Kirigami
import org.kde.kwindowsystem
import org.kde.ksvg as KSvg

Item {
    property int preferredTextWidth: Kirigami.Units.gridUnit * 10
    property bool compositing: KWindowSystem.isPlatformX11 ? KX11Extras.compositingActive : true

    // Used for margins
    KSvg.FrameSvgItem {
        id: tooltipSvg
        imagePath: compositing ? "widgets/tooltip" : "opaque/widgets/tooltip"
        visible: false
    }

    implicitWidth: mainLayout.implicitWidth - tooltipSvg.margins.left + Kirigami.Units.smallSpacing*4
    implicitHeight: mainLayout.implicitHeight - tooltipSvg.margins.left*2 + Kirigami.Units.smallSpacing*4

    LayoutMirroring.enabled: Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    Kirigami.Theme.colorSet: Kirigami.Theme.View
    Kirigami.Theme.inherit: false

    KSvg.FrameSvgItem {
        id: tooltipBackground
        imagePath: "solid/widgets/tooltip"
        prefix: ""
        anchors {
            //fill: parent
            top: parent.top
            left: parent.left
            leftMargin: -tooltipSvg.margins.left
            topMargin: -tooltipSvg.margins.top
        }

        width: mainLayout.width + tooltipSvg.margins.left + Kirigami.Units.smallSpacing*4
        height: mainLayout.height + Kirigami.Units.smallSpacing*4
    }
    ColumnLayout {
        id: mainLayout
        anchors.centerIn: parent

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            spacing: Kirigami.Units.smallSpacing * 2

            Kirigami.Icon {
                animated: false
                source: "flyout-" + Plasmoid.icon
                Layout.preferredWidth: 32
                Layout.preferredHeight: 32
                Layout.leftMargin: -Kirigami.Units.smallSpacing*2/1.6
            }

            PlasmaComponents.Label {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                Layout.maximumWidth: 125
                wrapMode: Text.WordWrap
                text: batterymonitor.toolTipSubText
                opacity: 0.75
                visible: text !== ""
                maximumLineCount: 2
            }
        }

        RowLayout {
            Layout.fillWidth: true

            PlasmaComponents.Label {
                text: i18n("Current power plan:")
                maximumLineCount: 1
            }
            PlasmaComponents.Label {
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignLeft
                text: batterymonitor.fullRepresentationItem.activeProfile
                font.capitalization: Font.Capitalize
                color: "#1370ab"
                maximumLineCount: 1
            }
        }
    }
}

