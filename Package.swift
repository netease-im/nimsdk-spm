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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMSDK.xcframework.zip", checksum: "775522b2a8276cd1919b6c36108cea05591138d516226af89ecc903d25d6e9b5"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMSocketRocket.xcframework.zip", checksum: "76f8de4abbad7870759cccad48042e1b19cd24a1e783ce8cb59a36e22fdec940"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMQuic.xcframework.zip", checksum: "8e970c51d41862865327f032c3fb5b993f1ec4bbc52b3a95126b771820ff8ce3"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMAVChat.xcframework.zip", checksum: "59179ad23ae3dcef0c767b0f58e54f0f582afa50d3f6b414181dceb5f0147231"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMDBEx.xcframework.zip", checksum: "954ed47f95775979ca41827ee339ed2faf15ca82224401d676af71f7acbb626d"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NMC.xcframework.zip", checksum: "cd02a6c055672aae6d64ada26e5d152d5d7b2214127b8566e07545e1373fb877"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NMCBasicModuleFramework.xcframework.zip", checksum: "1b5d1d2de0e40f019ec134f87ac5247ddd81f9d38e52b8b5f2e7df9f88f8313f"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMNOS.xcframework.zip", checksum: "95b1a89e135eec9bdac2043adf945f2d9253bfecd9101d3143b992b75802441b"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMFCS.xcframework.zip", checksum: "d12a37119615d8caa7a0a57628baecfbf96949ef3dad5dc68ef34f75a6f0aef8"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMAWSCore.xcframework.zip", checksum: "8ce1c6e033a234a03554b6eeb0bc0146efec4575a4ffaa22199122f8ffb6af7b"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMAWSS3.xcframework.zip", checksum: "2da44aa153e98dd636e20fcda9adba6fbbdda8fc3194e311ef2ad9ed9524994c"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMQChat.xcframework.zip", checksum: "272f3c8d655b6c1359a5591a052c83c027bc7c29b13a4584e8d1983b131673a2"),
    ]
)
