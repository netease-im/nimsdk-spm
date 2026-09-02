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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMSDK.xcframework.zip", checksum: "23cbe2a5ed1912fab93212579f138e4636581953a424b78020bb1f6d3a02cfa1"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMSocketRocket.xcframework.zip", checksum: "2791d367b736cb27859cfcc5777980ad9f3b2a9ea41015854d2697a2e6605dac"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMQuic.xcframework.zip", checksum: "10c38e0560c91d885c86221b25b214dd65c27aa01c757a81b0d829b7605be59a"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMAVChat.xcframework.zip", checksum: "a44d3dad1f0af40d322790318340c21e5d94c434c611c146f6b8dba46babd0c7"),
        remoteBinary("NIMFtsDB", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMFtsDB.xcframework.zip", checksum: "6f9c75e40085adf91fd9418a5286a3caad3c3a12b9e65180a099d88ea69b8d90"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NMC.xcframework.zip", checksum: "6102e313aef45c48a72fcd7714d08fc231eda203c0fc65572aa9299408bb23c5"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NMCBasicModuleFramework.xcframework.zip", checksum: "14d13157caa0172bf5545c66df218933fa7163473a6be517ea3eeb42d2d4a19a"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMNOS.xcframework.zip", checksum: "2a818a9494ee44d12230f172be029a8671f682d792477d0b4f7b3a681677ffed"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMFCS.xcframework.zip", checksum: "a23a5ce0a526b3e18d12c218959be063d46159db6edb99d60c5a82a64ff6efd8"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMAWSCore.xcframework.zip", checksum: "9db4ea1e98ff6b81dbf2789b8670384ad41b35ee0af2d91145efd8dfacb47451"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMAWSS3.xcframework.zip", checksum: "1b5d100d8290ecf5bff1127769c8a1bd432919e4d8b634b1ad35bebfc065e323"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1788335180843/NIM_iOS_SDK_v9.21.13_f48cfe2/NIMQChat.xcframework.zip", checksum: "0a131d01b19266aa024f89562131214ce68d567b8ff95e51a43c1b1a3727e891"),
    ]
)
