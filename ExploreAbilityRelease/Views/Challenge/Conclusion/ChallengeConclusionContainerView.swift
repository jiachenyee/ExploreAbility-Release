//
//  ChallengeConclusionContainerView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct ChallengeConclusionContainerView<Content: View>: View {
    
    @EnvironmentObject var challengePersistenceViewModel: ChallengePersistenceViewModel
    
    var namespace: Namespace.ID
    var challenge: Challenge
    
    @ViewBuilder
    var content: (() -> Content)
    
    var onDismiss: (() -> Void)
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    ZStack {
                        Circle()
                            .fill(challenge.color)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 8)
                        challenge.image
                            .matchedGeometryEffect(id: challenge.feature, in: namespace)
                    }
                    
                    Text(challenge.feature)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding([.top, .horizontal], 20)
                    
                    Text(challengePersistenceViewModel.retrieveChallenge(challenge).solveDate ?? .now,
                         style: .date)
                        .font(.caption)
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(challenge.color.opacity(0.5))
                            .matchedGeometryEffect(id: challenge.feature + ".frame", in: namespace)
                        GeometryReader { proxy in
                            ConfettiView(size: proxy.size)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .ignoresSafeArea(.container, edges: .top)
                }
                .overlay {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    
                }
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    content()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Button {
                onDismiss()
            } label: {
                Text("Done")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.accentColor)
                    )
            }
            .padding()
        }
        .onAppear {
            var challengeData = challengePersistenceViewModel.retrieveChallenge(challenge)
            
            if challengeData.solveDate == nil {
                challengeData.solveDate = .now
            }
            
            challengePersistenceViewModel.challengeData[challenge.feature] = challengeData
        }
    }
}
