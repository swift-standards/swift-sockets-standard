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

public import RFC_768

extension Sockets {
  /// User Datagram Protocol (UDP) per RFC 768
  ///
  /// UDP provides a simple, connectionless datagram service.
  ///
  /// ## Key Types
  ///
  /// - ``Port``: 16-bit port number
  /// - ``Header``: 8-byte UDP header
  /// - ``Datagram``: Complete UDP datagram
  /// - ``Checksum``: One's complement checksum
  public enum UDP {}
}

// MARK: - Port

extension Sockets.UDP {
  /// UDP port number (16-bit)
  public typealias Port = RFC_768.Port
}

// MARK: - Header

extension Sockets.UDP {
  /// UDP datagram header (8 bytes)
  public typealias Header = RFC_768.Header

  /// UDP datagram length
  public typealias Length = RFC_768.Length

  /// UDP checksum
  public typealias Checksum = RFC_768.Checksum

  /// IPv4 pseudo-header for checksum computation
  public typealias PseudoHeader = RFC_768.PseudoHeader
}

// MARK: - Datagram

extension Sockets.UDP {
  /// Complete UDP datagram (header + data)
  public typealias Datagram = RFC_768.Datagram
}

// MARK: - Constants

extension Sockets.UDP {
  /// UDP protocol number (17)
  public static let protocolNumber = RFC_768.protocolNumber

  /// Minimum datagram length (8 bytes, header only)
  public static let minimumLength = RFC_768.minimumLength

  /// Header size (8 bytes)
  public static let headerSize = RFC_768.headerSize
}
