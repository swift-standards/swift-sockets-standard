# Sockets Standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Typed socket protocol and address types for network communication in Swift.

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-sockets-standard.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Sockets Standard", package: "swift-sockets-standard")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
