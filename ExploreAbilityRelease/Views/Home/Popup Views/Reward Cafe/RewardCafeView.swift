//
//  RewardCafeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/8/23.
//

import Foundation
import SwiftUI

struct RewardCafeView: View {
    var body: some View {
        VStack(spacing: 0) {
            RewardCafeHotChocolateCard()
            
            List {
                Section("\(Image(systemName: "checkmark")) Ready") {
                    RewardChallengeRowView(rewardChallenge: DecodeBrailleRewardChallenge {
                        print("ASSIGNED")
                    })
                }
                
                Section("\(Image(systemName: "timer")) Preparing Hot Chocolate…") {
                    ForEach(0..<10) { index in
                        HStack {
                            Image(systemName: "square")
                            VStack(alignment: .leading) {
                                Text("ChallengeName\(index)")
                                    .font(.headline)
                                
                                HStack(spacing: 0) {
                                    Image(systemName: "mug.fill")
                                    Image(systemName: "mug.fill")
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            .imageScale(.small)
            .listStyle(.plain)
        }
    }
}
