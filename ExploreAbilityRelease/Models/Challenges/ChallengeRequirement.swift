//
//  ChallengeRequirement.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import UIKit

struct ChallengeRequirement {
    var major: Int?
    var minor: Int?
    
    static let iOS17 = ChallengeRequirement(major: 17)
    
    func evaluateRequirement() -> Bool {
        var result = true
        
        if let major {
            result = result && performVersionCheck(major: major, minor: minor)
        }
        
        return result
    }
    
    func performVersionCheck(major: Int, minor: Int?) -> Bool {
        let versionSegments = UIDevice.current.systemVersion.split(separator: ".").compactMap {
            Int($0)
        }
        
        guard versionSegments.count > 0 else { return false }
        
        let deviceMajor = versionSegments[0]
        let deviceMinor = if versionSegments.count >= 2 { versionSegments[1] } else { 0 }
        
        return deviceMajor > major || (deviceMajor == major && deviceMinor >= (minor ?? 0))
    }
}
