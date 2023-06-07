//
//  CafeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import SwiftUI

struct CafeView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    init() {
        UIPageControl.appearance().pageIndicatorTintColor = .systemYellow.withAlphaComponent(0.4)
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemYellow
    }
    
    var body: some View {
        HomePopupView(id: "cafe.icon",
                      systemImage: "mug.fill",
                      title: "Cafe",
                      description: "Show your appreciation to the developers by giving them a treat! You'll receive some hints in return!") {
            
            TabView {
                CafeProductView(hintCount: 1,
                                systemName: "carrot.fill",
                                tintColor: .orange,
                                name: "Vegetables",
                                description: "What? No. I don't want your carrots. Keep those vegetables to yourself.\nIf you buy me a carrot, I'll give you one hint to get you to go away.", price: "$0.99")
                
                CafeProductView(hintCount: 3,
                                systemName: "mug.fill",
                                tintColor: .brown,
                                name: "Hot Chocolate",
                                description: "Please give me a nice warm mug of hot chocolate. It's been awfully cold in the office lately.\nIn exchange, I'll give you 3 hints.",
                                price: "$1.99")
                
                CafeProductView(hintCount: 14,
                                systemName: "takeoutbag.and.cup.and.straw.fill",
                                tintColor: .red,
                                name: "Lunch",
                                description: "If you're giving me free lunch, of course you can have every hint in this app. I'll do anything for free lunch.", price: "$7.99")
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .padding(.horizontal, -16)
        }
    }
}

struct CafeView_Previews: PreviewProvider {
    static var previews: some View {
        CafeView()
            .preferredColorScheme(.dark)
            .fontDesign(.rounded)
    }
}
