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

public import RFC_791

extension Sockets {
  /// Internet Protocol (IP)
  ///
  /// Provides addressing and routing for socket communication.
  ///
  /// ## Versions
  ///
  /// - ``V4``: IPv4 per RFC 791
  public enum IP {}
}

// MARK: - IPv4

extension Sockets.IP {
  /// IPv4 per RFC 791
  public typealias V4 = RFC_791.IPv4
}
