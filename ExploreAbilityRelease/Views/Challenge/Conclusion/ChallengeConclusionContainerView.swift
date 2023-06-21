//
//  ChallengeConclusionContainerView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct ChallengeConclusionContainerView<Content: View>: View {
    
    var namespace: Namespace.ID
    var challenge: Challenge
    
    @ViewBuilder
    var content: (() -> Content)
    
    var onDismiss: (() -> Void)
    
    var body: some View {
        VStack(spacing: -32) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(challenge.color.opacity(0.5), style: .init(lineWidth: 8))
                    .matchedGeometryEffect(id: challenge.accessibilityFeature + ".frame", in: namespace)
                
                VStack(alignment: .leading) {
                    Text(challenge.accessibilityFeature)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .horizontal], 20)
                    ScrollView {
                        VStack(alignment: .leading) {
                            content()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .bottom], 20)
                        .padding(.bottom, 32)
                    }
                }
                .padding(4)
                .multilineTextAlignment(.leading)
            }
            
            ZStack {
                Circle()
                    .fill(.black)
                    .frame(width: 64, height: 64)
                
                Button {
                    onDismiss()
                } label: {
                    ZStack {
                        Circle()
                            .fill(challenge.color)
                            .frame(width: 48, height: 48)
                        
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                    }
                }
                .accessibilityLabel("Dismiss")
                .matchedGeometryEffect(id: challenge.accessibilityFeature, in: namespace)
            }
        }
        .padding()
    }
}
