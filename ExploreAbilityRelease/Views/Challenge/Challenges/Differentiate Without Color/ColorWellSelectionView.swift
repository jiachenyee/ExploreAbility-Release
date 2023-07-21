//
//  ColorWellSelectionView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import SwiftUI

struct ColorWellSelectionView: View {
    
    var color: Color
    
    @Binding var selectedColor: Color
    
    var body: some View {
        Button {
            selectedColor = color
        } label: {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 48, height: 48)
                if selectedColor == color {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}
