//
//  MenuDismissButton.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct MenuDismissButton: View {
    
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
                .fill(color.opacity(0.2))
                .frame(width: 48, height: 48)
                .overlay {
                    Image(systemName: "xmark")
                        .foregroundStyle(color)
                }
        }
        .matchedGeometryEffect(id: "close.button", in: viewModel.sharedNamespace)
        .accessibilityLabel("Dismiss")
    }
}
