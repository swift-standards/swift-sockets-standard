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

import Sockets_Standard
import Testing

@Suite("Sockets Standard Tests")
struct SocketsStandardTests {

  // MARK: - TCP Tests

  @Suite("TCP")
  struct TCPTests {

    @Test
    func `TCP port typealias works`() {
      let port = Sockets.TCP.Port.http
      #expect(port.rawValue == 80)
    }

    @Test
    func `TCP state typealias works`() {
      let state = Sockets.TCP.State.established
      #expect(state.canSendData)
      #expect(state.isSynchronized)
    }

    @Test
    func `TCP flags typealias works`() {
      let flags: Sockets.TCP.Flags = [.syn, .ack]
      #expect(flags.contains(.syn))
      #expect(flags.contains(.ack))
    }

    @Test
    func `TCP constants`() {
      #expect(Sockets.TCP.protocolNumber == 6)
      #expect(Sockets.TCP.minimumHeaderSize == 20)
      #expect(Sockets.TCP.maximumHeaderSize == 60)
    }
  }

  // MARK: - UDP Tests

  @Suite("UDP")
  struct UDPTests {

    @Test
    func `UDP port typealias works`() {
      let port = Sockets.UDP.Port.dns
      #expect(port.rawValue == 53)
    }

    @Test
    func `UDP datagram creation`() throws {
      let datagram = try Sockets.UDP.Datagram(
        source: 12345,
        destination: .dns,
        data: [0x00, 0x01, 0x00, 0x00]
      )
      #expect(datagram.header.source.rawValue == 12345)
      #expect(datagram.header.destination.rawValue == 53)
    }

    @Test
    func `UDP constants`() {
      #expect(Sockets.UDP.protocolNumber == 17)
      #expect(Sockets.UDP.headerSize == 8)
    }
  }

  // MARK: - IP Tests

  @Suite("IP")
  struct IPTests {

    @Test
    func `IPv4 address typealias works`() {
      let address = Sockets.IP.V4.Address(192, 168, 1, 1)
      #expect(address.octets.0 == 192)
      #expect(address.octets.1 == 168)
      #expect(address.octets.2 == 1)
      #expect(address.octets.3 == 1)
    }

    @Test
    func `IPv4 loopback`() {
      let loopback = Sockets.IP.V4.Address.loopback
      #expect(loopback.octets.0 == 127)
      #expect(loopback.octets.3 == 1)
    }
  }
}
