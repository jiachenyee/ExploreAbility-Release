//
//  MenuButtons.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct MenuButtons: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isLabelShown = false
    
    @Binding var isFannedOut: Bool
    
    var color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 16) {
                MenuHomeButton(isLabelShown: $isLabelShown,
                               color: color) {
                    withAnimation {
                        isFannedOut = false
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                        withAnimation {
                            viewModel.gameState = .home
                        }
                    }
                }
                
                MenuHintButton(isLabelShown: $isLabelShown,
                               color: color) {
                    
                }
            }
            
            MenuDismissButton(isLabelShown: $isLabelShown,
                              color: color) {
                withAnimation {
                    isFannedOut = false
                    challengeViewModel.state = .playing
                }
            }
        }
        .onAppear {
            withAnimation(.spring(dampingFraction: 0.5).delay(0.3)) {
                isLabelShown = true
            }
            
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}
