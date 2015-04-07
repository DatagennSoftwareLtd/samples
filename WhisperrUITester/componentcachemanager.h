#ifndef COMPONENTCACHEMANAGER
#define COMPONENTCACHEMANAGER

#include <QQmlApplicationEngine>
#include <QDebug>

class ComponentCacheManager : public QObject {
    Q_OBJECT
public:
    ComponentCacheManager(QQmlEngine *engine) : engine(engine) { }

    Q_INVOKABLE void trim()
    {
        engine->trimComponentCache();
    }
    Q_INVOKABLE void clear()
    {
        engine->clearComponentCache();
    }

private:
    QQmlEngine *engine;
};

#endif // COMPONENTCACHEMANAGER

