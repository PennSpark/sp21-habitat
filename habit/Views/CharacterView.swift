//
//  CharacterView.swift
//  habit
//
//  Created by arushi srivastava on 4/17/21.
//  Copyright © 2021 PCL. All rights reserved.
//
import Foundation
import SwiftUI

// Implement CharacterView based on Figma
// Character Profile
struct CharacterView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color.white, Color.init(red: 124/255, green: 168/255, blue: 229/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        
            VStack {
                
                Text("PCL")
                    .font(.custom("DIN Alternate Bold", size: 45))
                
                HStack {
                    //Character
                    Image("squirrelBasic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                    Spacer()
                        .frame(width: 30)
                }
                
                Image("bar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 380)
                
                Text("Lvl 1")
                .font(.custom("DIN Alternate Bold", size: 30))
                
                Spacer()
                    .frame(height: 15)
                
                Text("Possible Upgrades at Lvl 2")
                    .font(.custom("DIN Alternate Bold", size: 20))
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.black)
                    .frame(width: 350, height: 2)
                
                Group {
                    VStack {
                        HStack {
                            Image("squirrelSweatshirt")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            Text("Buy PCL a P-Sweater!")
                                .font(.custom("DIN Alternate Bold", size: 18))
                            Spacer()
                                .frame(width: 55)
                        }
                        HStack {
                            Image("squirrelSbux")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            Text("Get a morning oat milk latte!")
                                .font(.custom("DIN Alternate Bold", size: 18))
                        }
                        HStack {
                            Spacer()
                                .frame(width: 40)
                            Image("squirrelCanadaGoose")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            Text("Flex on all the other squirrels with your Canada Goose merch!")
                                .font(.custom("DIN Alternate Bold", size: 18))
                            Spacer()
                                .frame(width: 15)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}


/*var view = UILabel()
view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
view.backgroundColor = .white
view.layer.borderWidth = 1
view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor*/
