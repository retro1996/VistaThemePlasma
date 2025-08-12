import QtQuick 2.15
import org.kde.plasma.configuration 2.0
import QtQuick.Controls 2.3 as QQC2
import QtQuick.Layouts 1.1
import QtQml 2.15

import org.kde.newstuff 1.62 as NewStuff
import org.kde.kirigami 2.20 as Kirigami
import org.kde.kcmutils
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.configuration 2.0
import org.kde.plasma.plasma5support as Plasma5Support


RowLayout {
    id: column
    property int bottomMargin
    property string iconSource
    property string text
    property string description
    property string command

    property var execHelper

    function execute() {
        execHelper.exec(command);
    }

    Kirigami.Icon {
        id: icon
        Layout.preferredWidth: 24
        Layout.preferredHeight: 24
        Layout.alignment: Qt.AlignTop
        source: column.iconSource

        MouseArea {
            anchors.fill: parent
            onClicked: column.execute();
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }

    spacing: 8

    ColumnLayout {
        width: parent.width
        spacing: 2
        Text {
            id: textLabel
            color: Kirigami.Theme.linkColor
            font.underline: ma.containsMouse
            text: column.text

            MouseArea {
                id: ma
                anchors.fill: parent
                onClicked: column.execute();
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
            }
        }
        Text {
            Layout.fillWidth: true
            Layout.rightMargin: icon.width
            text: column.description
            wrapMode: Text.WordWrap
        }
    }

}
