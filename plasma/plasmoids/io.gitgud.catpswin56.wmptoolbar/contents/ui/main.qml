import QtQuick
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.extras as PlasmaExtras

import "styles" as WMPStyles

PlasmoidItem {
    id: root

    readonly property bool multimediaOpen: mediaController.mediaPlayerOpen
    readonly property bool hideToolbar: !multimediaOpen && Plasmoid.configuration.hideToolbar
    readonly property string toolbarStyle: {
        if(Plasmoid.configuration.toolbarStyle == 0) return "wmp10"
        else return "wmp11"
    }
    readonly property bool wmp11Basic: Plasmoid.configuration.wmp11Basic

    Layout.minimumWidth: hideToolbar ? 0 : 170
    Layout.maximumHeight: 25

    MprisController { id: mediaController }

    Item {
        id: containerRect

        anchors.fill: parent

        opacity: root.hideToolbar ? 0 : 1

        Instantiator {
            model: mediaController.mpris2Model
            delegate: PlasmaExtras.MenuItem {
                required property int index
                required property var model

                text: model.identity + "      "
                icon: model.iconName == "emblem-favorite" ? "bookmark_add" : model.iconName
                checkable: true
                checked: mediaController.mpris2Model.currentIndex == index
                onClicked: mediaController.mpris2Model.currentIndex = index
            }
            onObjectAdded: (index, object) => contextMenu.addMenuItem(object);
            onObjectRemoved: (index, object) => contextMenu.removeMenuItem(object)
        }

        PlasmaExtras.Menu {
            id: contextMenu

            visualParent: containerRect
            placement: PlasmaExtras.Menu.BottomPosedLeftAlignedPopup
        }

        WMPStyles.WMP10 { id: wmp10; anchors.fill: parent; visible: root.toolbarStyle == "wmp10" }
        WMPStyles.WMP11 { id: wmp11; anchors.fill: parent; visible: root.toolbarStyle == "wmp11" }
    }

    PlasmaCore.Dialog {
        id: popup

        /* Using an if statement that checks if the popup button contains a press.
        *  Now, why am I checking for a press instead of making the MouseArea handle this?
        *  Because for whatever reason the clicked() signal never happens.
        */
        property bool showPopup: {
            if(root.toolbarStyle == "wmp10") {
                if(wmp10.bgRightMa.containsPress && showPopup == false) return true
                    else if(wmp10.bgRightMa.containsPress && showPopup == true) return false
            }
            else if(root.toolbarStyle == "wmp11") {
                if(wmp11.rightTopMa.containsPress && showPopup == false) return true
                    else if(wmp11.rightTopMa.containsPress && showPopup == true) return false
            }
        }

        type: PlasmaCore.Dialog.Dock
        location: PlasmaCore.Types.Floating // to get rid of the slide animation
        backgroundHints: PlasmaCore.Types.NoBackground
        flags: Qt.WindowStaysOnTopHint
        visualParent: root

        visible: showPopup

        mainItem: Image {
            source: "styles/png/" + root.toolbarStyle + "/" + "frame.png"

            Rectangle {
                anchors.fill: parent

                color: "gray"
                topRightRadius: 1
                topLeftRadius: 1

                z: -1
                visible: root.toolbarStyle == "wmp11"
            }

            Item {
                id: design1

                anchors.fill: parent

                visible: true

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 6

                    color: "black"
                }

                Image {
                    anchors.fill: parent
                    anchors.margins: 6

                    fillMode: Image.PreserveAspectCrop
                    source: mediaController.albumArt

                    opacity: 0.4
                }

                ColumnLayout {
                    anchors {
                        top: parent.top
                        right: parent.right
                        left: parent.left

                        margins: 6
                        topMargin: 4
                    }

                    spacing: 0

                    Text {
                        Layout.fillWidth: true

                        text: mediaController.artist
                        color: "lightgreen"
                        font.pointSize: 8
                        elide: Text.ElideRight

                        visible: mediaController.track != "" && mediaController.artist != ""
                    }
                    Text {
                        Layout.fillWidth: true

                        text: mediaController.track != "" ? mediaController.track : i18n("No media playing")
                        color: "lightgreen"
                        font.pointSize: 8
                        elide: Text.ElideRight
                    }
                }
            }
        }
    }
}
