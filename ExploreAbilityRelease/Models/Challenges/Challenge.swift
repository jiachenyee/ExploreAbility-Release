//
//  Challenge.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI
import UtilMacros

//struct Challenge: Equatable {
//    var feature: String
//    
//    var hint: String
//    var postChallengeMessage: String
//    
//    var image: Image
//    var color: Color
//    
//    var category: ChallengeCategory?
//    var warning: PreChallengeWarning?
//    
//    var requirements: ChallengeRequirement?
//    
//    var disableInstructions: Text?
//    
//    var resources: [ReferenceResource] = []
//    
//    var developerResources: [DeveloperReference] = []
//    
//    var gitHubURL: URL?
//    
//    static func == (lhs: Challenge, rhs: Challenge) -> Bool {
//        lhs.feature == rhs.feature
//    }
//}

struct Challenge: Equatable {
    var feature: String
    var category: ChallengeCategory
    
    var components: [ChallengeComponent]
    
    init(feature: String,
         category: ChallengeCategory,
         @ChallengeBuilder components: (() -> [ChallengeComponent])) {
        self.feature = feature
        self.category = category
        self.components = components()
    }
    
    static func == (lhs: Challenge, rhs: Challenge) -> Bool {
        lhs.feature == rhs.feature
    }
}

extension Challenge {
    var hint: String? {
        let hint = components.first { component in
            component is Hint
        }
        
        return (hint as? Hint)?.text
    }
    
    var postChallengeMessage: String? {
        let conclusion = components.first { component in
            component is Conclusion
        }
        
        return (conclusion as? Conclusion)?.text
    }
    
    var image: Image {
        let metadata = components.first { component in
            component is Metadata
        }
        
        return (metadata as? Metadata)!.image
    }
    
    var color: Color {
        let metadata = components.first { component in
            component is Metadata
        }
        
        return (metadata as? Metadata)!.color
    }
    
    var warning: PreChallengeWarning? {
        components.first { component in
            component is PreChallengeWarning
        } as? PreChallengeWarning
    }
    
    var requirements: ChallengeRequirement? {
        components.first { component in
            component is ChallengeRequirement
        } as? ChallengeRequirement
    }
    
    var disableInstructions: Text? {
        let instructions = components.first { component in
            component is DisableInstructions
        }
        
        return (instructions as? DisableInstructions)?.text
    }
    
    var resources: [ReferenceResource] {
        let resources = components.first { component in
            component is ReferenceResources
        }
        
        return (resources as? ReferenceResources)?.resources ?? []
    }
    
    var developerResources: [DeveloperReference] {
        let resources = components.first { component in
            component is DeveloperResources
        }
        
        return (resources as? DeveloperResources)?.resources ?? []
    }
    
    var gitHubURL: URL? {
        let gitHub = components.first { component in
            component is GitHub
        }
        
        return (gitHub as? GitHub)?.url
    }
}

struct Metadata: ChallengeComponent {
    var image: Image
    var color: Color
}

struct DisableInstructions: ChallengeComponent {
    var text: Text
    
    init(_ text: Text) {
        self.text = text
    }
}

struct GitHub: ChallengeComponent {
    var url: URL
    
    init(_ url: URL) {
        self.url = url
    }
}

struct Hint: ChallengeComponent {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
}

struct Conclusion: ChallengeComponent {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
}

public protocol ChallengeComponent {}

struct ChallengeComponentGroup: ChallengeComponent {
    public var components: [any ChallengeComponent]
}

@resultBuilder
public enum ChallengeBuilder {
    public static func buildBlock(_ component: ChallengeComponent...) -> [ChallengeComponent] {
        component
    }
    
    public static func buildArray(_ components: [[ChallengeComponent]]) -> ChallengeComponent {
        return ChallengeComponentGroup(components: components.flatMap { $0 })
    }
    
    public static func buildOptional(_ component: [ChallengeComponent]?) -> ChallengeComponent {
        return ChallengeComponentGroup(components: component ?? [])
    }
    
    public static func buildEither(first component: [ChallengeComponent]) -> ChallengeComponent {
        return ChallengeComponentGroup(components: component)
    }
    
