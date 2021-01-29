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

/// Options for accessing a blob based on its modification date and/or eTag. If specified, the operation will be
/// performed only if all the specified conditions are met.
public struct ModifiedAccessConditions: Codable, Equatable {
    /// Perform the operation only if the blob has been modified since the specified date.
    public let ifModifiedSince: Rfc1123Date?
    /// Perform the operation only if the blob has not been modified since the specified date.
    public let ifUnmodifiedSince: Rfc1123Date?
    /// Specify an ETag value to operate only on blobs with a matching value.
    public var ifMatch: String?
    /// Specify an ETag value to operate only on blobs without a matching value.
    public let ifNoneMatch: String?
    /// Specify a SQL where clause on blob tags to operate only on blobs with a matching value.
    public let ifTags: String?

    /// Initialize a `ModifiedAccessConditions` structure.
    /// - Parameters:
    ///   - ifModifiedSince: Specify this header value to operate only on a blob if it has been modified since the specified date/time.
    ///   - ifUnmodifiedSince: Specify this header value to operate only on a blob if it has not been modified since the specified date/time.
    ///   - ifMatch: Specify an ETag value to operate only on blobs with a matching value.
    ///   - ifNoneMatch: Specify an ETag value to operate only on blobs without a matching value.
    ///   - ifTags: Specify a SQL where clause on blob tags to operate only on blobs with a matching value.
    public init(
        ifModifiedSince: Rfc1123Date? = nil, ifUnmodifiedSince: Rfc1123Date? = nil, ifMatch: String? = nil,
        ifNoneMatch: String? = nil, ifTags: String? = nil
    ) {
        self.ifModifiedSince = ifModifiedSince
        self.ifUnmodifiedSince = ifUnmodifiedSince
        self.ifMatch = ifMatch
        self.ifNoneMatch = ifNoneMatch
        self.ifTags = ifTags
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case ifModifiedSince = "ifModifiedSince"
        case ifUnmodifiedSince = "ifUnmodifiedSince"
        case ifMatch = "ifMatch"
        case ifNoneMatch = "ifNoneMatch"
        case ifTags = "ifTags"
    }

    /// Initialize a `ModifiedAccessConditions` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ifModifiedSince = try? container.decode(Rfc1123Date.self, forKey: .ifModifiedSince)
        self.ifUnmodifiedSince = try? container.decode(Rfc1123Date.self, forKey: .ifUnmodifiedSince)
        self.ifMatch = try? container.decode(String.self, forKey: .ifMatch)
        self.ifNoneMatch = try? container.decode(String.self, forKey: .ifNoneMatch)
        self.ifTags = try? container.decode(String.self, forKey: .ifTags)
    }

    /// Encode a `ModifiedAccessConditions` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if ifModifiedSince != nil { try? container.encode(ifModifiedSince, forKey: .ifModifiedSince) }
        if ifUnmodifiedSince != nil { try? container.encode(ifUnmodifiedSince, forKey: .ifUnmodifiedSince) }
        if ifMatch != nil { try? container.encode(ifMatch, forKey: .ifMatch) }
        if ifNoneMatch != nil { try? container.encode(ifNoneMatch, forKey: .ifNoneMatch) }
        if ifTags != nil { try? container.encode(ifTags, forKey: .ifTags) }
    }
}
