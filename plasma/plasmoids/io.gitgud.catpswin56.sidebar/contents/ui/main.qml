/*
 *   SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>
 *
 *   SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Layouts

import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    property var desktopContainment: null
    onDesktopContainmentChanged: {
        root.parent = desktopContainment;
        if(internalContainmentItem) {
            root.internalContainmentItem.parent = desktopContainment;
            root.internalContainmentItem.wrapper = root;
            root.internalContainmentItem.z = 1;
        }
    }

    property int sidebarLocation: 0
    property int sidebarWidth: 150

    property Item internalContainmentItem
    onInternalContainmentItemChanged: {
        // Bind the configuration values from io.gitgud.catpswin56.private.sidebar with their equivalents in this plasmoid
        root.sidebarWidth = Qt.binding(() => internalContainmentItem.sidebarWidth);
        root.sidebarLocation = Qt.binding(() => internalContainmentItem.sidebarLocation);
    }

    Layout.minimumWidth: sidebarWidth

    preferredRepresentation: fullRepresentation
    Plasmoid.status: internalContainmentItem ? internalContainmentItem.status : PlasmaCore.Types.UnknownStatus
    // Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    states: [
        State {
            name: "rightSidebar"
            when: root.sidebarLocation == 0

            AnchorChanges {
                target: root

                anchors.top: desktopContainment.top
                anchors.bottom: desktopContainment.bottom
                anchors.left: undefined
                anchors.right: desktopContainment.right
            }
        },
        State {
            name: "leftSidebar"
            when: root.sidebarLocation == 1

            AnchorChanges {
                target: root

                anchors.top: desktopContainment.top
                anchors.bottom: desktopContainment.bottom
                anchors.left: desktopContainment.left
                anchors.right: undefined
            }
        }
    ]

    Timer {
        running: desktopContainment == null
        interval: 1
        triggeredOnStart: true
        onTriggered: {
            let item = this;
            while (item.parent) {
                item = item.parent;
                if (item.defaultItemWidth !== undefined) {
                    root.parent.parent = item.parent;
                    root.parent.anchors.bottom = root.parent.parent.top;
                    root.desktopContainment = item.parent;

                    root.width = Qt.binding(() => root.sidebarWidth);
                }
            }
        }
    }

    Component.onCompleted: root.internalContainmentItem = Plasmoid.internalContainmentItem;

    Connections {
        target: plasmoid
        function onInternalContainmentItemChanged() {
            root.internalContainmentItem = Plasmoid.internalContainmentItem;
        }
    }
}
