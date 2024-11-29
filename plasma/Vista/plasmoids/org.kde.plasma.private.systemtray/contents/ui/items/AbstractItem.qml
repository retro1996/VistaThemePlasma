/*
    SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2020 Konrad Materka <materka@gmail.com>
    SPDX-FileCopyrightText: 2020 Nate Graham <nate@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PlasmaComponents3
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid

PlasmaCore.ToolTipArea {
    id: abstractItem

    required property int index
    required property var model

    required property string itemId
    /*required*/ property alias text: label.text

    // subclasses need to bind these tooltip properties
    required mainText
    required subText
    required textFormat

    property bool isPlasmoid: false
    property string itemIcon: model.applet.icon

    readonly property alias iconContainer: iconContainer
    readonly property int /*PlasmaCore.Types.ItemStatus*/ status: model.status || PlasmaCore.Types.UnknownStatus
    readonly property int /*PlasmaCore.Types.ItemStatus*/ effectiveStatus: model.effectiveStatus || PlasmaCore.Types.UnknownStatus
        readonly property bool inHiddenLayout: effectiveStatus === PlasmaCore.Types.PassiveStatus
    readonly property bool inVisibleLayout: effectiveStatus === PlasmaCore.Types.mActiveStatus

    property bool effectivePressed: false

    // Keep these in sync with HiddenItems.qml
    readonly property int margins: Kirigami.Units.smallSpacing
    readonly property int maxTextLines: 2

    // input agnostic way to trigger the main action
    signal activated(var pos)

    // proxy signals for MouseArea
    signal clicked(var mouse)
    signal pressed(var mouse)
    signal wheel(var wheel)
    signal contextMenu(var mouse)

    MouseArea {
        id: mouseArea
        propagateComposedEvents: true
        // This needs to be above applets when it's in the grid hidden area
        // so that it can receive hover events while the mouse is over an applet,
        // but below them on regular systray, so collapsing works
        z: inHiddenLayout ? 1 : 0
        anchors.fill: abstractItem
        hoverEnabled: true
        drag.filterChildren: true
        // Necessary to make the whole delegate area forward all mouse events
        acceptedButtons: Qt.AllButtons
        // Using onPositionChanged instead of onEntered because changing the
        // index in a scrollable view also changes the view position.
        // onEntered will change the index while the items are scrolling,
        // making it harder to scroll.
        onClicked: mouse => { abstractItem.clicked(mouse) }
        onPressed: mouse => {
            abstractItem.hideImmediately()
            abstractItem.pressed(mouse)
        }
        onPressAndHold: mouse => {
            if (mouse.button === Qt.LeftButton) {
                abstractItem.contextMenu(mouse)
            }
        }
        onWheel: wheel => {
            abstractItem.wheel(wheel);
            //Don't accept the event in order to make the scrolling by mouse wheel working
            //for the parent scrollview this icon is in.
            wheel.accepted = false;
        }
    }

    RowLayout {
        anchors.fill: abstractItem
        anchors.margins: abstractItem.inHiddenLayout ? abstractItem.margins : 0

        spacing: Kirigami.Units.smallSpacing

        FocusScope {
            id: iconContainer

            Accessible.name: abstractItem.text
            Accessible.description: abstractItem.subText
            Accessible.role: Accessible.Button
            Accessible.onPressAction: abstractItem.activated(Plasmoid.popupPosition(iconContainer, iconContainer.width/2, iconContainer.height/2));

            Keys.onPressed: event => {
                switch (event.key) {
                    case Qt.Key_Space:
                    case Qt.Key_Enter:
                    case Qt.Key_Return:
                    case Qt.Key_Select:
                        abstractItem.activated(Qt.point(width/2, height/2));
                        break;
                    case Qt.Key_Menu:
                        abstractItem.contextMenu(null);
                        event.accepted = true;
                        break;
                }
            }

            property alias container: abstractItem
            property alias inVisibleLayout: abstractItem.inVisibleLayout
            readonly property int size: 16

            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            implicitWidth: root.vertical && abstractItem.inVisibleLayout ? abstractItem.width : size
            implicitHeight: !root.vertical && abstractItem.inVisibleLayout ? abstractItem.height : size

            // use a kirigami icon if hiddenlayout
            // this is done because i have no f*cking idea what causes the icons to disappear in the first place, so
            Kirigami.Icon {
                visible: isPlasmoid && inHiddenLayout
                anchors.fill: parent
                source: itemIcon
            }
        }
        PlasmaComponents3.Label {
            id: label

            visible: false
        }
    }
}
