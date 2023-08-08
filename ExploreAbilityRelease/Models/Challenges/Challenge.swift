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
    
    var warning: Warning? {
        components.first { component in
            component is Warning
        } as? Warning
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
    
    var developerResources: [DeveloperResource] {
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
