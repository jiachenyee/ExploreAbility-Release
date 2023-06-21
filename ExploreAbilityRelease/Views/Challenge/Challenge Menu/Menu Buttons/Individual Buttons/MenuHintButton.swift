//
//  MenuHintButton.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct MenuHintButton: View {
    
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
                    Image(systemName: "questionmark")
                        .foregroundStyle(.black)
                }
                .overlay {
                    if isLabelShown {
                        ArcText(angle: 0.8, text: "HINT", fontSize: 12)
                            .padding(-21)
                            .transition(
                                .modifier(active: _RotationEffect(angle: .degrees(-40)),
                                          identity: _RotationEffect(angle: .degrees(0))).combined(with: .opacity))
                    }
                }
        }
        .matchedGeometryEffect(id: "help.button", in: viewModel.sharedNamespace)
    }
}
