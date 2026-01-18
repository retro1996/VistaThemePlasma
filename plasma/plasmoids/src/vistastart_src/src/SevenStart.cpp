/*
    SPDX-FileCopyrightText: 2021  <>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

#include "SevenStart.h"
#include <kwindowsystem.h>

#include <KApplicationTrader>
#include <KService>
#include <KSycoca>

SevenStart::SevenStart(QObject *parentObject, const KPluginMetaData &data, const QVariantList &args)
    : Plasma::Applet(parentObject, data, args)
{
    connect(KX11Extras::self(), SIGNAL(compositingChanged(bool)), this, SLOT(onCompositingChanged(bool)));
    connect(KWindowSystem::self(), SIGNAL(showingDesktopChanged(bool)), this, SLOT(onShowingDesktopChanged(bool)));
    connect(KSycoca::self(), &KSycoca::databaseChanged, this, &SevenStart::defaultsChanged);
}

SevenStart::~SevenStart()
{
    if(inputMaskCache) delete inputMaskCache;
}

QString SevenStart::defaultInternetEntry()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/http");

    if(defaultApp) return QString("applications:%1.desktop").arg(defaultApp.get()->desktopEntryName());
    else return "";
}
QString SevenStart::defaultInternetName()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/http");

    if(defaultApp) return defaultApp.get()->name();
    else return "";
}

QString SevenStart::defaultEmailEntry()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/mailto");

    if(defaultApp) return QString("applications:%1.desktop").arg(defaultApp.get()->desktopEntryName());
    else return "";
}
QString SevenStart::defaultEmailName()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/mailto");

    if(defaultApp) return defaultApp.get()->name();
    else return "";
}

K_PLUGIN_CLASS(SevenStart)

#include "SevenStart.moc"
