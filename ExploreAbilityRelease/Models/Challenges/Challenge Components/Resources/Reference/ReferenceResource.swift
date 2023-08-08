//
//  ChallengeComponent.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation

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
