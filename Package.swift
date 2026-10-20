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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMSDK.xcframework.zip", checksum: "a4e7ac61fcc41653ba9257d8b343f8034fd62f8279c5e070cf14255b62740c74"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMSocketRocket.xcframework.zip", checksum: "35d02bd88fbda18d4e0baabf5fcf13d7a2834ad82d37f971d40f49ece14efb94"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMQuic.xcframework.zip", checksum: "cb5862dec984bc6f14c94c0285b28787615febc85a211d18b8662676efa17f50"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMAVChat.xcframework.zip", checksum: "5c96a8845dbd6cf158f90505a6aafa16d8737d7b6ad94b1253c886669403ebce"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMDBEx.xcframework.zip", checksum: "134f28f06556305d787ab329b8ea06bb474c84244b3aabf9568e44b153ca4599"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NMC.xcframework.zip", checksum: "120df37733d881a45305446e741c1c9767e4fdfdb63c21ebe71b860aa007722e"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NMCBasicModuleFramework.xcframework.zip", checksum: "47c32fa1895b6efa95aa63b032fd03a4b465aa9ef65fe0f85b4d8ccc77baf650"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMHA.xcframework.zip", checksum: "9115e2cf4c4caf8233e8459e3f36bbaa6d54b32286c09792a57f5cd32f8e2e86"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMAWSCore.xcframework.zip", checksum: "e562c74d0d1ce5d3a3a81473cbc770a6ecded8ce85715c8901be1cd69601516a"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMAWSS3.xcframework.zip", checksum: "f4caabd8c5279c0f3da31f6cb7cb81b7174eaac1cb1f9c8fec8e490082fe594e"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1792497319505/NIM_iOS_SDK_v10.10.13_9c8f122/NIMQChat.xcframework.zip", checksum: "ba313b8bf3c79699f92e53c07588e1754724cc02ac3e7d5592fb5959a8bfff8f"),
    ]
)
