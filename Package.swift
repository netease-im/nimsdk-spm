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
                "NIMFtsDB",
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
                "NIMFtsDB",
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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMSDK.xcframework.zip", checksum: "7f5dbcd1ea5cbc02e3ed4e6a4031b5c9f5d1cba58703cb843a9f2de61bdac200"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMSocketRocket.xcframework.zip", checksum: "520da7360e43c0f989570e12d21afec9cf720fcb04568b3ecec45865145c4c1c"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMQuic.xcframework.zip", checksum: "e6cc35dc755f2a67fdc429bb42917fc071b582b1cc8288d8c70c2ff60720b0ad"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMAVChat.xcframework.zip", checksum: "88578c5ee6060a78ba3320170b87c045936f1bdb1aaf6913ad770c8f123b95cb"),
        remoteBinary("NIMFtsDB", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMFtsDB.xcframework.zip", checksum: "f5544df26003c29e75a851190942ed66208160f01237268939212c816620cf74"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NMC.xcframework.zip", checksum: "78715ec6279fbf400aec26b008919fb596aec26d0bf4868ebcaa4058ec3e7003"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NMCBasicModuleFramework.xcframework.zip", checksum: "4e63f48fd044276201bdcfc5bc43ad2136215c82e260cd8a65bef8ac3e0a73e5"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMNOS.xcframework.zip", checksum: "acaa9f97f57c13b34b22b01f25bf5606682408d2fdc906b83b04b65c1af9f073"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMFCS.xcframework.zip", checksum: "d2f103e08434510708fc725da703f211f36029d3b5579a2de3802ce34bafa2e7"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMAWSCore.xcframework.zip", checksum: "87fc4a18d6ed789a0d1f6c2f4391afdd57b5eec7fe0032a764411414c0180656"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMAWSS3.xcframework.zip", checksum: "3bcdea8fa8be56022a2674927c24212d2627dc30d7cf0cb2571f95abf5b10bb7"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMQChat.xcframework.zip", checksum: "f0299b90dd9fd20ea479bf482ab2a4fde364116865baa86787facdf23c6eaa3e"),
    ]
)
