/*
 *   SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>
 *
 *   SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid 2.0

PlasmoidItem {
    id: root

    property ContainmentItem desktopContainment: null
    onDesktopContainmentChanged: {
        root.parent.visible = false; // Set this plasmoid's BasicAppletContainer visible property to false to avoid issues with the desktop icons
        console.log("\n\n\n\n\n\n")
        console.log(desktopContainment)
        root.parent = desktopContainment; // Then change this plasmoid's parent to DesktopContainment so that BasicAppletContainer's visible property doesn't affect us
    }

    property int sidebarWidth: 150
    property int sidebarLocation: 0
    property bool sidebarCollapsed: false

    property Item internalContainmentItem

    Layout.maximumWidth: 1
    Layout.maximumHeight: 1

    preferredRepresentation: fullRepresentation
    Plasmoid.status: internalContainmentItem ? internalContainmentItem.status : PlasmaCore.Types.UnknownStatus
    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    visible: y != Screen.height

    y: root.desktopContainment != null && !sidebarCollapsed ? 0 : Screen.height

    Behavior on y {
        NumberAnimation { duration: 125 }
    }

    states: [
        State {
            name: "rightSidebar"
            when: root.sidebarLocation == 0

            AnchorChanges {
                target: root

                anchors.left: undefined
                anchors.right: desktopContainment.right
            }
        },
        State {
            name: "leftSidebar"
            when: root.sidebarLocation == 1

            AnchorChanges {
                target: root

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
                if (item.isFolder !== undefined) {
                    root.desktopContainment = item;
                    root.parent = desktopContainment;

                    root.width = Qt.binding(() => root.sidebarWidth);
                    root.height = Qt.binding(() => desktopContainment.availableScreenRect.height);

                    desktopContainment.sidebarWidth = Qt.binding(() => root.sidebarWidth);
                }
            }
        }
    }

    Component.onCompleted: {
        root.internalContainmentItem = plasmoid.internalContainmentItem;

        if (root.internalContainmentItem === null) {
            return;
        }
        root.internalContainmentItem.anchors.fill = undefined;
        root.internalContainmentItem.parent = root;
        root.internalContainmentItem.anchors.fill = root;
    }

    Connections {
        target: plasmoid
        function onInternalContainmentItemChanged() {
            root.internalContainmentItem = plasmoid.internalContainmentItem;
            root.internalContainmentItem.parent = root;
            root.internalContainmentItem.anchors.fill = root;

            // Bind the configuration values from io.gitgud.catpswin56.private.sidebar with their equivalents in this plasmoid
            root.sidebarWidth = Qt.binding(() => internalContainmentItem.sidebarWidth);
            root.sidebarLocation = Qt.binding(() => internalContainmentItem.sidebarLocation);
            root.sidebarCollapsed = Qt.binding(() => internalContainmentItem.sidebarCollapsed);
        }
    }
}