    public static func buildEither(second component: [ChallengeComponent]) -> ChallengeComponent {
        return ChallengeComponentGroup(components: component)
    }
}

struct ReferenceResources: ChallengeComponent {
    var resources: [ReferenceResource]
    
    init(_ resources: [ReferenceResource]) {
        self.resources = resources
    }
}

struct DeveloperResources: ChallengeComponent {
    var resources: [DeveloperReference]
    
    init(_ resources: [DeveloperReference]) {
        self.resources = resources
    }
}


struct ReferenceResource {
    var title: String
    var url: URL
    
    var type: ResourceType = .web
    
    enum ResourceType {
        case web
        case video
        
        var description: String {
            switch self {
            case .web: "Apple Support article"
            case .video: "Apple Support on YouTube"
            }
        }
    }
    
    static func web(_ title: String, url: URL) -> ReferenceResource {
        ReferenceResource(title: title, url: url, type: .web)
    }
    
    static func video(_ title: String, url: URL) -> ReferenceResource {
        ReferenceResource(title: title, url: url, type: .video)
    }
}

struct DeveloperReference {
    var title: String
    var codeSnippet: String?
    var body: String?
    var url: URL?
    
    var relatedFrameworks: [Framework]
    
    var type: ResourceType
    
    init(title: String,
         codeSnippet: String? = nil, body: String? = nil, url: URL? = nil, relatedFrameworks: [Framework] = [.swiftUi, .uiKit], type: ResourceType) {
        self.title = title
        self.codeSnippet = codeSnippet
        self.body = body
        self.url = url
        self.relatedFrameworks = relatedFrameworks
        self.type = type
    }
    
    init(title: String,
         codeSnippet: String, body: String? = nil, url: URL? = nil, relatedFrameworks: [Framework] = [.swiftUi, .uiKit]) {
        self.title = title
        self.codeSnippet = codeSnippet
        self.body = body
        self.url = url
        self.relatedFrameworks = relatedFrameworks
        self.type = .codeSnippet
    }
    
    init(title: String,
         body: String? = nil, relatedFrameworks: [Framework] = [.swiftUi, .uiKit]) {
        self.title = title
        self.body = body
        self.relatedFrameworks = relatedFrameworks
        self.type = .title
    }
    
    static func header(_ title: String,
                       body: String? = nil,
                       relatedFrameworks: [Framework] = [.swiftUi, .uiKit]) -> DeveloperReference {
        DeveloperReference(title: title, codeSnippet: nil, body: body, url: nil, relatedFrameworks: relatedFrameworks, type: .title)
    }
    
    static func article(_ title: String,
                        body: String? = nil,
                        url: URL? = nil,
                        relatedFrameworks: [Framework] = [.swiftUi, .uiKit]) -> DeveloperReference {
        DeveloperReference(title: title, codeSnippet: nil, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .documentationArticle)
    }
    
    static func code(_ title: String,
                     snippet: String,
                     body: String? = nil,
                     url: URL? = nil,
                     relatedFrameworks: [Framework] = [.swiftUi, .uiKit]) -> DeveloperReference {
        DeveloperReference(title: title, codeSnippet: snippet, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .codeSnippet)
    }
    
    static func video(_ title: String,
                      body: String? = nil,
                      url: URL? = nil,
                      relatedFrameworks: [Framework] = [.swiftUi, .uiKit]) -> DeveloperReference {
        DeveloperReference(title: title, codeSnippet: nil, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .video)
    }
    
    static func hig(_ title: String,
                    body: String? = nil,
                    url: URL? = nil,
                    relatedFrameworks: [Framework] = [.swiftUi, .uiKit]) -> DeveloperReference {
        DeveloperReference(title: title, codeSnippet: nil, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .hig)
    }
    
    enum ResourceType {
        case documentationArticle
        case codeSnippet
        case video
        case hig
        
        case title
        
        var description: String {
            switch self {
            case .hig: "Human Interface Guidelines"
            case .documentationArticle: "Apple Developer Documentation article"
            case .codeSnippet: "Code Snippet"
            case .video: "Apple Developer Video"
            case .title: ""
            }
        }
    }
    
    enum Framework: Hashable {
        case swiftUi
        case uiKit
    }
}
