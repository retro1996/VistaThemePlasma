#ifndef HELPER_H
#define HELPER_H

#include <QObject>

#include <KAuth/ActionReply>
#include <KAuth/HelperSupport>

using namespace KAuth;

class KCMHelper : public QObject
{
    Q_OBJECT

public Q_SLOTS:
    ActionReply write(const QVariantMap &args);
};

#endif
