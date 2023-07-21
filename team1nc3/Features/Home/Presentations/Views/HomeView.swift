//
//  HomeView.swift
//  team1nc3
//
//  Created by Rizki Samudra on 20/07/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModels()
    
    var body: some View {
            
            ScrollView {
                VStack(alignment: .leading){
                    HStack {
                        PointView()
                        
                        Spacer()
                        
                        Image(systemName: "tray")
                            .font(Font.system(.body))
                            .fontWeight(.regular)
                            .foregroundColor(Color.Neutral.s70)
                            .padding(.trailing, 4)
                        
                        Image(systemName: "questionmark.circle")
                            .font(Font.system(.body))
                            .fontWeight(.regular)
                            .foregroundColor(Color.Neutral.s70)

                    } .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                    
                    Image("ic_promo_1")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .greatestFiniteMagnitude, minHeight: 200)
                        .background(.gray)
                    //Prepare some Carousel Code/Lib
                    
                    
                    Text("Walk in 13 km to Lebak Bulus Grab")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    
                    Grid(verticalSpacing: 16) {
                        GridRow {
                            ForEach(homeViewModel.firstMenu, id: \.self) { menu in
                                MenuView(menu: menu)
                                    .frame(maxWidth: .greatestFiniteMagnitude)
                                
                            }
                        }
                        GridRow {
                            ForEach(homeViewModel.secondMenu, id: \.self) { menu in
                                MenuView(menu: menu)
                                    .frame(maxWidth: 74,minHeight: 58)
                                
                            }
                        }
                    }
                    .frame(maxWidth: .greatestFiniteMagnitude)
                    .padding(.horizontal, 16)
                    
                    
                    Text("LifeStyle")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.top,16)
                    
                    Grid(horizontalSpacing: 12) {
                        GridRow {
                            ForEach(homeViewModel.lifeStyleData, id: \.self) { menu in
                                LifeStyleMenuView(menuImage: menu)
                                    .frame(maxWidth: 50, minHeight: 50)
                            }
                            .frame(maxWidth: .greatestFiniteMagnitude)
                        }
                        
                    }
                    .padding(.horizontal, 16)
                    
                    
                    Text("Promo")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    
                    Image("ic_promo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .greatestFiniteMagnitude, minHeight: 200)
                        .padding(.top, 0)
                    
                }
                
            }
            .background(Color.Neutral.s20)

        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

