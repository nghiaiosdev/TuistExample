import ProjectDescription


let project = Project(name: "App",
                      organizationName: "NghianV",
                      packages: [],
                      settings: nil,
                      targets: [
                        Target(
                            name: "App",
                            platform: .iOS,
                            product: .app,
                            productName: "NghiaNVApp",
                            bundleId: "com.nghianv.app",
                            deploymentTarget: DeploymentTarget.iOS(
                                targetVersion: "10.0",
                                devices: [DeploymentDevice.iphone, DeploymentDevice.ipad]
                            ),
                            infoPlist: InfoPlist.extendingDefault(with: [
                                "CFBundleShortVersionString": "1.0.0",
                                "CFBundleVersion": "1.0",
                                "CFBundleDisplayName": "App Project.swift",
                                "UILaunchStoryboardName": "LaunchScreen",
                                "LSRequiresIPhoneOS": true,
                                "NSAppTransportSecurity": [
                                    "NSAllowsArbitraryLoads": true,
                                ],
                                "UIAppFonts": [
                                    "SF-Pro-Display-Semibold.otf",
                                    "SF-Pro-Display-Medium.otf",
                                    "SF-Pro-Display-Bold.otf",
                                    "SF-Pro-Display-Regular.otf",
                                    "SF-Pro-Display-LightItalic.otf",
                                    "SFUIText-Regular.ttf",
                                    "SFUIText-RegularItalic.ttf",
                                    "SFUIText-Semibold.ttf",
                                    "SFUIText-SemiboldItalic.ttf",
                                    "SFUIText-Medium.ttf",
                                    "EvilIcons.ttf",
                                    "Ionicons.ttf",
                                    "FontAwesome.ttf",
                                    "OCRA.ttf",
                                    "SF-Pro-Display-RegularItalic.otf",
                                ],
                                "ITSAppUsesNonExemptEncryption": false,
                                "LSApplicationQueriesSchemes": ["zalo", "facebook"],
                                "UIRequiredDeviceCapabilities": ["armv7", "arm64"],
                                "UIBackgroundModes": ["remote-notification"],
                                "UIStatusBarStyle": "UIStatusBarStyleLightContent",
                                "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
                                "UIUserInterfaceStyle": "Light",
                                "UIViewControllerBasedStatusBarAppearance": true,
                            ]), sources: ["Application/Sources/**"],
                            resources: ["Application/Resources/**"],
                            headers: Headers(public: ["Bridge/**"]),
                            entitlements: Path.relativeToRoot("NghiaNVApp.entitlements"),
                            dependencies: [
                                .target(name: "TargetA"),
                                .target(name: "TargetB"),
                                .target(name: "TargetC"),
                                
                                .sdk(name: "libz.tbd"),
                                .sdk(name: "libc++.tbd"),
                                .sdk(name: "UIKit.framework"),
                                .sdk(name: "StoreKit.framework"),
                                .sdk(name: "CoreGraphics.framework"),
                                .sdk(name: "AVFoundation.framework"),
                                
                                .framework(path: .relativeToRoot("Carthage/Build/iOS/RxSwift.framework")),
                                .framework(path: .relativeToRoot("Carthage/Build/iOS/RxCocoa.framework")),
                                .framework(path: .relativeToRoot("Carthage/Build/iOS/RxRelay.framework")),
                                .framework(path: .relativeToRoot("Carthage/Build/iOS/RxBlocking.framework")),
                                
                                .cocoapods(path: ".")
                            ],
                            settings: Settings(base: [
                                "OTHER_LDFLAGS": "$(inherited) -fprofile-instr-generate -lxml2 -ObjC",
                                "DEVELOPMENT_TEAM": "723KXVZ5C9",
                                "SWIFT_OBJC_BRIDGING_HEADER": "Bridge/App-Bridging-Header.h"
                            ])
                        ),
                        Target(
                            name: "TargetA",
                            platform: .iOS,
                            product: .staticFramework,
                            productName: "TargetA",
                            bundleId: "com.nghianv.targetA",
                            deploymentTarget: DeploymentTarget.iOS(
                                targetVersion: "10.0",
                                devices: [DeploymentDevice.iphone, DeploymentDevice.ipad]
                            ),
                            infoPlist: InfoPlist.extendingDefault(with: [:]),
                            sources: ["Targets/TargetA/Sources/**"],
                            resources: ["Targets/TargetA/Resources/**"]
                        ),
                        Target(
                            name: "TargetB",
                            platform: .iOS,
                            product: .staticFramework,
                            bundleId: "com.nghianv.targetB",
                            deploymentTarget: DeploymentTarget.iOS(
                                targetVersion: "10.0",
                                devices: [DeploymentDevice.iphone, DeploymentDevice.ipad]
                            ),
                            infoPlist: InfoPlist.extendingDefault(with: [:]),
                            sources: ["Targets/TargetB/Sources/**"],
                            resources: ["Targets/TargetB/Resources/**"]
                        ),
                        Target(
                            name: "TargetC",
                            platform: .iOS,
                            product: .staticFramework,
                            bundleId: "com.nghianv.targetC",
                            deploymentTarget: DeploymentTarget.iOS(
                                targetVersion: "10.0",
                                devices: [DeploymentDevice.iphone, DeploymentDevice.ipad]
                            ),
                            infoPlist: InfoPlist.extendingDefault(with: [:]),
                            sources: ["Targets/TargetC/Sources/**"],
                            resources: ["Targets/TargetC/Resources/**"]
                        )
                      ],
                      schemes: [
                        Scheme(
                            name: "App-Release",
                            shared: true,
                            buildAction: BuildAction(targets: ["App"]),
                            runAction: RunAction(executable: "App")
                            ),
                      ],
                      additionalFiles: [
                        "Project.swift",
                        "fastlane",
                        "Scripts",
                        "Cartfile",
                        "Cartfile.resolved",
                        "README.md",
                        ".tuist-version",
                        ".gitignore",
                        ".gitlab-ci.yml",
                        "Podfile",
                        "Podfile.lock"
                      ]
)
