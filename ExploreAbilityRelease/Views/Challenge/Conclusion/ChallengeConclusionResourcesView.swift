//
//  ChallengeConclusionResourcesView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 20/6/23.
//

import Foundation
import SwiftUI

struct ChallengeConclusionResourcesView: View {
    
    var resources: [ReferenceResource]
    
    var body: some View {
        DisclosureGroup {
            VStack(spacing: 16) {
                ForEach(resources, id: \.url.absoluteString) { resource in
                    Link(destination: resource.url) {
                        VStack(alignment: .leading) {
                            Text(resource.title)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(resource.type.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
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
