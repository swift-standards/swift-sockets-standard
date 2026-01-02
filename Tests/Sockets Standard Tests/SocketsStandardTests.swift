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

    @Test("TCP port typealias works")
    func tcpPort() {
      let port = Sockets.TCP.Port.http
      #expect(port.rawValue == 80)
    }

    @Test("TCP state typealias works")
    func tcpState() {
      let state = Sockets.TCP.State.established
      #expect(state.canSendData)
      #expect(state.isSynchronized)
    }

    @Test("TCP flags typealias works")
    func tcpFlags() {
      let flags: Sockets.TCP.Flags = [.syn, .ack]
      #expect(flags.contains(.syn))
      #expect(flags.contains(.ack))
    }

    @Test("TCP constants")
    func tcpConstants() {
      #expect(Sockets.TCP.protocolNumber == 6)
      #expect(Sockets.TCP.minimumHeaderSize == 20)
      #expect(Sockets.TCP.maximumHeaderSize == 60)
    }
  }

  // MARK: - UDP Tests

  @Suite("UDP")
  struct UDPTests {

    @Test("UDP port typealias works")
    func udpPort() {
      let port = Sockets.UDP.Port.dns
      #expect(port.rawValue == 53)
    }

    @Test("UDP datagram creation")
    func udpDatagram() throws {
      let datagram = try Sockets.UDP.Datagram(
        source: 12345,
        destination: .dns,
        data: [0x00, 0x01, 0x00, 0x00]
      )
      #expect(datagram.header.source.rawValue == 12345)
      #expect(datagram.header.destination.rawValue == 53)
    }

    @Test("UDP constants")
    func udpConstants() {
      #expect(Sockets.UDP.protocolNumber == 17)
      #expect(Sockets.UDP.headerSize == 8)
    }
  }

  // MARK: - IP Tests

  @Suite("IP")
  struct IPTests {

    @Test("IPv4 address typealias works")
    func ipv4Address() {
      let address = Sockets.IP.V4.Address(192, 168, 1, 1)
      #expect(address.octets.0 == 192)
      #expect(address.octets.1 == 168)
      #expect(address.octets.2 == 1)
      #expect(address.octets.3 == 1)
    }

    @Test("IPv4 loopback")
    func ipv4Loopback() {
      let loopback = Sockets.IP.V4.Address.loopback
      #expect(loopback.octets.0 == 127)
      #expect(loopback.octets.3 == 1)
    }
  }
}
