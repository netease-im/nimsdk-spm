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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMSDK.xcframework.zip", checksum: "4f72636410b6d70ad737f4672c0e7df0c6e540264c021d6398d38b915d17c094"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMSocketRocket.xcframework.zip", checksum: "8f19753b84bd15feec4dd05ad3c9438a1cb92d3c3f4ebf6533a048bb188c9d5c"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMQuic.xcframework.zip", checksum: "8a941e3619ae71c9cd6f21f530daa2295db7e6c12a8df42eeea86f4d668af0ed"),
        remoteBinary("NIMAVChat", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMAVChat.xcframework.zip", checksum: "80b7f61ee4929dce7d1d355264cd197899a31294572547b23402cf80113cd7c0"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMDBEx.xcframework.zip", checksum: "04cb93c2b01e1bfbe2ce7c47a6a85eca954392fbdce454797fb943ee36ac41b6"),
        remoteBinary("NMC", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NMC.xcframework.zip", checksum: "0993ae1ca7a178363bfba30132332cf4065dfe50a96e3c7b78db93a57fde262c"),
        remoteBinary("NMCBasicModuleFramework", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NMCBasicModuleFramework.xcframework.zip", checksum: "684892720401454170c66ef2f4856996b3de4984a5fd8c816d53eda863c09971"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMHA.xcframework.zip", checksum: "148d1f99affe115444a307198c0105501b0c401f04d21d148d410aa0aaf7ad8c"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMAWSCore.xcframework.zip", checksum: "7499e9ee147a5cebce375431fa74644f1e8fe66e089fa04ebd34864698f029a5"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMAWSS3.xcframework.zip", checksum: "fe22ce0ef539cc25ce84c8a0e19084226eacef72406b673401ec2b25ca531e65"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1793950206504/NIM_iOS_SDK_v10.11.10_b8dea3b/NIMQChat.xcframework.zip", checksum: "33a74293eb7ffb451ab315b189936db8ddea14be8fe4af857c34d51928cf4982"),
    ]
)
