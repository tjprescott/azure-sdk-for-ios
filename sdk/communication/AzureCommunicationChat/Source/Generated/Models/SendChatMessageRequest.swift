// --------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// --------------------------------------------------------------------------

import AzureCore
import Foundation
// swiftlint:disable superfluous_disable_command
// swiftlint:disable identifier_name
// swiftlint:disable line_length
// swiftlint:disable cyclomatic_complexity

/// Details of the message to send.
public struct SendChatMessageRequest: Codable {
    // MARK: Properties

    /// Chat message content.
    public let content: String
    /// The display name of the chat message sender. This property is used to populate sender name for push notifications.
    public let senderDisplayName: String?
    /// The chat message type.
    public let type: ChatMessageType?

    // MARK: Initializers

    /// Initialize a `SendChatMessageRequest` structure.
    /// - Parameters:
    ///   - content: Chat message content.
    ///   - senderDisplayName: The display name of the chat message sender. This property is used to populate sender name for push notifications.
    ///   - type: The chat message type.
    public init(
        content: String, senderDisplayName: String? = nil, type: ChatMessageType? = nil
    ) {
        self.content = content
        self.senderDisplayName = senderDisplayName
        self.type = type
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case content = "content"
        case senderDisplayName = "senderDisplayName"
        case type = "type"
    }

    /// Initialize a `SendChatMessageRequest` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.senderDisplayName = try? container.decode(String.self, forKey: .senderDisplayName)
        self.type = try? container.decode(ChatMessageType.self, forKey: .type)
    }

    /// Encode a `SendChatMessageRequest` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(content, forKey: .content)
        if senderDisplayName != nil { try? container.encode(senderDisplayName, forKey: .senderDisplayName) }
        if type != nil { try? container.encode(type, forKey: .type) }
    }
}