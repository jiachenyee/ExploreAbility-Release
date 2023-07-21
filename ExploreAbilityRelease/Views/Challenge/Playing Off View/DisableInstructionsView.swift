//
//  DisableInstructionsView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct DisableInstructionsView: View {
    
    var challenge: Challenge
    
    var body: some View {
        if let disableInstructions = challenge.disableInstructions {
            disableInstructions
                .multilineTextAlignment(.center)
        }
    }
}
