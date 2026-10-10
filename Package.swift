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
                "NIMFtsDB",
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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMSDK.xcframework.zip", checksum: "88b6a421ac5b0d27c84172781cf0c391873b3564bdcc2324783877022a600873"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMSocketRocket.xcframework.zip", checksum: "b8dc075ed9968a6e5e5f268d70c7acc2b848e1dc7b61a798c9be7cc64b0b91ec"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMQuic.xcframework.zip", checksum: "219528a2bfb000e2cb34dd0b095566494e728c1c44c93815950cded329811257"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMAVChat.xcframework.zip", checksum: "fe5601f5c22a2fa9503ef618ee96a5a8b07cb717942fc34f5dbd9018b11a10b2"),
        remoteBinary("NIMFtsDB", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMFtsDB.xcframework.zip", checksum: "68e1e5e50b2f6d614d803d6dc5b810b5341d5c760c070f0c75f70fe64763c2b3"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NMC.xcframework.zip", checksum: "b7bc9871a99aa263c8fc5f2647da7509239f4067dab872fdb978afafaf986f48"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NMCBasicModuleFramework.xcframework.zip", checksum: "ee1ae142877c666b0673f9ed14cbb54055e6faf47bdf743091b2501bb6cf6f18"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMHA.xcframework.zip", checksum: "abbf9fff9065ab44830bcc3403db73c0184a4b0325c4e95ae8c1d8a615393431"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMAWSCore.xcframework.zip", checksum: "a76dbe16551f1b54e9972cd8ed830ef8a7be44a812a361676ccc3c66cce6ffcd"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMAWSS3.xcframework.zip", checksum: "db206b315d7870ded43c83c1ae2eb227916149b142bd3f5c1215b0c4ef322caa"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMQChat.xcframework.zip", checksum: "996981a83e6a4bff275310d2cdfd8af3a2983742765af4e903c112a698f01f05"),
    ]
)
