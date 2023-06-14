//
//  ReduceMotionView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/6/23.
//

import SwiftUI

struct ReduceMotionView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        switch challengeViewModel.state {
        case .playingOff:
            ZStack {
                Button {
                    withAnimation {
                        challengeViewModel.state = .menu
                    }
                } label: {
                    Circle()
                        .stroke(challengeViewModel.challenge.color, lineWidth: 8)
                        .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature, in: viewModel.sharedNamespace)
                        .padding(8 / 2)
                }
                .frame(width: 48, height: 48)
                
                Group {
                    RotatingCircleView(id: "1", distance: 56 * 2, rpm: 0.2)
                    RotatingCircleView(id: "2", distance: 56 * 3, rpm: 0.3)
                    RotatingCircleView(id: "3", distance: 56 * 4, rpm: 0.5)
                    RotatingCircleView(id: "4", distance: 56 * 5, rpm: 0.9)
                    RotatingCircleView(id: "5", distance: 56 * 6, rpm: 0.8)
                    RotatingCircleView(id: "6", distance: 56 * 7, rpm: 1)
                    RotatingCircleView(id: "7", distance: 56 * 8, rpm: 0.7)
                    RotatingCircleView(id: "8", distance: 56 * 9, rpm: 0.6)
                    RotatingCircleView(id: "9", distance: 56 * 10, rpm: 0.5)
                    RotatingCircleView(id: "10", distance: 56 * 11, rpm: 0.4)
                }
            }
        case .playingOn:
//            VStack {
//                Spacer()
//                HStack {
//                    Text("Set Text Size back to")
//                    Text("\(initialSize.index)")
//                        .fontWeight(.bold)
//                        .foregroundStyle(challengeViewModel.challenge.color)
//                }
//                .multilineTextAlignment(.center)
//                .font(.system(size: 24))
//                .foregroundStyle(.white)
//                ZStack(alignment: alignment) {
//                    Capsule(style: .continuous)
//                        .stroke(challengeViewModel.challenge.color.opacity(0.5), style: .init(lineWidth: 8))
//                        .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature + ".frame", in: viewModel.sharedNamespace)
//                    
//                    Circle()
//                        .fill(challengeViewModel.challenge.color)
//                        .frame(width: 48, height: 48)
//                        .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature, in: viewModel.sharedNamespace)
//                        .padding(4)
//                }
//                .frame(width: width, height: 48 + 8)
//                .padding(.vertical)
//                Spacer()
//                Text("Go to **Settings \(Image(systemName: "chevron.forward")) Accessibility \(Image(systemName: "chevron.forward")) Display & Text Size \(Image(systemName: "chevron.forward")) Larger Text** to reset text size.")
//                    .multilineTextAlignment(.center)
//            }
//            .font(.system(size: 16))
//            .foregroundStyle(.white)
//            .padding()
//            .onAppear {
//                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
//                    withAnimation(.easeInOut(duration: 1)) {
//                        width = 96
//                    }
//                }
//            }
//            .onChange(of: dynamicTypeSize) { newValue in
//                if initialSize == newValue {
//                    withAnimation(.bouncy) {
//                        alignment = .leading
//                    }
//                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
//                        withAnimation(.bouncy) {
//                            width = 48
//                        }
//                    }
//                    
//                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
//                        withAnimation(.spring(dampingFraction: 0.5)) {
//                            challengeViewModel.state = .conclusion
//                        }
//                    }
//                }
//            }
            EmptyView()
        default: EmptyView()
        }
    }
}
