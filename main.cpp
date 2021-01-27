#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <Qt3DAnimation/QAnimationAspect>
#include <QGuiApplication>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    Qt3DExtras::Quick::Qt3DQuickWindow view;
    view.registerAspect(new Qt3DAnimation::QAnimationAspect());

    view.setSource(QUrl("qrc:/main.qml"));
    view.resize(1024,768);
    view.show();

    return app.exec();
}
