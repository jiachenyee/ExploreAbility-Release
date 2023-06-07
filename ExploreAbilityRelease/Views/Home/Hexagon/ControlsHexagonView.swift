//
//  ControlsHexagonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct ControlsHexagonView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                VStack(spacing: 21) {
                    HomeViewActionButton(systemName: "mug.fill", color: .yellow) {
                        withAnimation(.bouncy) {
                            viewModel.gameState = .store
                        }
                    }
                    .matchedGeometryEffect(id: "cafe.icon", in: viewModel.sharedNamespace)
                    
                    HomeViewActionButton(systemName: "heart.fill", color: .yellow.opacity(0.9)) {
                        
                    }
                }
                
                VStack(spacing: 21) {
                    HomeViewActionButton("gamecenter", color: .yellow.opacity(0.5)) {
                        
                    }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.1))
                        .overlay {
                            Image(systemName: "house")
                                .font(.system(size: 25))
                                .foregroundStyle(.yellow)
                        }
                    
                    HomeViewActionButton(systemName: "square.and.arrow.up", color: .yellow.opacity(0.8)) {
                        
                    }
                }
                VStack(spacing: 21) {
                    HomeViewActionButton(systemName: "hand.raised.app.fill", color: .yellow.opacity(0.6)) {
                        
                    }
                    
                    HomeViewActionButton(systemName: "gear", color: .yellow.opacity(0.7)) {
                        
                    }
                }
            }
            .imageScale(.large)
            
            .padding(32)
            .overlay {
                LinearGradient(colors: [.yellow, .yellow.opacity(0.5)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask {
                    Image("hex")
                        .resizable()
                        .scaledToFit()
                }
                .allowsHitTesting(false)
            }
            .padding(-32)
        }
    }
}
