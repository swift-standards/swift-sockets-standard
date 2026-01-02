// ===----------------------------------------------------------------------===//
//
// Copyright (c) 2025 Coen ten Thije Boonkkamp
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of project contributors
//
// SPDX-License-Identifier: Apache-2.0
//
// ===----------------------------------------------------------------------===//

/// Socket protocol types for network communication.
///
/// This namespace aggregates TCP (RFC 9293), UDP (RFC 768), and IP (RFC 791)
/// protocol specifications for socket-based networking.
///
/// ## Protocols
///
/// - ``TCP``: Transmission Control Protocol (reliable, ordered, connection-oriented)
/// - ``UDP``: User Datagram Protocol (unreliable, connectionless)
/// - ``IP``: Internet Protocol (addressing and routing)
///
/// ## Example
///
/// ```swift
/// // TCP types
/// let tcpPort = Sockets.TCP.Port.http
/// let state = Sockets.TCP.State.established
///
/// // UDP types
/// let udpPort = Sockets.UDP.Port.dns
/// let datagram = try Sockets.UDP.Datagram(
///     source: 12345,
///     destination: .dns,
///     data: queryData
/// )
///
/// // IP types
/// let address = Sockets.IP.V4.Address(192, 168, 1, 1)
/// ```
public enum Sockets: Sendable {}
