//
//  RewardCafeHotChocolateCard.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/8/23.
//

import Foundation
import SwiftUI

struct RewardCafeHotChocolateCard: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    @AppStorage("hotChocolates") private var hotChocolates = 3
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.brown)
                .opacity(0.3)
            
            Group {
                WaveView(offset: waveOffset, percent: 0.5)
                    .fill(.brown.opacity(0.5))
                
                WaveView(offset: .degrees(45) - waveOffset, percent: 0.5)
                    .fill(.brown.opacity(0.5))
                
                WaveView(offset: .degrees(90) - waveOffset, percent: 0.5)
                    .fill(.brown.opacity(0.5))
            }
            .padding(.trailing, -32)
            
            VStack {
                Spacer()
                HStack {
                    Text("\(hotChocolates)")
                    Image(systemName: "mug.fill")
                        .imageScale(.small)
                }
                .font(.system(size: 64, weight: .bold))
                
                Spacer()
                Text("Hot Chocolate can be exchanged for hints.")
            }
            .padding()
        }
        .clipped()
        .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 8, bottomTrailingRadius: 8))
        .frame(height: 200)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}
