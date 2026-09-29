import Byte
import Sockets_Standard
import Testing

func bytes(_ values: UInt8...) -> [Byte] {
    values.map(Byte.init(bitPattern:))
}

func octets(_ first: UInt8, _ second: UInt8, _ third: UInt8, _ fourth: UInt8) -> (Byte, Byte, Byte, Byte) {
    (
        Byte(bitPattern: first),
        Byte(bitPattern: second),
        Byte(bitPattern: third),
        Byte(bitPattern: fourth)
    )
}

func address(_ first: UInt8, _ second: UInt8, _ third: UInt8, _ fourth: UInt8) -> Sockets.IP.V4.Address {
    Sockets.IP.V4.Address(
        Byte(bitPattern: first),
        Byte(bitPattern: second),
        Byte(bitPattern: third),
        Byte(bitPattern: fourth)
    )
}

extension Sockets.TCP {

    @Suite struct `Transmission Control Protocol` {

        @Test
        func `An established connection block sends and receives in both directions`() {
            let block = Sockets.TCP.TCB(
                local: Sockets.TCP.TCB.Socket(
                    address: address(192, 168, 1, 1),
                    port: Sockets.TCP.Port(49152)
                ),
                remote: Sockets.TCP.TCB.Socket(
                    address: Sockets.IP.V4.Address.loopback,
                    port: .http
                ),
                state: .established,
                send: Sockets.TCP.Send.Variables(iss: Sockets.TCP.SequenceNumber(rawValue: 1_000)),
                receive: Sockets.TCP.Receive.Variables(
                    irs: Sockets.TCP.SequenceNumber(rawValue: 5_000),
                    windowSize: 8_192
                )
            )

            #expect(block.isSynchronized)
            #expect(block.canSend)
            #expect(block.canReceive)
            #expect(block.send.nxt == Sockets.TCP.SequenceNumber(rawValue: 1_001))
            #expect(block.effectiveMSS == Sockets.TCP.defaultMSSIPv4)
        }

        @Test
        func `A handshake header opens a connection to the web port`() {
            let header = Sockets.TCP.Header(
                sourcePort: Sockets.TCP.Port(49152),
                destinationPort: .http,
                sequenceNumber: Sockets.TCP.SequenceNumber(rawValue: 1_000),
                acknowledgmentNumber: Sockets.TCP.SequenceNumber(rawValue: 0),
                flags: .syn,
                window: 65_535,
                checksum: 0,
                urgentPointer: 0
            )

            #expect(header.destinationPort.rawValue == 80)
            #expect(header.flags.contains(.syn))
            #expect(!header.flags.contains(.ack))
            #expect(header.dataOffset.headerLength == Sockets.TCP.minimumHeaderSize)
        }

        @Test
        func `A synchronise acknowledgement carries both control flags`() {
            let flags: Sockets.TCP.Flags = .synAck

            #expect(flags.contains(.syn))
            #expect(flags.contains(.ack))
            #expect(!flags.contains(.fin))
        }

        @Test
        func `A selective acknowledgement option reports the received range`() {
            let block = Sockets.TCP.SACK.Block(
                leftEdge: Sockets.TCP.SequenceNumber(rawValue: 2_000),
                rightEdge: Sockets.TCP.SequenceNumber(rawValue: 3_000)
            )
            let option = Sockets.TCP.Option.sack([block])

            #expect(option.kind == Sockets.TCP.Option.Kind.sack.rawValue)
            #expect(block.rightEdge - block.leftEdge == 1_000)
        }

        @Test
        func `The specification pins the protocol number and the header bounds`() {
            #expect(Sockets.TCP.protocolNumber == 6)
            #expect(Sockets.TCP.minimumHeaderSize == 20)
            #expect(Sockets.TCP.maximumHeaderSize == 60)
        }
    }
}

extension Sockets.UDP {

    @Suite struct `User Datagram Protocol` {

        @Test
        func `A query addressed to the name service carries its payload`() throws {
            let datagram = try Sockets.UDP.Datagram(
                source: 12_345,
                destination: .dns,
                data: bytes(0x00, 0x01, 0x00, 0x00)
            )

            #expect(datagram.header.source.rawValue == 12_345)
            #expect(datagram.header.destination.rawValue == 53)
            #expect(datagram.header.length.rawValue == 12)
            #expect(datagram.data == bytes(0x00, 0x01, 0x00, 0x00))
        }

        @Test
        func `A datagram without a payload is the minimum length`() throws {
            let datagram = try Sockets.UDP.Datagram(
                source: .dns,
                destination: 12_345,
                data: []
            )

            #expect(datagram.header.length.rawValue == Sockets.UDP.minimumLength)
            #expect(datagram.header.checksum.isAbsent)
        }

        @Test
        func `The specification pins the protocol number and the header size`() {
            #expect(Sockets.UDP.protocolNumber == 17)
            #expect(Sockets.UDP.headerSize == 8)
        }
    }
}

extension Sockets.IP {

    @Suite struct `Internet Protocol` {

        @Test
        func `A private network address reads back as its four octets`() {
            let host = address(192, 168, 1, 1)

            #expect(host.octets == octets(192, 168, 1, 1))
        }

        @Test
        func `The loopback address answers on the local host`() {
            let loopback = Sockets.IP.V4.Address.loopback

            #expect(loopback.octets == octets(127, 0, 0, 1))
        }
    }
}
