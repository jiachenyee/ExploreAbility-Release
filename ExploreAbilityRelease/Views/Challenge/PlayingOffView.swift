//
//  PlayingOffView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 14/6/23.
//

import Foundation
import SwiftUI

struct PlayingOffView: View {
    
    var initialState: Bool
    
    @Binding var didSucceed: Bool
    
    @EnvironmentObject private var challengeViewModel: ChallengeViewModel
    @EnvironmentObject private var viewModel: ViewModel
    
    @State private var width = 48.0
    @State private var alignment = Alignment.trailing
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                Text("Turn \(challengeViewModel.challenge.accessibilityFeature) back ")
                Text("\(initialState ? "On" : "Off")")
                    .fontWeight(.bold)
                    .foregroundStyle(challengeViewModel.challenge.color)
            }
            .multilineTextAlignment(.center)
            .font(.system(size: 24))
            .foregroundStyle(.white)
            
            ZStack(alignment: alignment) {
                Capsule(style: .continuous)
                    .stroke(challengeViewModel.challenge.color.opacity(0.5), style: .init(lineWidth: 8))
                    .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature + ".frame", in: viewModel.sharedNamespace)
                
                Circle()
                    .fill(challengeViewModel.challenge.color)
                    .frame(width: 48, height: 48)
                    .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature, in: viewModel.sharedNamespace)
                    .padding(4)
            }
            .frame(width: width, height: 48 + 8)
            .padding(.vertical)
            Spacer()
            
            if let disableInstructions = challengeViewModel.challenge.userFacingDisableInstructions {
                Text("Go to **\(disableInstructions)** and toggle Reduce Motion.")
                    .multilineTextAlignment(.center)
            }
        }
        .font(.system(size: 16))
        .foregroundStyle(.white)
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                withAnimation(.easeInOut(duration: 1)) {
                    width = 96
                }
            }
        }
        .onChange(of: didSucceed) { newValue in
            guard newValue else { return }
            
            withAnimation(.bouncy) {
                alignment = .leading
            }
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                withAnimation(.bouncy) {
                    width = 48
                }
            }
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                withAnimation(.spring(dampingFraction: 0.5)) {
                    challengeViewModel.state = .conclusion
                }
            }
        }
    }
}
