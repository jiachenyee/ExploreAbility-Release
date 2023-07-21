//
//  DynamicTypeChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 11/6/23.
//

import Foundation
import SwiftUI

struct DynamicTypeChallengeView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @State var initialSize: DynamicTypeSize = .large
    
    @State private var width = 48.0
    
    @State private var scale = 1.0
    
    @State private var alignment = Alignment.trailing
    
    var body: some View {
        switch challengeViewModel.state {
        case .playingOff:
            ZStack {
                let borderWidth = dynamicTypeSize.getCircleBorderWidth(initialSize: initialSize)
                ArcText(text: dynamicTypeSize.getMessage(initialSize: initialSize), fontSize: dynamicTypeSize.fontSize)
                    .frame(width: 64 + dynamicTypeSize.offset, height: 64 + dynamicTypeSize.offset)
                    .scaleEffect(scale)
                
                ChallengeHomeButton(width: borderWidth)
                    .animation(.bouncy, value: dynamicTypeSize)
            }
            .onAppear {
                initialSize = dynamicTypeSize
            }
            .onChange(of: dynamicTypeSize) { newValue in
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                    let didSucceed = (initialSize.isAccessibilitySize && newValue == .xSmall) || (!initialSize.isAccessibilitySize && newValue == .accessibility5)
                    
                    if didSucceed {
                        
                        withAnimation(.easeIn(duration: 0.2)) {
                            scale = 1.1
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        
                        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                            withAnimation(.easeIn(duration: 0.8)) {
                                scale = 0.1
                            }
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        }
                        
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                challengeViewModel.state = .playingOn
                            }
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                    }
                }
            }
        case .playingOn:
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    Text("Set Text Size back to ")
                    Text("\(initialSize.index + 1)")
                        .fontWeight(.bold)
                        .foregroundStyle(challengeViewModel.challenge.color)
                }
                .accessibilityIdentifier("Reset")
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
                Text("Go to **Settings \(Image(systemName: "chevron.forward")) Accessibility \(Image(systemName: "chevron.forward")) Display & Text Size \(Image(systemName: "chevron.forward")) Larger Text** to reset text size.")
                    .multilineTextAlignment(.center)
            }
            .font(.system(size: 16))
            .foregroundStyle(.white)
            .padding()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                    withAnimation(.easeInOut(duration: 1)) {
                        width = 96
                    }
                    
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
                }
            }
            .onChange(of: dynamicTypeSize) { newValue in
                if initialSize == newValue {
                    withAnimation(.bouncy) {
                        alignment = .leading
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                        withAnimation(.bouncy) {
                            width = 48
                        }
                        
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                        withAnimation(.spring(dampingFraction: 0.5)) {
                            challengeViewModel.state = .conclusion
                        }
                        
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                        }
                    }
                }
            }
        default: EmptyView()
        }
    }
}

struct DynamicTextChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        XCChallengePreview(challenge: .dynamicType) {
            DynamicTypeChallengeView()
        }
    }
}
