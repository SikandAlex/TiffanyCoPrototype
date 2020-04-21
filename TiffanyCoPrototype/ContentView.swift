//
//  ContentView.swift
//  TiffanyCoPrototype
//
//  Created by Alex Sikand on 4/5/20.
//  Copyright © 2020 AlexSikandEngineering. All rights reserved.
//

import SwiftUI
import UIGradients_Swift



let watches = ["Tiffany T T1", "Tiffany Victoria® ring", "T1 Wide Diamond Ring"]
let watchImages : [String] = ["forHer1", "forHer3", "forHer2"]

let forHer = ["Tiffany 25 mm round", "Makers 22 mm", "Limited Edition 25 mm"]
let forHerImages : [String] = ["watch1", "watch2", "watch3"]


let tiffanyColor = Color(red: 0.49, green: 0.82, blue: 0.79)

struct ProductCard: View {
    var image: Image
    var title: String
    
    var body: some View {
        VStack(alignment: .center){
            image.resizable().clipShape(Rectangle()).shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 0).frame(width: 200, height: 200)
            Text(title).fontWeight(.medium).font(.custom("Santral-Light", size: 16)).multilineTextAlignment(.leading)
            
            
        }
    }
}


struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            HStack(alignment: .top) {
                Image("user").resizable().scaledToFit().frame(width: 50, height: 50).padding(.leading)
                Spacer()
                Image("tiffanyLogo").resizable().scaledToFit().frame(maxHeight: 80)
                Spacer()
                Image("shoppingBag").resizable().scaledToFit().frame(width: 50, height: 50).padding(.trailing)
            }
            
           
            
            
            VStack(alignment: .leading) {
                BannerCard(name: "Socialive",  title: "New Women’s Watches", body: "Tiffany watches for women combine timeless, feminine styles with expert Swiss craftsmanship.", buttonText: "Shop Now", showArrow: true, start: .leading, end: .trailing)
                HStack(spacing: 0) {
                                                      Text("Diamond Jewelry").font(.custom("LinLibertineOC", size: 28)).fontWeight(.bold)
                                                      .padding([.leading, .top])
                                                      
                                                      Spacer()
                                                      Text("See All")
                                                      .font(.custom("Santral-Light", size: 18))
                                                      .foregroundColor(.gray).padding([.top, .trailing])
                                                      
                                                  }.padding(.top)
                                                  Divider().padding(.horizontal)
                                                  
                                                  .padding(.bottom)
                                   ScrollView(.horizontal, showsIndicators: false) {
                                                          
                                                          HStack(spacing: 15.0){
                                                              ForEach((0...watches.count-1), id: \.self) {
                                                                  ProductCard(image: Image(watchImages[$0]), title: watches[$0])
                                                              }
                                                              
                                                        
                                                          }
                                                          .padding(.leading)
                                                          
                                                      }
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack(spacing: 0) {
                                       Text("Gifts for her").font(.custom("LinLibertineOC", size: 28)).fontWeight(.bold)
                                       .padding([.leading, .top])
                                       
                                       Spacer()
                                       Text("See All")
                                           .font(.custom("Santral-Light", size: 18))
                                           .foregroundColor(.gray).padding([.top, .trailing])
                                       
                                   }
                                   
                                   Divider().padding(.horizontal)
                                   
                                   .padding(.bottom)
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 15.0){
                            ForEach((0...forHer.count-1), id: \.self) {
                                ProductCard(image: Image(forHerImages[$0]), title: forHer[$0])
                            }
                            
                        }
                        .padding(.leading)
                        
                    }
    
                               }
        
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BannerCard : View {
    
    var name: String
    var bodyText: String
    var titleText: String
    var showArrow: Bool
    var buttonText: String
    var start: UnitPoint
    var end: UnitPoint
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // First Row
            HStack(alignment: .top) {
                
                // Title
                Text(titleText).font(.custom("LinLibertineOC", size: 28)).foregroundColor(.white).multilineTextAlignment(.leading)
                
                Spacer()
                
                // Dismiss Button
                Button(action: {}) {
                    Image(systemName: "xmark").font(.headline).foregroundColor(.white)
                }.padding(.top)
                
            }.padding([.leading, .top, .trailing])
            
            // Body text of card
            Text(bodyText).font(.custom("Santral-Light", size: 20)).bold().multilineTextAlignment(.leading).foregroundColor(.white).padding([.leading, .top, .trailing]).opacity(0.75).fixedSize(horizontal: false, vertical: true)
            
            // Call to action button
            Button(action: {
                print("Tapped!")
            }) {
                HStack {
                    Text(buttonText)
                        .fontWeight(.semibold)
                        .font(.custom("Santral-Light", size: 16))
                    if (showArrow == true) {
                        Image(systemName: "arrow.right")
                        .font(.callout)
                    }
                }
                .padding()
                .foregroundColor(.white)
            }
            .background(Capsule())
            .padding(.all)
           
        }
            // Gradient background and corner radius
            .background(LinearGradient(gradient: Gradient(named: self.name)!, startPoint: self.start, endPoint: self.end)).clipShape(RoundedRectangle(cornerRadius: 8)).shadow(color: Color.gray.opacity(0.4), radius: 12, x: 0, y: 0)
            .padding([.all])
    }
}

// Create an initializer for custom BannerCard view
extension BannerCard {
    init(name: String, title: String, body: String, buttonText: String, showArrow: Bool, start: UnitPoint, end: UnitPoint) {
        self.name = name
        self.bodyText = body
        self.titleText = title
        self.buttonText = buttonText
        self.showArrow = showArrow
        self.start = start
        self.end = end
    }
}



// Helper functions, extend Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

