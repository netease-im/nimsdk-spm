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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMSDK.xcframework.zip", checksum: "9bc690406039563b487fbd13d262c7cb01eeacc20dd67975d1af149dd35d0639"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMSocketRocket.xcframework.zip", checksum: "e45c21b3ead73205e34437f46ff444e656ed9629ef59a8c296d12f3771c992e1"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMQuic.xcframework.zip", checksum: "d7079c689f1e13b3a2d874ba7dbaef639a4c2809a86fa3ad3e6cddbe75381c08"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMAVChat.xcframework.zip", checksum: "9595e2ef1ca800fd63a4003dc75b8a92559989f2ff6616f5f8afdf412d599a72"),
        remoteBinary("NIMFtsDB", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMFtsDB.xcframework.zip", checksum: "6a9f3bc5c41ce628d400305d5b6ba9863d7672da70c6fe1fd8097e16b0012dd9"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NMC.xcframework.zip", checksum: "1a8018dbed97aa3e1956c191bed3d745617071e15ed73ed93436b83cc85f85bb"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NMCBasicModuleFramework.xcframework.zip", checksum: "4636c8f67b4ed163bafc1ed22fd557de8981bdc530458f717e02b9ab0b742b1d"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMNOS.xcframework.zip", checksum: "dc6e5cbf84cd27293c0038e98300b006fb355468301dd5252624f6aa634a3846"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMFCS.xcframework.zip", checksum: "0701861ebc7ac83ec947ee467567287e94b54b4286e2959ddee620f519cd0fbe"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMAWSCore.xcframework.zip", checksum: "16f5dcc8f112bcde241bd0fcfc3226f35fef5f99f9059d834f4ce45b19e7363b"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMAWSS3.xcframework.zip", checksum: "7ff6e00eac5dc3e91d2f2690e6e7f3f4a3ff9e5a4ce942f24ad75937b36f7a55"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1788336365707/NIM_iOS_SDK_v9.21.14_8fe4312/NIMQChat.xcframework.zip", checksum: "9fc9b46d060259c36209b63f8f34881ec1baf0593e29d3d51292f3d6059f7f5f"),
    ]
)
