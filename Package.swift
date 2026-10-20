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
                "NIMHA"
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
                "NIMHA",
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
                "NIMHA"
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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMSDK.xcframework.zip", checksum: "3c7ec0826e1d6e3cf59b2908fb830e3b7f3d8361d7704ae4d73d519bdd2cf8b1"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMSocketRocket.xcframework.zip", checksum: "61cc7670eccf24468525b103833ea8a0b8281e648ac8db36e7a9189a086b39eb"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMQuic.xcframework.zip", checksum: "2851473c3c7ab211ee0b2b1b10f855ef784cad7955dbe74374ad73019af1758f"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMAVChat.xcframework.zip", checksum: "a09653a9895ad64a4d16a869510dec79b07fd566cbdc6d42eedd6696176f2924"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMDBEx.xcframework.zip", checksum: "a618faba119ec755a6d4ba640613eae226a9634749be63946a1c84180d49a1aa"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NMC.xcframework.zip", checksum: "3d09032c61df660f51b4aad3535ba8900e2403f88bcd6a0cbc88747971939913"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NMCBasicModuleFramework.xcframework.zip", checksum: "5b00af455b7b41d446a0ece18ef05e045bc6fa8fd9afae0a0fcba58acc4895d5"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMHA.xcframework.zip", checksum: "b609f73c4b250aafce7a607759b8d1c8ad5610af360c6583d13175cac066e6a5"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMAWSCore.xcframework.zip", checksum: "9d53a9e74a68a901b0754063585ec38295f29ef087497c19cda37b96f6c315f9"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMAWSS3.xcframework.zip", checksum: "f0a94323268ebb424f264c49777e7b5be29e046bf959a4a5862dd4049158515a"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMQChat.xcframework.zip", checksum: "a6dd0c508ad9ba08b162c5cc75905c2e4b600b30007743bb35a59a1e79cfc813"),
    ]
)
