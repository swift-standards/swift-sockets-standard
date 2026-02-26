// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-sockets-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(name: "Sockets Standard", targets: ["Sockets Standard"])
    ],
    dependencies: [
        .package(path: "../swift-rfc-768"),
        .package(path: "../swift-rfc-791"),
        .package(path: "../swift-rfc-9293")
    ],
    targets: [
        .target(
            name: "Sockets Standard",
            dependencies: [
                .product(name: "RFC 768", package: "swift-rfc-768"),
                .product(name: "RFC 791", package: "swift-rfc-791"),
                .product(name: "RFC 9293", package: "swift-rfc-9293")
            ]
        ),
        .testTarget(
            name: "Sockets Standard Tests",
            dependencies: [
                "Sockets Standard",
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
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
