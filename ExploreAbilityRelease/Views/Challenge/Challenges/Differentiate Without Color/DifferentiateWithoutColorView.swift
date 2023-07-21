//
//  DifferentiateWithoutColorView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import SwiftUI

struct DifferentiateWithoutColorView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColorEnabled
    
    @State private var originalDifferentiateWithoutColorState = false
    
    @State private var drawingPreviewShowsStrokes = true
    
    @State private var pathPoints: [TaggedPath] = []
    
    @State private var isDrawing = false
    
    @State private var grayscaleValue = 0.0
    
    @State private var selectedColor = Color.red
    
    @State private var didFinishChallenge = false
    
    @State private var message = "Draw something!"
    
    var body: some View {
        switch challengeViewModel.state {
        case .playingOff:
            ZStack {
                DWCCanvas(pathPoints: $pathPoints,
                          drawingPreviewShowsStrokes: $drawingPreviewShowsStrokes,
                          isDrawing: $isDrawing,
                          selectedColor: selectedColor)
                .grayscale(grayscaleValue)
                
                VStack {
                    HStack {
                        ColorWellSelectionView(color: .red, selectedColor: $selectedColor)
                        ColorWellSelectionView(color: .yellow, selectedColor: $selectedColor)
                    }
                    .grayscale(grayscaleValue)
                    
                    HStack {
                        ColorWellSelectionView(color: .teal, selectedColor: $selectedColor)
                            .grayscale(grayscaleValue)
                        
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
                        
                        ColorWellSelectionView(color: .mint, selectedColor: $selectedColor)
                            .grayscale(grayscaleValue)
                    }
                    
                    HStack {
                        ColorWellSelectionView(color: .orange, selectedColor: $selectedColor)
                        ColorWellSelectionView(color: .green, selectedColor: $selectedColor)
                    }
                    .grayscale(grayscaleValue)
                }
                
                Text(message)
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .onAppear {
                originalDifferentiateWithoutColorState = differentiateWithoutColorEnabled
                
                drawingPreviewShowsStrokes = !originalDifferentiateWithoutColorState
                
                withAnimation(.easeIn(duration: 3)) {
                    grayscaleValue = 1.0
                }
            }
            .onChange(of: differentiateWithoutColorEnabled) { newValue in
                guard newValue != originalDifferentiateWithoutColorState else { return }
                
                if pathPoints.isEmpty {
                    withAnimation {
                        challengeViewModel.state = .playingOn
                    }
                } else {
                    withAnimation {
                        drawingPreviewShowsStrokes.toggle()
                    }
                    
                    message = "You did it!"
                    
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        withAnimation {
                            challengeViewModel.state = .playingOn
                        }
                    }
                }
            }
            
        case .playingOn:
            PlayingOnView(initialState: originalDifferentiateWithoutColorState, didSucceed: $didFinishChallenge)
                .onChange(of: differentiateWithoutColorEnabled) { newValue in
                    if originalDifferentiateWithoutColorState == newValue {
                        didFinishChallenge = true
                    }
                }
            EmptyView()
        default: EmptyView()
        }
    }
}

struct DifferentiateWithoutColorView_Previews: PreviewProvider {
    static var previews: some View {
        XCChallengePreview(challenge: .reduceMotion) {
            DifferentiateWithoutColorView()
        }
    }
}
