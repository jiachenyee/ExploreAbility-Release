//
//  DeveloperResources.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation

struct DeveloperResources: ChallengeComponent {
    var resources: [DeveloperResource]
    
    init(_ resources: [DeveloperResource]) {
        self.resources = resources
    }
}
