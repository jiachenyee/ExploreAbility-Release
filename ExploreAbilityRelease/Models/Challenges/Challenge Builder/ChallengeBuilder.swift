//
//  ChallengeComponent.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation

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
