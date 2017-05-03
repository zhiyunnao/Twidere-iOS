// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import PMJackson

extension PersistableStatus.Extras: JsonMappable {

}

internal class PersistableStatusExtrasJsonMapper: JsonMapper<PersistableStatus.Extras> {

    internal static let singleton = PersistableStatusExtrasJsonMapper()

    override func parse(_ parser: PMJacksonParser) -> PersistableStatus.Extras! {
        let instance = PersistableStatus.Extras()
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

    override func parseField(_ instance: PersistableStatus.Extras, _ fieldName: String, _ parser: PMJacksonParser) {
        switch fieldName {
        case "external_url":
            instance.external_url = parser.getValueAsString()
        case "quoted_external_url":
            instance.quoted_external_url = parser.getValueAsString()
        case "retweeted_external_url":
            instance.retweeted_external_url = parser.getValueAsString()
        case "statusnet_conversation_id":
            instance.statusnet_conversation_id = parser.getValueAsString()
        case "support_entities":
            instance.support_entities = parser.getValueAsBool()
        case "user_profile_image_url_fallback":
            instance.user_profile_image_url_fallback = parser.getValueAsString()
        case "user_statusnet_profile_url":
            instance.user_statusnet_profile_url = parser.getValueAsString()
        case "display_text_range":
            if (parser.currentEvent == .arrayStart) {
                var array: [Int32] = []
                while (parser.nextEvent() != .arrayEnd) {
                    array.append(parser.getValueAsInt32())
                }
                instance.display_text_range = array
            } else {
                instance.display_text_range = nil
            }
        case "quoted_display_text_range":
            if (parser.currentEvent == .arrayStart) {
                var array: [Int32] = []
                while (parser.nextEvent() != .arrayEnd) {
                    array.append(parser.getValueAsInt32())
                }
                instance.quoted_display_text_range = array
            } else {
                instance.quoted_display_text_range = nil
            }
        case "conversation_id":
            instance.conversation_id = parser.getValueAsString()
        case "summary_text":
            instance.summary_text = parser.getValueAsString()
        case "visibility":
            instance.visibility = parser.getValueAsString()
        default:
            break
        }
    }
}
