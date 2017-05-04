// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import PMJackson

extension UserMentionEntity: JsonMappable {

}

internal class UserMentionEntityJsonMapper: JsonMapper<UserMentionEntity> {

    internal static let singleton = UserMentionEntityJsonMapper()

    override func parse(_ parser: JsonParser) -> UserMentionEntity! {
        let instance = UserMentionEntity()
        if (parser.currentEvent == nil) {
            parser.nextEvent()
        }

        if (parser.currentEvent != .objectStart) {
            parser.skipChildren()
            return nil
        }

        while (parser.nextEvent() != .objectEnd) {
            let fieldName = parser.currentName!
            parser.nextEvent()
            parseField(instance, fieldName, parser)
            parser.skipChildren()
        }
        return instance
    }

    override func parseField(_ instance: UserMentionEntity, _ fieldName: String, _ parser: JsonParser) {
        switch fieldName {
        case "indices":
            if (parser.currentEvent == .arrayStart) {
                var array: [Int32] = []
                while (parser.nextEvent() != .arrayEnd) {
                    array.append(parser.getValueAsInt32())
                }
                instance.indices = array
            } else {
                instance.indices = nil
            }
        default:
            break
        }
    }
}
