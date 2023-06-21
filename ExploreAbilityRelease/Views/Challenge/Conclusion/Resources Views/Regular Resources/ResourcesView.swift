//
//  ResourcesView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 20/6/23.
//

import Foundation
import SwiftUI

struct ResourcesView: View {
    
    var resources: [ReferenceResource]
    
    var body: some View {
        DisclosureGroup {
            VStack(spacing: 16) {
                ForEach(resources, id: \.url.absoluteString) { resource in
                    ResourceView(resource: resource)
                }
            }
            .tint(.blue)
            .padding(.top, 4)
        } label: {
            Label("Resources", systemImage: "book")
                .font(.system(.headline))
        }
        .tint(.white)
    }
}
