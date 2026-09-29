# Sockets Standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Typed socket protocol and address types for network communication in Swift.

`Sockets Standard` groups the pure domain models of the transport and network standards under one namespace and re-exports them: `Sockets.TCP` (RFC 9293 ports, sequence numbers, header, flags, options, connection state and the transmission control block), `Sockets.UDP` (RFC 768 ports, header, length, checksum, pseudo-header and datagram) and `Sockets.IP.V4` (RFC 791 addresses). Wire coders live in the sibling `swift-rfc-XXXX-coder` packages.

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
