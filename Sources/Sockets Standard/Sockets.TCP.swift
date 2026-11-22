public import RFC_9293

extension Sockets {

    public enum TCP {}
}

extension Sockets.TCP {

    public typealias Port = IETF.RFC.`9293`.Port
}

extension Sockets.TCP {

    public typealias SequenceNumber = IETF.RFC.`9293`.SequenceNumber
}

extension Sockets.TCP {

    public typealias State = IETF.RFC.`9293`.`3`.`3`.State
}

extension Sockets.TCP {

    public typealias Header = IETF.RFC.`9293`.`3`.`1`.Header

    public typealias DataOffset = IETF.RFC.`9293`.`3`.`1`.DataOffset

    public typealias Flags = IETF.RFC.`9293`.`3`.`1`.Flags
}

extension Sockets.TCP {

    public typealias Option = IETF.RFC.`9293`.`3`.`2`.Option

    public typealias SACK = IETF.RFC.`9293`.`3`.`2`.SACK
}

extension Sockets.TCP {

    public typealias Segment = IETF.RFC.`9293`.Segment
}

extension Sockets.TCP {

    public typealias TCB = IETF.RFC.`9293`.TCB

    public typealias Send = IETF.RFC.`9293`.`3`.`3`.Send

    public typealias Receive = IETF.RFC.`9293`.`3`.`3`.Receive
}

extension Sockets.TCP {

    public static let protocolNumber = IETF.RFC.`9293`.protocolNumber

    public static let minimumHeaderSize = IETF.RFC.`9293`.minimumHeaderSize

    public static let maximumHeaderSize = IETF.RFC.`9293`.maximumHeaderSize

    public static let defaultMSSIPv4 = IETF.RFC.`9293`.defaultMSSIPv4

    public static let defaultMSSIPv6 = IETF.RFC.`9293`.defaultMSSIPv6
}
