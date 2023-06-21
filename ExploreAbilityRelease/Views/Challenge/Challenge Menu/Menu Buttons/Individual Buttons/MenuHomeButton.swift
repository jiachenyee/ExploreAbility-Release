//
//  MenuHomeButton.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct MenuHomeButton: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @Binding var isLabelShown: Bool
    
    var color: Color
    
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } label: {
            Circle()
                .fill(color)
                .frame(width: 48, height: 48)
                .overlay {
                    VStack(spacing: -8) {
                        HStack(spacing: -4) {
                            Image(systemName: "hexagon")
                                .foregroundStyle(.black)
                            Image(systemName: "hexagon")
                                .foregroundStyle(.black)
                        }
                        .opacity(0.3)
                        
                        Image(systemName: "hexagon.fill")
                            .foregroundStyle(.black)
                        
                        HStack(spacing: -4) {
                            Image(systemName: "hexagon")
                                .foregroundStyle(.black)
                            Image(systemName: "hexagon")
                                .foregroundStyle(.black)
                        }
                        .opacity(0.3)
                    }
                    .font(.system(size: 24))
                }
                .overlay {
                    if isLabelShown {
                        ArcText(angle: .pi - 0.8, text: "HOME", fontSize: 12)
                            .padding(-21)
                            .transition(
                                .modifier(active: _RotationEffect(angle: .degrees(40)),
                                          identity: _RotationEffect(angle: .degrees(0))).combined(with: .opacity))
                    }
                }
        }
        .matchedGeometryEffect(id: "home.button", in: viewModel.sharedNamespace)
    }
}
