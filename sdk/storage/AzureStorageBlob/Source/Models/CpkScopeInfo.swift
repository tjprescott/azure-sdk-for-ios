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
public struct CpkScopeInfo: Codable {
    // MARK: Properties

    /// Optional. Version 2019-07-07 and later.  Specifies the name of the encryption scope to use to encrypt the data provided in the request. If not specified, encryption is performed with the default account encryption scope.  For more information, see Encryption at Rest for Azure Storage Services.
    public let encryptionScope: String?

    // MARK: Initializers

    /// Initialize a `CpkScopeInfo` structure.
    /// - Parameters:
    ///   - encryptionScope: Optional. Version 2019-07-07 and later.  Specifies the name of the encryption scope to use to encrypt the data provided in the request. If not specified, encryption is performed with the default account encryption scope.  For more information, see Encryption at Rest for Azure Storage Services.
    public init(
        encryptionScope: String? = nil
    ) {
        self.encryptionScope = encryptionScope
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case encryptionScope = "encryptionScope"
    }

    /// Initialize a `CpkScopeInfo` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.encryptionScope = try? container.decode(String.self, forKey: .encryptionScope)
    }

    /// Encode a `CpkScopeInfo` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if encryptionScope != nil { try? container.encode(encryptionScope, forKey: .encryptionScope) }
    }
}
