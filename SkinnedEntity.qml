import Qt3D.Core 2.10
import Qt3D.Render 2.10
import Qt3D.Input 2.0
import Qt3D.Extras 2.10

Entity {
    id: root

    property Effect effect: skinnedPbrEffect
    property url source: ""
    property alias createJointsEnabled: skeleton.createJointsEnabled
    property alias transform: transform
    property color baseColor: "red"
    property alias rootJoint: skeleton.rootJoint
    property alias skeleton: skeleton

    components: [
        Transform {
            id: transform
            rotationX: 180
            rotationY: 180
        },
        Mesh {
            source: root.source
        },

        Armature {
            skeleton: SkeletonLoader {
                id: skeleton
                source: root.source
                onStatusChanged: {
                    if(status === SkeletonLoader.Ready)
                        console.log("SkeletonLoader status ready")
                    else if(status === SkeletonLoader.NotReady)
                        console.log("SkeletonLoader status not ready")
                    else console.log("SkeletonLoader status error")
                }

                onJointCountChanged: console.log("skeleton has " + jointCount + " joints")
            }
        }
        ,
        TextureMaterial {
            effect: root.effect

            parameters: [
                Parameter { name: "baseColor"; value: root.baseColor }
            ]
        }
    ]
}
