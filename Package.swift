// swift-tools-version:5.7
import PackageDescription

func remoteBinary(_ name: String, url: String, checksum: String) -> Target {
    .binaryTarget(
        name: name,
        url: url,
        checksum: checksum
    )
}

let commonLinkerSettings: [LinkerSetting] = [
    .linkedFramework("SystemConfiguration"),
    .linkedFramework("AVFoundation"),
    .linkedFramework("CoreTelephony"),
    .linkedFramework("AudioToolbox"),
    .linkedFramework("CoreMedia"),
    .linkedFramework("VideoToolbox"),
    .linkedLibrary("sqlite3"),
    .linkedLibrary("z"),
    .linkedLibrary("c++"),
    .linkedLibrary("resolv"),
]

let package = Package(
    name: "NIMSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "NIMSDK", targets: ["NIMSDK_NOS"]),
        .library(name: "NOS", targets: ["NIMSDK_NOS"]),
        .library(name: "FCS", targets: ["NIMSDK_FCS"]),
        .library(name: "BASE", targets: ["NIMSDK_BASE"]),
        .library(name: "QChat", targets: ["NIMSDK_QChat"]),
    ],
    targets: [
        .target(
            name: "NIMSDK_NOS",
            dependencies: [
                "NIMSDK",
                "NIMSocketRocket",
                "NIMQuic",
                "NIMAVChat",
                "NIMDBEx",
                "NMC",
                "NMCBasicModuleFramework",
                "NIMNOS"
            ],
            path: "Sources/NOS",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_FCS",
            dependencies: [
                "NIMSDK",
                "NIMSocketRocket",
                "NIMQuic",
                "NIMAVChat",
                "NIMDBEx",
                "NMC",
                "NMCBasicModuleFramework",
                "NIMFCS",
                "NIMAWSCore",
                "NIMAWSS3"
            ],
            path: "Sources/FCS",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_BASE",
            dependencies: [
                "NIMSDK",
                "NIMSocketRocket",
                "NIMQuic",
                "NIMAVChat",
                "NMC",
                "NMCBasicModuleFramework",
                "NIMNOS"
            ],
            path: "Sources/BASE",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_QChat",
            dependencies: [
                "NIMQChat"
            ],
            path: "Sources/QChat",
            linkerSettings: commonLinkerSettings
        ),
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMSDK.xcframework.zip", checksum: "31011ec03c4ed8682b1901c77d876eb89bbcb92278917b3123ba25521be311fc"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMSocketRocket.xcframework.zip", checksum: "c8fce129ee03d2c522d16c418644fa7b2f107515f1043a4517baa31342e88555"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMQuic.xcframework.zip", checksum: "93e6ab8baf48ebb988404a5bab04718b0ea3400065d893470708b08506bd3dfc"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMAVChat.xcframework.zip", checksum: "a8172062331733a9a9277cf9159e4c8bd35b108827ec204f8ace9e1f3a840f2f"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMDBEx.xcframework.zip", checksum: "438bac8b5ec1d037e54f82c27430ce41712c48078397c7eb66adfd7c7d184f17"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NMC.xcframework.zip", checksum: "6cbe5858a0b8b8e7b3f30f9a63488aa82bcee6c367b14daf07ff3fb6d2a54fae"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NMCBasicModuleFramework.xcframework.zip", checksum: "e6aa51e1822b8ff5cd55d0949521b472d46ed976f1d48c87768449cc1a66d762"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMNOS.xcframework.zip", checksum: "c9b7018bc941b5308541903219b1fc24f9bbbbd51ccbbf57ea1cc4e0e71cc65b"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMFCS.xcframework.zip", checksum: "92171e6af565a04e7f2d8efb1130c635cb3663a734a0a9c72945b7ee933fc402"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMAWSCore.xcframework.zip", checksum: "c6e4377554719e33e5a4ea23be1de7ca97bfa162498320ed4e645532b267cd15"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMAWSS3.xcframework.zip", checksum: "0b96d4726624c3b8ba87642f1ff85aac045f7ac28feed129a8efcb81caf79816"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMQChat.xcframework.zip", checksum: "3ad42d6b77925656b269ed14f9bc3abcf5d88212ab205c79917a76ee3f94c8e3"),
    ]
)
