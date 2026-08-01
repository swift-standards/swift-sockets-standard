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

// MARK: - TCP Tests

extension Sockets.TCP {

    @Suite("TCP")
    struct Test {

        @Test
        func `TCP port typealias works`() {
            let port = Sockets.TCP.Port.http
            // swift-linter:disable:next raw value access
            // REASON: test asserts the RawRepresentable `rawValue` contract directly.
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
}

// MARK: - UDP Tests

extension Sockets.UDP {

    @Suite("UDP")
    struct Test {

        @Test
        func `UDP port typealias works`() {
            let port = Sockets.UDP.Port.dns
            // swift-linter:disable:next raw value access
            // REASON: test asserts the RawRepresentable `rawValue` contract directly.
            #expect(port.rawValue == 53)
        }

        @Test
        func `UDP datagram creation`() throws {
            let datagram = try Sockets.UDP.Datagram(
                source: 12345,
                destination: .dns,
                data: [0x00, 0x01, 0x00, 0x00]
            )
            // swift-linter:disable:next raw value access
            // REASON: test asserts the RawRepresentable `rawValue` contract directly.
            #expect(datagram.header.source.rawValue == 12345)
            // swift-linter:disable:next raw value access
            // REASON: test asserts the RawRepresentable `rawValue` contract directly.
            #expect(datagram.header.destination.rawValue == 53)
        }

        @Test
        func `UDP constants`() {
            #expect(Sockets.UDP.protocolNumber == 17)
            #expect(Sockets.UDP.headerSize == 8)
        }
    }
}

// MARK: - IP Tests

extension Sockets.IP {

    @Suite("IP")
    struct Test {

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
