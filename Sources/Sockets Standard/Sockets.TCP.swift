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

public import RFC_9293

extension Sockets {
  /// Transmission Control Protocol (TCP) per RFC 9293
  ///
  /// TCP provides reliable, ordered, connection-oriented byte streams.
  ///
  /// ## Key Types
  ///
  /// - ``Port``: 16-bit port number
  /// - ``SequenceNumber``: 32-bit sequence number with modular arithmetic
  /// - ``State``: Connection state machine (11 states)
  /// - ``Header``: TCP segment header
  /// - ``Segment``: Complete TCP segment
  /// - ``TCB``: Transmission Control Block
  public enum TCP {}
}

// MARK: - Port

extension Sockets.TCP {
  /// TCP port number (16-bit)
  public typealias Port = RFC_9293.Port
}

// MARK: - Sequence Number

extension Sockets.TCP {
  /// TCP sequence number with modular arithmetic
  public typealias SequenceNumber = RFC_9293.SequenceNumber
}

// MARK: - State

extension Sockets.TCP {
  /// TCP connection state
  public typealias State = RFC_9293.`3`.`3`.State
}

// MARK: - Header

extension Sockets.TCP {
  /// TCP segment header
  public typealias Header = RFC_9293.`3`.`1`.Header

  /// TCP header data offset
  public typealias DataOffset = RFC_9293.`3`.`1`.DataOffset

  /// TCP control flags
  public typealias Flags = RFC_9293.`3`.`1`.Flags
}

// MARK: - Options

extension Sockets.TCP {
  /// TCP option
  public typealias Option = RFC_9293.`3`.`2`.Option

  /// SACK block
  public typealias SACKBlock = RFC_9293.`3`.`2`.SACK.Block
}

// MARK: - Segment

extension Sockets.TCP {
  /// Complete TCP segment (header + data)
  public typealias Segment = RFC_9293.Segment
}

// MARK: - TCB

extension Sockets.TCP {
  /// Transmission Control Block
  public typealias TCB = RFC_9293.TCB

  /// Send sequence variables
  public typealias SendVariables = RFC_9293.`3`.`3`.Send.Variables

  /// Receive sequence variables
  public typealias ReceiveVariables = RFC_9293.`3`.`3`.Receive.Variables
}

// MARK: - Constants

extension Sockets.TCP {
  /// TCP protocol number (6)
  public static let protocolNumber = RFC_9293.protocolNumber

  /// Minimum header size (20 bytes)
  public static let minimumHeaderSize = RFC_9293.minimumHeaderSize

  /// Maximum header size (60 bytes)
  public static let maximumHeaderSize = RFC_9293.maximumHeaderSize

  /// Default MSS for IPv4 (536 bytes)
  public static let defaultMSSIPv4 = RFC_9293.defaultMSSIPv4

  /// Default MSS for IPv6 (1220 bytes)
  public static let defaultMSSIPv6 = RFC_9293.defaultMSSIPv6
}
