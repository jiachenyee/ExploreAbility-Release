//
//  HomeViewActionButton.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct HomeViewActionButton<V: View>: View {
    
    @ViewBuilder
    var image: V
    var color: Color
    
    var action: (() -> Void)
    
    init(image: Image, color: Color, action: @escaping () -> Void) where V == Image {
        self.image = image
        self.action = action
        self.color = color
    }
    
    init(systemName: String, color: Color, action: @escaping () -> Void) where V == Image {
        self.image = Image(systemName: systemName)
        self.action = action
        self.color = color
    }
    
    typealias CustomImage = ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _FrameLayout>
    
    init(_ name: String, color: Color, action: @escaping () -> Void) where V == CustomImage {
        self.image =
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 20) as! CustomImage
        
        self.action = action
        self.color = color
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(color)
                .overlay {
                    image
                        .foregroundStyle(.black)
                }
        }
    }
}
