public import RFC_768

extension Sockets {

    public enum UDP {}
}

extension Sockets.UDP {

    public typealias Port = IETF.RFC.`768`.Port
}

extension Sockets.UDP {

    public typealias Header = IETF.RFC.`768`.Header

    public typealias Length = IETF.RFC.`768`.Length

    public typealias Checksum = IETF.RFC.`768`.Checksum

    public typealias PseudoHeader = IETF.RFC.`768`.PseudoHeader
}

extension Sockets.UDP {

    public typealias Datagram = IETF.RFC.`768`.Datagram
}

extension Sockets.UDP {

    public static let protocolNumber = IETF.RFC.`768`.protocolNumber

    public static let minimumLength = IETF.RFC.`768`.minimumLength

    public static let headerSize = IETF.RFC.`768`.headerSize
}
