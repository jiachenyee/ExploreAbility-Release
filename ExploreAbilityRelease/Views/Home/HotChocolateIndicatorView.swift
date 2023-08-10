//
//  HotChocolateIndicatorView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/8/23.
//

import Foundation
import SwiftUI

struct HotChocolateIndicatorView: View {
    
    @AppStorage("hotChocolates") private var hotChocolates = 3
    @State private var mugAnimationAngle = Angle.degrees(0)
    @State private var isCafePresented = false
    
    var body: some View {
        Button {
            isCafePresented.toggle()
        } label: {
            HStack {
                Text("\(hotChocolates)")
                ZStack {
                    Image(systemName: "mug.fill")
                    
                    Image(systemName: "mug.fill")
                        .foregroundStyle(.brown)
                        .clipShape(WaveView(offset: mugAnimationAngle, percent: 0.5))
                        .onAppear {
                            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                                mugAnimationAngle = .degrees(360)
                            }
                        }
                }
            }
            .foregroundStyle(.white)
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding([.trailing, .top])
        .sheet(isPresented: $isCafePresented) {
            RewardCafeView()
                .presentationDetents([.medium, .large])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}
