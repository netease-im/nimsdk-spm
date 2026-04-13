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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMSDK.xcframework.zip", checksum: "1134ab33ec47a472edc095f98c85c91cdeeb3b1278e6ad3ce89c7a731fbcb998"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMSocketRocket.xcframework.zip", checksum: "8b5e6a75546184a5228c5bc5ff5296dfcd6384dbd286c8d006fdbcca90a705d0"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMQuic.xcframework.zip", checksum: "46b821fdb7ebcda1f144ead129940fe7847b2233180fac9399edc09cf6725da6"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMAVChat.xcframework.zip", checksum: "82c9301515af4f17a138855fcfc9380c1d7d8f0fddf6431e2b52eb2582cd08b3"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMDBEx.xcframework.zip", checksum: "bbcf511d9f43ff70ec5ed7dfc49e4abacca7d7a8aa7da10261109af6de6203e8"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NMC.xcframework.zip", checksum: "9eee7839259bbea73bdeb8204c80efdfcf8f5743e14a3c11ab28237bf0d02a0c"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NMCBasicModuleFramework.xcframework.zip", checksum: "2b18e4cead5e6ecab3f872df46aa6af2fd87764f5632e4e7622e32fd736c407a"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMNOS.xcframework.zip", checksum: "78a9ae501252f4f5411024fa3fbddafdf6121d4f878784f72ab0376eb5dc0395"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMFCS.xcframework.zip", checksum: "24c673ba0e601be385af5ba3028c87f251c6ac32f4af7253723aa5f97ffb38e8"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMAWSCore.xcframework.zip", checksum: "edb97c348ecee571cca003f65437a83c51d1208aa3dba248349d45c7da14bd9d"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMAWSS3.xcframework.zip", checksum: "f550a7f701de87371e3c461b82c14781f3ce7ef4153465f0a8d4653d8cdb2654"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1776051042803/NIM_iOS_SDK_v10.9.80_0d83e54/NIMQChat.xcframework.zip", checksum: "29c2e3b5ee465e09d8e977b55f13d6759429237148837bf7a1c681f1c7c4f2b4"),
    ]
)
