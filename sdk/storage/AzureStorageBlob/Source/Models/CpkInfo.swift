// --------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the ""Software""), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
// --------------------------------------------------------------------------

import AzureCore
import Foundation
// swiftlint:disable superfluous_disable_command
// swiftlint:disable identifier_name
// swiftlint:disable line_length
// swiftlint:disable cyclomatic_complexity

/// Parameter group
public struct CpkInfo: Codable {
    // MARK: Properties

    /// Optional. Specifies the encryption key to use to encrypt the data provided in the request. If not specified, encryption is performed with the root account encryption key.  For more information, see Encryption at Rest for Azure Storage Services.
    public let encryptionKey: String?
    /// The SHA-256 hash of the provided encryption key. Must be provided if the x-ms-encryption-key header is provided.
    public let encryptionKeySha256: String?

    // MARK: Initializers

    /// Initialize a `CpkInfo` structure.
    /// - Parameters:
    ///   - encryptionKey: Optional. Specifies the encryption key to use to encrypt the data provided in the request. If not specified, encryption is performed with the root account encryption key.  For more information, see Encryption at Rest for Azure Storage Services.
    ///   - encryptionKeySha256: The SHA-256 hash of the provided encryption key. Must be provided if the x-ms-encryption-key header is provided.
    public init(
        encryptionKey: String? = nil, encryptionKeySha256: String? = nil
    ) {
        self.encryptionKey = encryptionKey
        self.encryptionKeySha256 = encryptionKeySha256
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case encryptionKey = "encryptionKey"
        case encryptionKeySha256 = "encryptionKeySha256"
    }

    /// Initialize a `CpkInfo` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.encryptionKey = try? container.decode(String.self, forKey: .encryptionKey)
        self.encryptionKeySha256 = try? container.decode(String.self, forKey: .encryptionKeySha256)
    }

    /// Encode a `CpkInfo` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if encryptionKey != nil { try? container.encode(encryptionKey, forKey: .encryptionKey) }
        if encryptionKeySha256 != nil { try? container.encode(encryptionKeySha256, forKey: .encryptionKeySha256) }
    }
}
