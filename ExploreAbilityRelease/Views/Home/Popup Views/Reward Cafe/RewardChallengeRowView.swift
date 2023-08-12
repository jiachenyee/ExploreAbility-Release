//
//  RewardChallengeRowView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 11/8/23.
//

import Foundation
import SwiftUI

struct RewardChallengeRowView: View {
    
    var rewardChallenge: any RewardChallenge
    
    @State private var isChallengePresented = false
    
    var body: some View {
        Button {
            isChallengePresented.toggle()
        } label: {
            Label {
                VStack(alignment: .leading) {
                    Text(rewardChallenge.title)
                        .font(.headline)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<3) { index in
                            if index < rewardChallenge.reward {
                                Image(systemName: "mug.fill")
                            }
                        }
                    }
                }
            } icon: {
                Image(systemName: "square")
                    .imageScale(.medium)
            }
            .foregroundStyle(.white)
        }
        .fullScreenCover(isPresented: $isChallengePresented) {
            ZStack {
                AnyView(rewardChallenge)
                Button {
                    isChallengePresented = false
                } label: {
                    Image(systemName: "xmark")
                        .fontWeight(.bold)
                        .padding(12)
                        .background(.thickMaterial)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
        }
    }
}
