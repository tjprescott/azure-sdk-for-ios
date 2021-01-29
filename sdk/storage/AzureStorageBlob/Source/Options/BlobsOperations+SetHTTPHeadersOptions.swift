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

extension BlobsOperations {
    /// User-configurable options for the `AzureBlobStorage.SetHttpHeaders` operation.
    public struct SetHTTPHeadersOptions: RequestOptions {
        /// The timeout parameter is expressed in seconds. For more information, see <a href="https://docs.microsoft.com/en-us/rest/api/storageservices/fileservices/setting-timeouts-for-blob-service-operations">Setting Timeouts for Blob Service Operations.</a>
        public let timeout: Int32?
        /// Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled.
        public let requestId: String?
        /// Parameter group
        public let leaseAccessConditions: LeaseAccessConditions?
        /// Parameter group
        public let modifiedAccessConditions: ModifiedAccessConditions?

        /// A client-generated, opaque value with 1KB character limit that is recorded in analytics logs.
        /// Highly recommended for correlating client-side activites with requests received by the server.
        public let clientRequestId: String?

        /// A token used to make a best-effort attempt at canceling a request.
        public let cancellationToken: CancellationToken?

        /// A dispatch queue on which to call the completion handler. Defaults to `DispatchQueue.main`.
        public var dispatchQueue: DispatchQueue?

        /// A `PipelineContext` object to associate with the request.
        public var context: PipelineContext?

        /// Initialize a `SetHttpHeadersOptions` structure.
        /// - Parameters:
        ///   - timeout: The timeout parameter is expressed in seconds. For more information, see <a href="https://docs.microsoft.com/en-us/rest/api/storageservices/fileservices/setting-timeouts-for-blob-service-operations">Setting Timeouts for Blob Service Operations.</a>
        ///   - requestId: Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled.
        ///   - blobHttpHeaders: Parameter group
        ///   - leaseAccessConditions: Parameter group
        ///   - modifiedAccessConditions: Parameter group
        ///   - clientRequestId: A client-generated, opaque value with 1KB character limit that is recorded in analytics logs.
        ///   - cancellationToken: A token used to make a best-effort attempt at canceling a request.
        ///   - dispatchQueue: A dispatch queue on which to call the completion handler. Defaults to `DispatchQueue.main`.
        ///   - context: A `PipelineContext` object to associate with the request.
        public init(
            timeout: Int32? = nil,
            requestId: String? = nil,
            leaseAccessConditions: LeaseAccessConditions? = nil,
            modifiedAccessConditions: ModifiedAccessConditions? = nil,
            clientRequestId: String? = nil,
            cancellationToken: CancellationToken? = nil,
            dispatchQueue: DispatchQueue? = nil,
            context: PipelineContext? = nil
        ) {
            self.timeout = timeout
            self.requestId = requestId
            self.leaseAccessConditions = leaseAccessConditions
            self.modifiedAccessConditions = modifiedAccessConditions
            self.clientRequestId = clientRequestId
            self.cancellationToken = cancellationToken
            self.dispatchQueue = dispatchQueue
            self.context = context
        }
    }
}
