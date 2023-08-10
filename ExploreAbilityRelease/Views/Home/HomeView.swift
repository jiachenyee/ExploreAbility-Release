//
//  HomeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            ZoomableScrollView {
                ZStack {
                    Color.black
                    
                    VStack(spacing: 21) {
                        HStack(spacing: 64) {
                            HexagonView(challengeCategory: .vision)
                            HexagonView(challengeCategory: .hearing)
                        }
                        ControlsHexagonView()
                        HStack(spacing: 64) {
                            HexagonView(challengeCategory: .mobility)
                            HexagonView(challengeCategory: .cognitive)
                        }
                    }
                }
                .foregroundStyle(.white)
            }
            .ignoresSafeArea()
            
            HotChocolateIndicatorView()
        }
    }
}
