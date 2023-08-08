//
//  MenuClosed.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct MenuClosed: View {
    
    var namespace: Namespace.ID
    
    var challenge: Challenge
    
    var body: some View {
        ZStack {
            Circle()
                .fill(challenge.color)
                .frame(width: 48, height: 48)
                .matchedGeometryEffect(id: "home.button", in: namespace)
            Circle()
                .fill(challenge.color)
                .frame(width: 48, height: 48)
                .matchedGeometryEffect(id: "help.button", in: namespace)
            Circle()
                .fill(challenge.color)
                .frame(width: 48, height: 48)
                .matchedGeometryEffect(id: "close.button", in: namespace)
        }
        .matchedGeometryEffect(id: challenge.feature, in: namespace)
    }
}
