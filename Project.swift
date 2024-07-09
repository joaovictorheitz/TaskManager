import ProjectDescription

let project = Project(
    name: "TaskManager",
    targets: [
        .target(
            name: "TaskManager",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TaskManager",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["TaskManager/Sources/**"],
            resources: ["TaskManager/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "TaskManagerTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TaskManagerTests",
            infoPlist: .default,
            sources: ["TaskManager/Tests/**"],
            resources: [],
            dependencies: [.target(name: "TaskManager")]
        ),
    ],
    resourceSynthesizers: [.assets()]
)
