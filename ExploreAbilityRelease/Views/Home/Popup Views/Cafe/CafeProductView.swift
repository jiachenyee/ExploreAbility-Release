//
//  CafeProductView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct CafeProductView: View {
    
    var hintCount: Int
    var systemName: String
    
    var tintColor: Color
    
    var name: String
    var description: String
    
    var price: String
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: systemName)
                .font(.system(size: 96))
                .foregroundStyle(tintColor)
                .padding(.trailing, 4)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("^[\(hintCount) Hint](inflect: true)")
                    .padding(4)
                    .padding(.horizontal, 8)
                    .background(.yellow.opacity(0.5))
                    .font(.caption)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(description)
                    .font(.body)
                
                Divider()
                    .padding(.vertical)
                HStack {
                    Text(price)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button("Buy") {
                        
                    }
                    .tint(.yellow)
                    .buttonStyle(.borderedProminent)
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.bottom, 48)
        .padding(.horizontal)
    }
}
