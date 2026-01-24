#ifndef KCM_SDDMSMOD_H
#define KCM_SDDMSMOD_H
#undef QT_NO_CAST_FROM_ASCII
#undef QSTRING_DECL_DELETED_ASCII_OP

#include <QObject>
#include <QQuickItem>
#include <QUrl>

#include <KSharedConfig>
#include <KQuickManagedConfigModule>

class KcmSddmSmod : public KQuickManagedConfigModule
{
    Q_OBJECT
public:
    explicit KcmSddmSmod(QObject *parent, const KPluginMetaData &data);
    ~KcmSddmSmod() override;

public Q_SLOTS:
    void setupQmlConnections();
    void checkNeedsSave();
    void checkRepresentsDefaults();

protected Q_SLOTS:
    void defaults() override;
    void load() override;
    void save() override;

private:
    KSharedConfig::Ptr m_config;
    bool m_defaultsLoaded;
    bool m_applied;
};

#endif
