// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-sockets-standard",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
    ],
    products: [
        .library(name: "Sockets Standard", targets: ["Sockets Standard"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-ietf/swift-rfc-768.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-791.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-9293.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Sockets Standard",
            dependencies: [
                .product(name: "RFC 768", package: "swift-rfc-768"),
                .product(name: "RFC 791", package: "swift-rfc-791"),
                .product(name: "RFC 9293", package: "swift-rfc-9293"),
            ]
        ),
        .testTarget(
            name: "Sockets Standard Tests",
            dependencies: [
                "Sockets Standard"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
