public import RFC_9293

extension Sockets {

    public enum TCP {}
}

extension Sockets.TCP {

    public typealias Port = RFC_9293.Port
}

extension Sockets.TCP {

    public typealias SequenceNumber = RFC_9293.SequenceNumber
}

extension Sockets.TCP {

    public typealias State = RFC_9293.`3`.`3`.State
}

extension Sockets.TCP {

    public typealias Header = RFC_9293.`3`.`1`.Header

    public typealias DataOffset = RFC_9293.`3`.`1`.DataOffset

    public typealias Flags = RFC_9293.`3`.`1`.Flags
}

extension Sockets.TCP {

    public typealias Option = RFC_9293.`3`.`2`.Option

    public typealias SACK = RFC_9293.`3`.`2`.SACK
}

extension Sockets.TCP {

    public typealias Segment = RFC_9293.Segment
}

extension Sockets.TCP {

    public typealias TCB = RFC_9293.TCB

    public typealias Send = RFC_9293.`3`.`3`.Send

    public typealias Receive = RFC_9293.`3`.`3`.Receive
}

extension Sockets.TCP {

    public static let protocolNumber = RFC_9293.protocolNumber

    public static let minimumHeaderSize = RFC_9293.minimumHeaderSize

    public static let maximumHeaderSize = RFC_9293.maximumHeaderSize

    public static let defaultMSSIPv4 = RFC_9293.defaultMSSIPv4

    public static let defaultMSSIPv6 = RFC_9293.defaultMSSIPv6
}
