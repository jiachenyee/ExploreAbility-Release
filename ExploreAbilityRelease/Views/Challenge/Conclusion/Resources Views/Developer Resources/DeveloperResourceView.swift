//
//  DeveloperResourceView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct DeveloperResourceView: View {
    
    var resource: DeveloperResource
    
    var body: some View {
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
                        .font(.system(.body, design: .monospaced, weight: .regular))
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
                    Text("\(Image(systemName: "swift")) Code Snippet")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
