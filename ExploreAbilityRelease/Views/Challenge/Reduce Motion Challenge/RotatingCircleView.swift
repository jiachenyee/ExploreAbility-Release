//
//  RotatingCircleView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/6/23.
//

import SwiftUI

struct RotatingCircleView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var challengeViewModel: ChallengeViewModel
    
    @State private var rotationAngle = Angle.zero
    
    @Environment(\.accessibilityReduceMotion) var reduceMotionEnabled
    
    @State private var showArrow = false
    
    var id: String
    var distance: Double
    var rpm: Double
    
    var body: some View {
        Circle()
            .fill(challengeViewModel.challenge.color)
            .frame(width: 32, height: 32)
            .overlay {
                if showArrow {
                    if .random() {
                        Image(systemName: "arrow.right")
                            .padding(.leading, 32)
                    } else {
                        Image(systemName: "arrow.left")
                            .padding(.trailing, 32)
                    }
                }
            }
            .frame(width: distance, height: distance, alignment: .top)
            .rotationEffect(rotationAngle)
            .opacity(0.8)
            .matchedGeometryEffect(id: id, in: viewModel.sharedNamespace)
            .onAppear {
                if !reduceMotionEnabled {
                    withAnimation(.linear(duration: rpm).repeatForever(autoreverses: false)) {
                        rotationAngle = Bool.random() ? .degrees(360) : .degrees(-360)
                    }
                } else {
                    withAnimation {
                        showArrow.toggle()
                    }
                }
            }
    }
}
