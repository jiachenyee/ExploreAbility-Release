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
    
    var body: some View {
        switch challengeViewModel.state {
        case .playingOff:
            ZStack {
                let borderWidth = dynamicTypeSize.getCircleBorderWidth(initialSize: initialSize)
                ArcText(text: dynamicTypeSize.getMessage(initialSize: initialSize), fontSize: dynamicTypeSize.fontSize)
                    .frame(width: 64 + dynamicTypeSize.offset, height: 64 + dynamicTypeSize.offset)
                    .scaleEffect(scale)
                
                Circle()
                    .stroke(challengeViewModel.challenge.color, lineWidth: borderWidth)
                    .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature, in: viewModel.sharedNamespace)
                    .padding(borderWidth / 2)
                    .frame(width: 48, height: 48)
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
                        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                            withAnimation(.easeIn(duration: 0.8)) {
                                scale = 0.1
                            }
                        }
                        
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                challengeViewModel.state = .playingOn
                            }
                        }
                    }
                }
            }
        case .playingOn:
            VStack {
                Spacer()
                HStack {
                    Text("Set Text Size back to")
                    Text("\(initialSize.index)")
                        .fontWeight(.bold)
                        .foregroundStyle(challengeViewModel.challenge.color)
                }
                .multilineTextAlignment(.center)
                .font(.system(size: 24))
                .foregroundStyle(.white)
                ZStack(alignment: .trailing) {
                    Capsule(style: .continuous)
                        .stroke(challengeViewModel.challenge.color.opacity(0.5), style: .init(lineWidth: 8))
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
                }
            }
            .onChange(of: dynamicTypeSize) { newValue in
                if initialSize == newValue {
                    withAnimation {
                        challengeViewModel.state = .success
                    }
                }
            }
        default: EmptyView()
        }
    }
}

extension DynamicTypeSize {
    var index: Int {
        switch self {
        case .xSmall: 0
        case .small: 1
        case .medium: 2
        case .large: 3
        case .xLarge: 4
        case .xxLarge: 5
        case .xxxLarge: 6
        case .accessibility1: 7
        case .accessibility2: 8
        case .accessibility3: 9
        case .accessibility4: 10
        case .accessibility5: 11
        @unknown default: 12
        }
    }
    
    var offset: Double {
        switch self {
        case .xSmall: 0
        case .small: 20
        case .medium: 40
        case .large: 60
        case .xLarge: 100
        case .xxLarge: 150
        case .xxxLarge: 180
        case .accessibility1: 250
        case .accessibility2: 270
        case .accessibility3: 320
        case .accessibility4: 380
        case .accessibility5: 400
        @unknown default: 12 * 20
        }
    }
    
    var fontSize: Double {
        [6, 8, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 32][index]
    }
    
    func getMessage(initialSize: DynamicTypeSize) -> String {
        guard self.index != 12 else { return "Unknown Size" }
        
        if initialSize.isAccessibilitySize {
            if initialSize == self {
                return "Too big!"
            } else {
                let messages = [
                    "You did it!",
                    "Almost there",
                    "This isn't small enough",
                    "Even smaller",
                    "Can we go smaller?",
                    "Slightly smaller?",
                    "Smaller?",
                    "Still too big.",
                    "Smaller…",
                    "Even smaller",
                    "Smaller!",
                    "Way too big.",
                ]
                
                return messages[index]
            }
        } else {
            if initialSize == self {
                return "This is a little too small"
            } else {
                let messages = [
                    "This is ridiculously small",
                    "This is pretty small",
                    "Maybe a little bigger?",
                    "Can we go bigger?",
                    "As big as we can go",
                    "All the way to the top",
                    "Even bigger!",
                    "Ridiculously HUGE",
                    "BIGGER",
                    "Even larger.",
                    "One more step.",
                    "You did it!"
                ]
                
                return messages[index]
            }
        }
    }
    
    func getCircleBorderWidth(initialSize: DynamicTypeSize) -> Double {
        guard self.index != 12 else { return 8 }
        
        if initialSize.isAccessibilitySize {
            let value = initialSize.index - self.index
            
            if value > 0 {
                return (16 / Double(initialSize.index)) * Double(value) + 8
            } else {
                return 4
            }
            
        } else {
            let value = self.index - initialSize.index
            
            if value > 0 {
                return (16 / Double(12 - initialSize.index)) * Double(value) + 8
            } else {
                return 4
            }
        }
    }
}
