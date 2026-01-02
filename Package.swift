// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-sockets-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
    ],
    products: [
        .library(name: "Sockets Standard", targets: ["Sockets Standard"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-rfc-768", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-rfc-791", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-rfc-9293", from: "0.1.0"),
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
            dependencies: ["Sockets Standard"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings = existing + [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
    ]
}
