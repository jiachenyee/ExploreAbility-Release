//
//  ChallengeConclusionDeveloperResourcesView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 20/6/23.
//

import Foundation
import SwiftUI

struct ChallengeConclusionDeveloperResourcesView: View {
    
    var resources: [DeveloperReference]
    var ghURL: URL?
    
    @State private var interfaceFramework: DeveloperReference.Framework = .swiftUi
    
    var body: some View {
        DisclosureGroup {
            VStack(spacing: 16) {
                Picker("Interface Framework", selection: $interfaceFramework) {
                    Text("SwiftUI")
                        .tag(DeveloperReference.Framework.swiftUi)
                    Text("UIKit")
                        .tag(DeveloperReference.Framework.uiKit)
                }
                .pickerStyle(.segmented)
                
                ForEach(resources, id: \.title) { resource in
                    if resource.relatedFrameworks.contains(interfaceFramework) {
                        VStack(alignment: .leading) {
                            if let url = resource.url {
                                Link(destination: url) {
                                    VStack(alignment: .leading) {
                                        Text(resource.title)
                                            .font(resource.type == .title ? .headline : .body)
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        if resource.type != .codeSnippet {
                                            Text(resource.type.description)
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                            } else {
                                Text(resource.title)
                                    .font(resource.type == .title ? .headline : .body)
                            }
                            
                            if let body = resource.body {
                                Text(body)
                            }
                            
                            if let codeSnippet = resource.codeSnippet {
                                ScrollView(.horizontal) {
                                    Text(codeSnippet)
                                        .textSelection(.enabled)
                                        .fontDesign(.monospaced)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                }
                                .background(.white.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            if resource.type == .codeSnippet {
                                HStack {
                                    Text(resource.type.description)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(.bouncy, value: interfaceFramework)
                    }
                }
            }
            .tint(.blue)
            .padding(.top, 4)
        } label: {
            Label("Developer Resources", systemImage: "curlybraces")
                .font(.system(.headline))
        }
        .tint(.white)
    }
}
