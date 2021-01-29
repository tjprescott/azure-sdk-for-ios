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
public struct BlobHTTPHeaders: Codable {
    // MARK: Properties

    /// Optional. Sets the blob's cache control. If specified, this property is stored with the blob and returned with a read request.
    public let blobCacheControl: String?
    /// Optional. Sets the blob's content type. If specified, this property is stored with the blob and returned with a read request.
    public let blobContentType: String?
    /// Optional. An MD5 hash of the blob content. Note that this hash is not validated, as the hashes for the individual blocks were validated when each was uploaded.
    public let blobContentMD5: Data?
    /// Optional. Sets the blob's content encoding. If specified, this property is stored with the blob and returned with a read request.
    public let blobContentEncoding: String?
    /// Optional. Set the blob's content language. If specified, this property is stored with the blob and returned with a read request.
    public let blobContentLanguage: String?
    /// Optional. Sets the blob's Content-Disposition header.
    public let blobContentDisposition: String?

    // MARK: Initializers

    /// Initialize a `BlobHttpHeaders` structure.
    /// - Parameters:
    ///   - blobCacheControl: Optional. Sets the blob's cache control. If specified, this property is stored with the blob and returned with a read request.
    ///   - blobContentType: Optional. Sets the blob's content type. If specified, this property is stored with the blob and returned with a read request.
    ///   - blobContentMD5: Optional. An MD5 hash of the blob content. Note that this hash is not validated, as the hashes for the individual blocks were validated when each was uploaded.
    ///   - blobContentEncoding: Optional. Sets the blob's content encoding. If specified, this property is stored with the blob and returned with a read request.
    ///   - blobContentLanguage: Optional. Set the blob's content language. If specified, this property is stored with the blob and returned with a read request.
    ///   - blobContentDisposition: Optional. Sets the blob's Content-Disposition header.
    public init(
        blobCacheControl: String? = nil, blobContentType: String? = nil, blobContentMD5: Data? = nil,
        blobContentEncoding: String? = nil, blobContentLanguage: String? = nil,
        blobContentDisposition: String? = nil
    ) {
        self.blobCacheControl = blobCacheControl
        self.blobContentType = blobContentType
        self.blobContentMD5 = blobContentMD5
        self.blobContentEncoding = blobContentEncoding
        self.blobContentLanguage = blobContentLanguage
        self.blobContentDisposition = blobContentDisposition
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case blobCacheControl = "blobCacheControl"
        case blobContentType = "blobContentType"
        case blobContentMD5 = "blobContentMD5"
        case blobContentEncoding = "blobContentEncoding"
        case blobContentLanguage = "blobContentLanguage"
        case blobContentDisposition = "blobContentDisposition"
    }

    /// Initialize a `BlobHttpHeaders` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blobCacheControl = try? container.decode(String.self, forKey: .blobCacheControl)
        self.blobContentType = try? container.decode(String.self, forKey: .blobContentType)
        self.blobContentMD5 = try? container.decode(Data.self, forKey: .blobContentMD5)
        self.blobContentEncoding = try? container.decode(String.self, forKey: .blobContentEncoding)
        self.blobContentLanguage = try? container.decode(String.self, forKey: .blobContentLanguage)
        self.blobContentDisposition = try? container.decode(String.self, forKey: .blobContentDisposition)
    }

    /// Encode a `BlobHttpHeaders` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if blobCacheControl != nil { try? container.encode(blobCacheControl, forKey: .blobCacheControl) }
        if blobContentType != nil { try? container.encode(blobContentType, forKey: .blobContentType) }
        if blobContentMD5 != nil { try? container.encode(blobContentMD5, forKey: .blobContentMD5) }
        if blobContentEncoding != nil { try? container.encode(blobContentEncoding, forKey: .blobContentEncoding) }
        if blobContentLanguage != nil { try? container.encode(blobContentLanguage, forKey: .blobContentLanguage) }
        if blobContentDisposition !=
            nil { try? container.encode(blobContentDisposition, forKey: .blobContentDisposition) }
    }
}
