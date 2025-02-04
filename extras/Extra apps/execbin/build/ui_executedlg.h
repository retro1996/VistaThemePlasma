/********************************************************************************
** Form generated from reading UI file 'executedlg.ui'
**
** Created by: Qt User Interface Compiler version 6.8.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_EXECUTEDLG_H
#define UI_EXECUTEDLG_H

#include <QtCore/QVariant>
#include <QtGui/QIcon>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QListView>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_ExecuteDlg
{
public:
    QWidget *centralwidget;
    QListView *listView;
    QPushButton *cancelBtn;
    QPushButton *browseBtn;
    QPushButton *okBtn;
    QLabel *open;
    QLabel *description;
    QLabel *icon;
    QLineEdit *lineEdit;

    void setupUi(QMainWindow *ExecuteDlg)
    {
        if (ExecuteDlg->objectName().isEmpty())
            ExecuteDlg->setObjectName("ExecuteDlg");
        ExecuteDlg->resize(397, 175);
        ExecuteDlg->setMinimumSize(QSize(397, 175));
        ExecuteDlg->setMaximumSize(QSize(397, 175));
        QIcon icon1;
        icon1.addFile(QString::fromUtf8(":/16"), QSize(), QIcon::Mode::Normal, QIcon::State::Off);
        ExecuteDlg->setWindowIcon(icon1);
        centralwidget = new QWidget(ExecuteDlg);
        centralwidget->setObjectName("centralwidget");
        listView = new QListView(centralwidget);
        listView->setObjectName("listView");
        listView->setGeometry(QRect(2, 2, 394, 122));
        listView->setFrameShape(QFrame::Shape::NoFrame);
        cancelBtn = new QPushButton(centralwidget);
        cancelBtn->setObjectName("cancelBtn");
        cancelBtn->setGeometry(QRect(206, 137, 86, 24));
        browseBtn = new QPushButton(centralwidget);
        browseBtn->setObjectName("browseBtn");
        browseBtn->setGeometry(QRect(300, 137, 88, 24));
        okBtn = new QPushButton(centralwidget);
        okBtn->setObjectName("okBtn");
        okBtn->setGeometry(QRect(110, 137, 88, 24));
        okBtn->setAutoDefault(false);
        open = new QLabel(centralwidget);
        open->setObjectName("open");
        open->setGeometry(QRect(12, 72, 42, 33));
        description = new QLabel(centralwidget);
        description->setObjectName("description");
        description->setGeometry(QRect(72, 6, 313, 62));
        description->setWordWrap(true);
        icon = new QLabel(centralwidget);
        icon->setObjectName("icon");
        icon->setGeometry(QRect(18, 22, 32, 32));
        icon->setPixmap(QPixmap(QString::fromUtf8(":/32")));
        lineEdit = new QLineEdit(centralwidget);
        lineEdit->setObjectName("lineEdit");
        lineEdit->setGeometry(QRect(72, 78, 308, 24));
        lineEdit->setContextMenuPolicy(Qt::ContextMenuPolicy::NoContextMenu);
        lineEdit->setFrame(true);
        lineEdit->setClearButtonEnabled(true);
        ExecuteDlg->setCentralWidget(centralwidget);

        retranslateUi(ExecuteDlg);

        okBtn->setDefault(false);


        QMetaObject::connectSlotsByName(ExecuteDlg);
    } // setupUi

    void retranslateUi(QMainWindow *ExecuteDlg)
    {
        ExecuteDlg->setWindowTitle(QCoreApplication::translate("ExecuteDlg", "Run...", nullptr));
        cancelBtn->setText(QCoreApplication::translate("ExecuteDlg", "Cancel", nullptr));
        browseBtn->setText(QCoreApplication::translate("ExecuteDlg", "Browse...", nullptr));
        okBtn->setText(QCoreApplication::translate("ExecuteDlg", "OK", nullptr));
        open->setText(QCoreApplication::translate("ExecuteDlg", "Open:", nullptr));
        description->setText(QCoreApplication::translate("ExecuteDlg", "Type the name of a program, folder, document, or Internet resource, and Windows will open it for you.", nullptr));
    } // retranslateUi

};

namespace Ui {
    class ExecuteDlg: public Ui_ExecuteDlg {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_EXECUTEDLG_H
