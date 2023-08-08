//
//  DeveloperResource.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation

struct DeveloperResource {
    var title: String
    var codeSnippet: String?
    var body: String?
    var url: URL?
    
    var relatedFrameworks: [Framework]
    
    var type: ResourceType
    
    init(title: String,
         codeSnippet: String? = nil, body: String? = nil, url: URL? = nil, relatedFrameworks: [Framework] = [.swiftUI, .uiKit], type: ResourceType) {
        self.title = title
        self.codeSnippet = codeSnippet
        self.body = body
        self.url = url
        self.relatedFrameworks = relatedFrameworks
        self.type = type
    }
    
    init(title: String,
         codeSnippet: String, body: String? = nil, url: URL? = nil, relatedFrameworks: [Framework] = [.swiftUI, .uiKit]) {
        self.title = title
        self.codeSnippet = codeSnippet
        self.body = body
        self.url = url
        self.relatedFrameworks = relatedFrameworks
        self.type = .codeSnippet
    }
    
    init(title: String,
         body: String? = nil, relatedFrameworks: [Framework] = [.swiftUI, .uiKit]) {
        self.title = title
        self.body = body
        self.relatedFrameworks = relatedFrameworks
        self.type = .title
    }
    
    static func header(_ title: String,
                       body: String? = nil,
                       relatedFrameworks: [Framework] = [.swiftUI, .uiKit]) -> DeveloperResource {
        DeveloperResource(title: title, codeSnippet: nil, body: body, url: nil, relatedFrameworks: relatedFrameworks, type: .title)
    }
    
    static func article(_ title: String,
                        body: String? = nil,
                        url: URL? = nil,
                        relatedFrameworks: [Framework] = [.swiftUI, .uiKit]) -> DeveloperResource {
        DeveloperResource(title: title, codeSnippet: nil, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .documentationArticle)
    }
    
    static func code(_ title: String,
                     snippet: String,
                     body: String? = nil,
                     url: URL? = nil,
                     relatedFrameworks: [Framework] = [.swiftUI, .uiKit]) -> DeveloperResource {
        DeveloperResource(title: title, codeSnippet: snippet, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .codeSnippet)
    }
    
    static func video(_ title: String,
                      body: String? = nil,
                      url: URL? = nil,
                      relatedFrameworks: [Framework] = [.swiftUI, .uiKit]) -> DeveloperResource {
        DeveloperResource(title: title, codeSnippet: nil, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .video)
    }
    
    static func hig(_ title: String,
                    body: String? = nil,
                    url: URL? = nil,
                    relatedFrameworks: [Framework] = [.swiftUI, .uiKit]) -> DeveloperResource {
        DeveloperResource(title: title, codeSnippet: nil, body: body, url: url, relatedFrameworks: relatedFrameworks, type: .hig)
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
        case swiftUI
        case uiKit
    }
}
