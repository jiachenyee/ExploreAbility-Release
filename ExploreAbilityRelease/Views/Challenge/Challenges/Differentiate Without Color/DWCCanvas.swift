//
//  DWCCanvas.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import SwiftUI

struct DWCCanvas: View {
    
    @Binding var pathPoints: [TaggedPath]
    
    @Binding var drawingPreviewShowsStrokes: Bool
    
    @Binding var isDrawing: Bool
    
    var selectedColor: Color
    
    var body: some View {
        ZStack {
            ForEach(pathPoints) { taggedPath in
                if let firstPoint = taggedPath.points.first {
                    Group {
                        if drawingPreviewShowsStrokes {
                            taggedPath.color
                        } else {
                            Image(taggedPath.imageName())
                                .resizable()
                                .background(Color(white: taggedPath.colorIntensity()))
                        }
                    }
                    .mask {
                        Path { path in
                            path.move(to: firstPoint)
                            
                            for point in taggedPath.points {
                                path.addLine(to: point)
                            }
                        }
                        .stroke(taggedPath.color, style: .init(lineWidth: 30, lineCap: .round))
                    }
                    
                }
            }
            
            Rectangle()
                .opacity(0.001)
                .gesture(DragGesture()
                    .onChanged { value in
                        if isDrawing {
                            pathPoints[pathPoints.count - 1].points.append(value.location)
                        } else {
                            pathPoints.append(TaggedPath(points: [value.location],
                                                         color: selectedColor))
                        }
                        isDrawing = true
                    }.onEnded { value in
                        guard isDrawing else { return }
                        pathPoints[pathPoints.count - 1].points.append(value.location)
                        isDrawing = false
                    }
                )
        }
    }
}
