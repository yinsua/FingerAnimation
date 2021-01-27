import QtQuick 2.10
import Qt3D.Core 2.10
import Qt3D.Render 2.10
import Qt3D.Input 2.0
import Qt3D.Extras 2.10
import Qt3D.Animation 2.10

DefaultSceneEntity {
    id: scene

    SkinnedPbrEffect {
        id: skinnedPbrEffect
    }

    SkinnedEntity {
        id: riggedSimple
        source: "untitled.gltf"
        baseColor: "blue"
        transform.scale: 1
        transform.translation: Qt.vector3d(5.0, 0.0, 0.0)
        createJointsEnabled: true

        onRootJointChanged: {
            var animation = animationComp.createObject(rootJoint)
            var targetJoint = rootJoint.childJoints[1].childJoints[0]//.childJoints[0]//.childJoints[0]
            animation.target = targetJoint
            animation.running = true
        }

        Component {
            id: animationComp
            SequentialAnimation {
                id: sequentialAnimation
                property variant target: null
                property real dz: -50.0
                loops: Animation.Infinite

                NumberAnimation {
                    target: sequentialAnimation.target
                    property: "rotationX"
                    from: 0
                    to: dz
                    duration: 1000
                    easing.type: Easing.OutCubic
                }
                NumberAnimation {
                    target: sequentialAnimation.target
                    property: "rotationX"
                    from: dz
                    to: 0
                    duration: 1000
                    easing.type: Easing.OutCubic
                }
            }
        }
    }
}

