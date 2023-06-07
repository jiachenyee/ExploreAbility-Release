//
//  CafeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import SwiftUI

struct CafeView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var dragPosition: CGSize = .zero
    @State private var showPrompt = false
    
    @State private var showByePrompt = false
    
    init() {
        UIPageControl.appearance().pageIndicatorTintColor = .systemYellow.withAlphaComponent(0.4)
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemYellow
    }
    
    var body: some View {
        GeometryReader { geometry in
            if showPrompt {
                VStack(alignment: .center) {
                    if showByePrompt {
                        Text("👋 Bye! See you next time!")
                    } else {
                        Text("Keep dragging to dismiss")
                        Image(systemName: "chevron.down")
                            .padding(.top, 4)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                    .offset(y: dragPosition.height / 2)
            }
            
            VStack(spacing: -40) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 90, height: 90)
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.yellow)
                            .overlay {
                                Image(systemName: "mug.fill")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 32))
                            }
                            .matchedGeometryEffect(id: "cafe.icon\(dragPosition == .zero ? "" : ".noanim")", in: viewModel.sharedNamespace)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Cafe")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Show your appreciation to the developers by giving them a treat! You'll receive some hints in return!")
                    
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
                .padding(.top, 40)
                .padding()
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .leading)
                .background(.white, ignoresSafeAreaEdges: .bottom)
                .zIndex(-1)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 16, topTrailingRadius: 16))
                
                Spacer()
            }
            .offset(y: dragPosition.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        guard value.translation.height > 0 else { return }
                        
                        dragPosition = value.translation
                        if dragPosition.height > 50 {
                            withAnimation {
                                showPrompt = true
                            }
                        }
                        
                        withAnimation {
                            showByePrompt = dragPosition.height / geometry.size.height > 0.3
                        }
                    }
                    .onEnded { value in
                        if value.translation.height / geometry.size.height > 0.3 {
                            withAnimation(.bouncy) {
                                viewModel.gameState = .home
                                dragPosition = .init(width: value.predictedEndTranslation.width, height: geometry.size.height)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                dragPosition = .zero
                                showByePrompt = false
                            }
                        } else {
                            withAnimation(.bouncy) {
                                dragPosition = .zero
                            }
                        }
                        
                        withAnimation {
                            showPrompt = false
                        }
                    }
            )
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
