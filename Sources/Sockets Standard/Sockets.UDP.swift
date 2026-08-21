public import RFC_768

extension Sockets {

    public enum UDP {}
}

extension Sockets.UDP {

    public typealias Port = RFC_768.Port
}

extension Sockets.UDP {

    public typealias Header = RFC_768.Header

    public typealias Length = RFC_768.Length

    public typealias Checksum = RFC_768.Checksum

    public typealias PseudoHeader = RFC_768.PseudoHeader
}

extension Sockets.UDP {

    public typealias Datagram = RFC_768.Datagram
}

extension Sockets.UDP {

    public static let protocolNumber = RFC_768.protocolNumber

    public static let minimumLength = RFC_768.minimumLength

    public static let headerSize = RFC_768.headerSize
}
