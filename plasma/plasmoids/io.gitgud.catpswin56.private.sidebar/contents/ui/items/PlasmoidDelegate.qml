/*
 *  SPDX-FileCopyrightText: 2015 Marco Martin <mart@kde.org>
 *  SPDX-FileCopyrightText: 2016 David Edmundson <davidedmundson@kde.org>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import org.kde.ksvg as KSvg
import org.kde.kirigami as Kirigami

import org.kde.plasma.components as PlasmaComponents

PlasmoidItem {
    id: plasmoidDelegate

    signal loadingCompleted()
    onLoadingCompleted: delegateModel.sort();

    required property var model
    property int plasmoidIndex: DelegateModel.itemsIndex

    width: mainStack.width

    ParallelAnimation {
        id: plasmoidBackAnim
        NumberAnimation { id: plasmoidBackAnimX; target: plasmoidContainer; property: "x"; easing.type: Easing.Linear; duration: 125 }
        NumberAnimation { id: plasmoidBackAnimY; target: plasmoidContainer; property: "y"; easing.type: Easing.Linear; duration: 125 }
        onRunningChanged: {
            if(!running) {
                dragHndMa.held = false;
            }
        }
    }

    PlasmaComponents.BusyIndicator {
        anchors.centerIn: parent
        visible: applet.plasmoid.busy && !applet?.plasmoid.pluginName.includes("io.gitgud.catpswin56.gadgets")
        running: visible

        z: 1
    }

    Button {
        anchors.centerIn: parent
        text: i18n("Configure…")
        visible: applet.plasmoid.configurationRequired
        onClicked: applet.plasmoid.internalAction("configure").trigger();

        z: 1
    }

    Item {
        id: plasmoidContainer

        states: [
            State {
                name: "dragging"
                when: dragHndMa.held

                ParentChange {
                    target: plasmoidContainer
                    parent: mainStack
                }
            }
        ]

        width: plasmoidDelegate.width
        height: plasmoidDelegate.height

        Drag.active: dragHndMa.held
        Drag.source: dragHndMa
        Drag.hotSpot.x: Math.floor(width / 2.5)
        Drag.hotSpot.y: Math.floor(height / 2.5)

        KSvg.FrameSvgItem {
            id: plasmoidBg

            property int rightMargin: plasmoidMa.hovered && !applet?.plasmoid.pluginName.includes("io.gitgud.catpswin56.gadgets") ? 8 : 0
            Behavior on rightMargin {
                NumberAnimation { duration: 125 }
            }

            anchors.fill: parent
            anchors.topMargin: -Kirigami.Units.smallSpacing * 2
            anchors.bottomMargin: -Kirigami.Units.smallSpacing * 2
            anchors.rightMargin: rightMargin

            imagePath: applet?.plasmoid.backgroundHints != 0 ? "widgets/background" : ""

            z: -2
        }

        Item {
            id: gadgetToolbox

            anchors.right: parent.right
            anchors.top: parent.top

            height: 48
            width: 11

            visible: opacity

            opacity: plasmoidMa.hovered

            Behavior on opacity {
                NumberAnimation { duration: 250 }
            }

            Rectangle {
                anchors.fill: parent

                border.width: 1
                border.color: "white"
                radius: 4

                color: "#214d72"

                opacity: 0.3
            }
            ColumnLayout {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.rightMargin: -1
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: 0

                KSvg.FrameSvgItem {
                    property string suffix: closeMa.containsMouse ? (closeMa.containsPress ? "-pressed" : "-hover") : ""

                    Layout.preferredHeight: 15
                    Layout.preferredWidth: 11

                    imagePath: Qt.resolvedUrl("../svgs/gadget-buttons.svg")
                    prefix: "close" + suffix

                    KSvg.SvgItem {
                        anchors.centerIn: parent
                        width: 9
                        height: 8
                        imagePath: Qt.resolvedUrl("../svgs/gadget-buttons.svg")
                        elementId: "close"
                    }

                    MouseArea {
                        id: closeMa

                        anchors.fill: parent

                        hoverEnabled: true

                        onClicked: {
                            plasmoidDelegate.applet.plasmoid.internalAction("remove").trigger();
                            appletsModel.remove(model.index, 1);
                        }
                    }
                }

                Rectangle {
                    Layout.preferredHeight: 1
                    Layout.preferredWidth: 7
                    Layout.leftMargin: 2
                    Layout.topMargin: -1
                    color: "white"
                    opacity: 0.3
                }

                KSvg.FrameSvgItem {
                    property string suffix: optionsMa.containsMouse ? (optionsMa.containsPress ? "-pressed" : "-hover") : ""
                    property var settingsAction: plasmoidDelegate.applet.plasmoid.internalAction("configure")

                    Layout.preferredHeight: 15
                    Layout.preferredWidth: 11

                    imagePath: Qt.resolvedUrl("../svgs/gadget-buttons.svg")
                    prefix: "other" + suffix

                    opacity: settingsAction != null ? 1 : 0.5

                    KSvg.SvgItem {
                        anchors.centerIn: parent
                        width: 9
                        height: 9
                        imagePath: Qt.resolvedUrl("../svgs/gadget-buttons.svg")
                        elementId: "options"
                    }

                    MouseArea {
                        id: optionsMa

                        anchors.fill: parent

                        hoverEnabled: true
                        onClicked: parent.settingsAction.trigger()

                        visible: parent.settingsAction != null
                    }
                }

                Rectangle {
                    Layout.preferredHeight: 1
                    Layout.preferredWidth: 7
                    Layout.leftMargin: 2
                    Layout.topMargin: -1
                    Layout.bottomMargin: 3

                    color: "white"
                    opacity: 0.3
                }

                KSvg.SvgItem {
                    Layout.preferredWidth: 5
                    Layout.preferredHeight: 11
                    Layout.alignment: Qt.AlignHCenter
                    Layout.rightMargin: 2

                    imagePath: Qt.resolvedUrl("../svgs/gadget-buttons.svg")
                    elementId: "drag"

                    MouseArea {
                        id: dragHndMa

                        anchors.fill: parent
                        anchors.margins: -Kirigami.Units.smallSpacing

                        property bool held: false
                        property alias plasmoidIndex: plasmoidDelegate.plasmoidIndex

                        property point beginDrag
                        property point currentDrag
                        property point dragThreshold: Qt.point(-1,-1);

                        onHeldChanged: {
                            if(held) mainStack.plasmoidIsBeingDragged = true;
                            else mainStack.plasmoidIsBeingDragged = false;
                        }

                        hoverEnabled: true
                        propagateComposedEvents: true

                        drag.smoothed: false
                        drag.threshold: 0
                        drag.target: held ? plasmoidContainer : undefined
                        drag.axis: Drag.XAndYAxis

                        function sendItemBack() {
                            beginDrag = Qt.point(plasmoidDelegate.x, plasmoidDelegate.y);
                            plasmoidBackAnimX.from = currentDrag.x //- taskList.contentX;
                            plasmoidBackAnimX.to = beginDrag.x - mainStack.contentX;
                            plasmoidBackAnimY.from = currentDrag.y// - taskList.contentY;
                            plasmoidBackAnimY.to = beginDrag.y - mainStack.contentY;
                            plasmoidBackAnim.start();
                            dragThreshold = Qt.point(-1,-1);
                        }
                        onReleased: event => {
                            if(held) sendItemBack();
                        }
                        onPressed: event => {
                            dragHndMa.beginDrag = Qt.point(plasmoidDelegate.x, plasmoidDelegate.y);
                            dragThreshold = Qt.point(mouseX, mouseY);
                        }
                        onExited: {
                            if((dragThreshold.x !== -1 && dragThreshold.y !== -1)) {
                                held = true;
                            }
                        }
                        onPositionChanged: {
                            if(dragHndMa.containsPress && (dragThreshold.x !== -1 && dragThreshold.y !== -1)) {
                                if(Math.abs(dragThreshold.x - mouseX) > 10 || Math.abs(dragThreshold.y - mouseY) > 10) {

                                }
                            }
                            currentDrag = Qt.point(plasmoidContainer.x, plasmoidContainer.y);
                        }
                    }
                }
            }
        }
    }

    applet: model.applet

    HoverHandler { id: plasmoidMa }

    DropArea {
        id: plasmoidDropArea

        anchors.fill: parent

        visible: !dragHndMa.held

        onEntered: (drag) => {
            if(drag.source.plasmoidIndex != plasmoidDelegate.plasmoidIndex) {
                delegateModel.items.move(drag.source.plasmoidIndex, plasmoidDelegate.plasmoidIndex);
                orderingManager.saveConfiguration();
            } else return;
        }

        z: 99999999
    }

    onAppletChanged: {
        applet.parent = plasmoidBg;
        applet.anchors.fill = plasmoidBg;
        applet.anchors.margins = 8;
        applet.visible = true;

        plasmoidDelegate.height = mainStack.findPositive(applet?.Layout.preferredHeight, 125);

        plasmoidDelegate.loadingCompleted();
    }
}
