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
                    Text("Treat the developers and get some free hints in return!")
                    
                    TabView {
                        VStack {
                            Spacer()
                            Image(systemName: "carrot.fill")
                                .font(.system(size: 96))
                                .foregroundStyle(.orange)
                                .padding(.trailing, 4)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("1 Hint")
                                    .padding(4)
                                    .padding(.horizontal, 8)
                                    .background(.yellow.opacity(0.5))
                                    .font(.caption)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text("Vegetables")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("What? No. I don't want your carrots. Keep those vegetables to yourself.\nIf you buy me a carrot, I'll give you one hint to get you to go away.")
                                    .font(.body)
                                
                                Divider()
                                    .padding(.vertical)
                                HStack {
                                    Text("$0.99")
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
                        
                        VStack {
                            Spacer()
                            Image(systemName: "mug.fill")
                                .font(.system(size: 96))
                                .foregroundStyle(.brown)
                                .padding(.trailing, 4)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("3 Hints")
                                    .padding(4)
                                    .padding(.horizontal, 8)
                                    .background(.yellow.opacity(0.5))
                                    .font(.caption)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text("Hot Chocolate")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Please give me a nice warm mug of hot chocolate. It's been awfully cold in the office lately.\nIn exchange, I'll give you 3 hints.")
                                    .font(.body)
                                
                                Divider()
                                    .padding(.vertical)
                                HStack {
                                    Text("$1.99")
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
                        
                        VStack {
                            Spacer()
                            Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                                .font(.system(size: 96))
                                .foregroundStyle(.red)
                                .padding(.trailing, 4)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("14 Hints")
                                    .padding(4)
                                    .padding(.horizontal, 8)
                                    .background(.yellow.opacity(0.5))
                                    .font(.caption)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text("Lunch")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("If you're giving me free lunch, of course you can have every hint in this app. I'll do anything for free lunch.")
                                    .font(.body)
                                
                                Divider()
                                    .padding(.vertical)
                                HStack {
                                    Text("$7.99")
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
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .onAppear {
                        UIPageControl.appearance().pageIndicatorTintColor = .systemYellow.withAlphaComponent(0.4)
                        UIPageControl.appearance().currentPageIndicatorTintColor = .systemYellow
                    }
                    
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
