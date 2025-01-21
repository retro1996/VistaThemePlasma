/*
    SPDX-FileCopyrightText: 2013-2017 Jan Grulich <jgrulich@redhat.com>

    SPDX-License-Identifier: LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-KDE-Accepted-LGPL
*/

import QtQuick

import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid
import org.kde.plasma.networkmanagement as PlasmaNM
import org.kde.networkmanager as NMQt

MouseArea {
    id: root

    required property bool airplaneModeAvailable
    required property string iconName

    hoverEnabled: true

    acceptedButtons: airplaneModeAvailable ? Qt.LeftButton | Qt.MiddleButton : Qt.LeftButton

    property bool wasExpanded

    onPressed: wasExpanded = mainWindow.expanded
    onClicked: mouse => {
        if (airplaneModeAvailable && mouse.button === Qt.MiddleButton) {
            mainWindow.planeModeSwitchAction.trigger();
        } else {
            mainWindow.expanded = !wasExpanded;
        }
    }

    Text {
        text: appletProxyModel.data(0, 27)
        color: "red"
        z: 1
    }

    Kirigami.Icon {
        id: connectionIcon

        property bool uploading: Plasmoid.configuration.txSpeed > 500
        property bool downloading: Plasmoid.configuration.rxSpeed > 500

        property string activityIcon: uploading && downloading ? "connected-activity" :
                                      uploading ? "connected-uploading" :
                                      downloading ? "connected-downloading" : "connected-noactivity"
        property string state: networkStatus.connectivity === NMQt.NetworkManager.Portal ? "-limited" : ""
        property string defaultIcon: Plasmoid.configuration.connectionState == PlasmaNM.Enums.Deactivated || !enabledConnections.wirelessEnabled ?
                                       "network-wired-disconnected" : activityIcon + state

        anchors.fill: parent
        source: Plasmoid.configuration.useAlternateIcon || PlasmaNM.Configuration.airplaneModeEnabled ? root.iconName : defaultIcon
    }
}
