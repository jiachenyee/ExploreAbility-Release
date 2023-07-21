//
//  PlayingOnView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 14/6/23.
//

import Foundation
import SwiftUI

struct PlayingOnView: View {
    
    var initialState: Bool
    
    @Binding var didSucceed: Bool
    
    @EnvironmentObject private var challengeViewModel: ChallengeViewModel
    @EnvironmentObject private var viewModel: ViewModel
    
    @State private var width = 48.0
    @State private var alignment = Alignment.trailing
    
    var body: some View {
        VStack {
            Spacer()
            Text(
                "Turn "
                +
                AttributedString(challengeViewModel.challenge.accessibilityFeature)
                    .settingAttributes(
                        AttributeContainer
                            .font(.title.bold())
                    )
                +
                " back "
                +
                AttributedString(initialState ? "On" : "Off")
                    .settingAttributes(
                        AttributeContainer
                            .foregroundColor(challengeViewModel.challenge.color)
                            .font(.title.bold())
                    )
            )
            .font(.title)
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .accessibilityIdentifier("Reset")
            
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
            
            DisableInstructionsView(challenge: challengeViewModel.challenge)
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
