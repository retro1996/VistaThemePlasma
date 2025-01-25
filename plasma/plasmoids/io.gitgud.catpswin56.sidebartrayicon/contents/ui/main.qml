/*
    SPDX-FileCopyrightText: 2011 Sebastian Kügler <sebas@kde.org>
    SPDX-FileCopyrightText: 2011 Viranch Mehta <viranch.mehta@gmail.com>
    SPDX-FileCopyrightText: 2013-2015 Kai Uwe Broulik <kde@privat.broulik.de>
    SPDX-FileCopyrightText: 2021-2022 ivan tkachenko <me@ratijas.tk>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick

import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami

PlasmoidItem {
    MouseArea {
        anchors.fill: parent

        preventStealing: true
        onClicked: console.log("nothing"); // do nothing
    }
    Kirigami.Icon {
        anchors.centerIn: parent

        width: 16
        height: 16

        source: "sidebar"
    }
}
