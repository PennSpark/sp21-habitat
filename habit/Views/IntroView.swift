//
//  IntroView.swift
//  habit
//
//  Created by Maggie Yu on 4/10/21.
//  Copyright © 2021 PCL. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct IntroView: View {
    var uid: String
    
    @State private var squirrelName = ""
    @State private var transition = false
    
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: .init(colors: [Color.init(red: 124/255, green: 168/255, blue: 229/255), Color.init(red: 218/255, green: 220/255, blue: 224/255), Color.init(red: 247/255, green: 119/255, blue: 149/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)

            // transition to HomeView
            NavigationLink(destination: PresetChoiceView(uid: self.uid), isActive: $transition) {
                EmptyView()
            }
            
            VStack {
                // Header and Squirrel
                Group {
                    VStack {
                        Spacer()
                            .frame(height: 75)
                        Text("Name your Penn squirrel!")
                            .font(.custom("DIN Alternate Bold", size: 30))
                            .frame(alignment: .leading)
                        Spacer()
                            .frame(height: 75)
                        Image("squirrelBasic")
                            .resizable()
                            .frame(width: 250, height: 250)
                    }
                }
                Spacer()
                    .frame(height: 40)
                // Textfield
                TextField("Squirrel Name", text: $squirrelName)
                    .autocapitalization(.none)
                    .background(
                        RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2)
                            .background(Color.white)
                            .frame(width: 350, height: 50)
                    )
                    .frame(width: 320)
                
                Spacer()
                    .frame(height: 70)

                // Submit button
                HStack {
                    Spacer()
                    Button(action: {
                        // insert squirrel name based on uid
                        let db = Firestore.firestore()
                        db.collection("users").document(self.uid).setData(["squirrelName": self.squirrelName], merge: true)
                        self.transition = true
                        self.squirrelName = ""
                    }) {
                        Text("Submit")
                            .padding(.vertical)
                            .frame(width: 150)
                            .foregroundColor(.white)
                    }.background(
                        Color.init(red: 25/255, green: 71/255, blue: 129/255)
                    ).cornerRadius(25)
                    Spacer()
                        .frame(width: 30)
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(uid: "MH2FHTECUdTUquZVHvgh8i2gQlk1")
    }
}
