# swift-sockets-standard

Use this package when you work with TCP, UDP and IPv4 values together, such as ports, headers, datagrams, addresses and connection state, and want them under one namespace. Start from `Sockets.TCP.Header` or `Sockets.TCP.TCB` for TCP, `Sockets.UDP.Datagram` for UDP, and `Sockets.IP.V4.Address` for addresses. Each name is the type from the protocol's own package, and those packages are imported with this one. If you need only one protocol, use swift-rfc-9293 for TCP, swift-rfc-768 for UDP or swift-rfc-791 for IPv4.

## Laws

- A `Sockets.TCP.TCB` built with an initial send sequence number has its next send sequence number one past it.
- Without a negotiated maximum segment size, a `Sockets.TCP.TCB` over IPv4 uses `Sockets.TCP.defaultMSSIPv4`.
- A `Sockets.TCP.Header` built without options has a data offset of `Sockets.TCP.minimumHeaderSize`, 20 bytes.
- A `Sockets.UDP.Datagram` sets its length to the 8 byte header plus its payload. A datagram with an empty payload has `Sockets.UDP.minimumLength` and no checksum.
