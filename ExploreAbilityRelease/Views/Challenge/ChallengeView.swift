//
//  ChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct ChallengeView: View {
    
    var challenge: Challenge
    @EnvironmentObject var viewModel: ViewModel

    @StateObject var challengeViewModel: ChallengeViewModel = ChallengeViewModel()
    
    var body: some View {
        Group {
            switch challengeViewModel.state {
            case .unknown:
                ProgressView()
                    .matchedGeometryEffect(id: challenge.accessibilityFeature, in: viewModel.sharedNamespace)
                    .onAppear {
                        withAnimation {
                            challengeViewModel.challenge = challenge
                        }
                    }
            case .warning(let warning):
                PreChallengeWarningView(warning: warning)
            case .playingOff, .playingOn:
                ChallengePlayingView()
            case .success:
                EmptyView()
            case .menu:
                EmptyView()
            case .conclusion:
                VStack(spacing: -32) {
                    Button {
                        withAnimation(.bouncy) {
                            viewModel.gameState = .home
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 48)
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(challengeViewModel.challenge.color.opacity(0.5), style: .init(lineWidth: 8))
                            .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature + ".frame", in: viewModel.sharedNamespace)
                        
                        VStack(alignment: .leading) {
                            Text(challenge.accessibilityFeature)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView {
                                Text(challenge.postChallengeMessage)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .multilineTextAlignment(.leading)
                        .padding(24)
                    }
                    
                    ZStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 64, height: 64)
                        
                        Circle()
                            .fill(challengeViewModel.challenge.color)
                            .frame(width: 48, height: 48)
                        
                        challenge.image
                    }
                    .matchedGeometryEffect(id: challenge.accessibilityFeature, in: viewModel.sharedNamespace)
                }
                .padding()
            }
        }
        .environmentObject(challengeViewModel)
    }
}
