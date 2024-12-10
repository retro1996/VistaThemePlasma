/****************************************************************************
** Meta object code from reading C++ file 'SevenStart.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/SevenStart.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SevenStart.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.8.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSSevenStartENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSSevenStartENDCLASS = QtMocHelpers::stringData(
    "SevenStart",
    "onCompositingChanged",
    "",
    "enabled",
    "onShowingDesktopChanged",
    "syncBorders",
    "geom",
    "Plasma::Types::Location",
    "location",
    "setDashWindow",
    "QQuickWindow*",
    "w",
    "mask",
    "svg",
    "enableShadow",
    "enable",
    "fileExists",
    "path",
    "setOrb",
    "setMask",
    "overrideMask",
    "setTransparentWindow",
    "setActiveWin",
    "setDialogAppearance"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSSevenStartENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   80,    2, 0x0a,    1 /* Public */,
       4,    1,   83,    2, 0x0a,    3 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       5,    2,   86,    2, 0x02,    5 /* Public */,
       9,    3,   91,    2, 0x02,    8 /* Public */,
      14,    1,   98,    2, 0x02,   12 /* Public */,
      16,    1,  101,    2, 0x02,   14 /* Public */,
      18,    1,  104,    2, 0x02,   16 /* Public */,
      19,    2,  107,    2, 0x02,   18 /* Public */,
      21,    0,  112,    2, 0x02,   21 /* Public */,
      22,    1,  113,    2, 0x02,   22 /* Public */,
      23,    2,  116,    2, 0x02,   24 /* Public */,

 // slots: parameters
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,

 // methods: parameters
    QMetaType::Void, QMetaType::QRect, 0x80000000 | 7,    6,    8,
    QMetaType::Void, 0x80000000 | 10, QMetaType::QRegion, QMetaType::QUrl,   11,   12,   13,
    QMetaType::Void, QMetaType::Bool,   15,
    QMetaType::Bool, QMetaType::QUrl,   17,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,   12,   20,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, 0x80000000 | 10, QMetaType::QRegion,   11,   12,

       0        // eod
};

Q_CONSTINIT const QMetaObject SevenStart::staticMetaObject = { {
    QMetaObject::SuperData::link<Plasma::Applet::staticMetaObject>(),
    qt_meta_stringdata_CLASSSevenStartENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSSevenStartENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSSevenStartENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<SevenStart, std::true_type>,
        // method 'onCompositingChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'onShowingDesktopChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'syncBorders'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QRect &, std::false_type>,
        QtPrivate::TypeAndForceComplete<Plasma::Types::Location, std::false_type>,
        // method 'setDashWindow'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QQuickWindow *, std::false_type>,
        QtPrivate::TypeAndForceComplete<QRegion, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl, std::false_type>,
        // method 'enableShadow'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'fileExists'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl, std::false_type>,
        // method 'setOrb'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QQuickWindow *, std::false_type>,
        // method 'setMask'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'setTransparentWindow'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'setActiveWin'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QQuickWindow *, std::false_type>,
        // method 'setDialogAppearance'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QQuickWindow *, std::false_type>,
        QtPrivate::TypeAndForceComplete<QRegion, std::false_type>
    >,
    nullptr
} };

void SevenStart::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SevenStart *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->onCompositingChanged((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 1: _t->onShowingDesktopChanged((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 2: _t->syncBorders((*reinterpret_cast< std::add_pointer_t<QRect>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<Plasma::Types::Location>>(_a[2]))); break;
        case 3: _t->setDashWindow((*reinterpret_cast< std::add_pointer_t<QQuickWindow*>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QRegion>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[3]))); break;
        case 4: _t->enableShadow((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 5: { bool _r = _t->fileExists((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 6: _t->setOrb((*reinterpret_cast< std::add_pointer_t<QQuickWindow*>>(_a[1]))); break;
        case 7: _t->setMask((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<bool>>(_a[2]))); break;
        case 8: _t->setTransparentWindow(); break;
        case 9: _t->setActiveWin((*reinterpret_cast< std::add_pointer_t<QQuickWindow*>>(_a[1]))); break;
        case 10: _t->setDialogAppearance((*reinterpret_cast< std::add_pointer_t<QQuickWindow*>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QRegion>>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickWindow* >(); break;
            }
            break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickWindow* >(); break;
            }
            break;
        case 9:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickWindow* >(); break;
            }
            break;
        case 10:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickWindow* >(); break;
            }
            break;
        }
    }
}

const QMetaObject *SevenStart::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SevenStart::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSSevenStartENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return Plasma::Applet::qt_metacast(_clname);
}

int SevenStart::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Plasma::Applet::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    return _id;
}
QT_WARNING_POP
