//
//  Challenge.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI
import UtilMacros

struct Challenge: Equatable {
    var accessibilityFeature: String
    
    var hint: String
    var postChallengeMessage: String
    
    var image: Image
    var color: Color
    
    var category: ChallengeCategory?
    var warning: PreChallengeWarning?
    
    var requirements: ChallengeRequirement?
    
    var disableInstructions: Text?
    
    var resources: [ReferenceResource] = []
    
    var developerResources: [DeveloperReference] = []
    
    var gitHubURL: URL?
    
    static func == (lhs: Challenge, rhs: Challenge) -> Bool {
        lhs.accessibilityFeature == rhs.accessibilityFeature
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
