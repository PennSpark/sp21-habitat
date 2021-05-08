//
//  PresetChoiceView.swift
//  habit
//
//  Created by Maggie Yu on 4/24/21.
//  Copyright © 2021 PCL. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct PresetChoiceView: View {
    var uid: String
    
    @State private var transition = false
    @State private var category = -1
    @State private var name = ""
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: .init(colors: [Color.init(red: 124/255, green: 168/255, blue: 229/255), Color.init(red: 255/255, green: 255/255, blue: 255/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)

            // transition to AddHabitView
            NavigationLink(destination: AddHabitView(uid: self.uid, cat: self.category), isActive: $transition) {
                EmptyView()
            }
            
            VStack {
                // Header and Squirrel
                Group {
                    VStack {
                        Spacer()
                            .frame(height: 75)
                        Text("Add your first habit...")
                            .font(.custom("DIN Alternate Bold", size: 30))
                            .frame(alignment: .leading)
                    }
                }
                Spacer()
                    .frame(height: 75)
                
                VStack {
                    // academic
                    ZStack {
                        Button(action: {
                            self.category = 0
                            self.transition = true
                            self.name = "Academic"
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(Color.init(red: 198/255, green: 153/255, blue: 215/255))
                                HStack {
                                    Image("academic")
                                        .foregroundColor(.black)
                                    Text("Academic")
                                        .font(.custom("DIN Alternate Bold", size: 30))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    // exercise
                    ZStack {
                        Button(action: {
                            self.category = 1
                            self.transition = true
                            self.name = "Exercise"
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(Color.init(red: 241/255, green: 220/255, blue: 205/255))
                                HStack {
                                    Image("exercise")
                                        .foregroundColor(.black)
                                    Text("Exercise")
                                        .font(.custom("DIN Alternate Bold", size: 30))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    //morning
                    ZStack {
                        Button(action: {
                            self.category = 2
                            self.transition = true
                            self.name = "Morning Routine"
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(Color.init(red: 236/255, green: 185/255, blue: 110/255))
                                HStack {
                                    Image("morning")
                                        .foregroundColor(.black)
                                    Text("Morning Routine")
                                        .font(.custom("DIN Alternate Bold", size: 30))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    // night
                    ZStack {
                        Button(action: {
                            self.category = 3
                            self.transition = true
                            self.name = "Night Routine"
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(Color.init(red: 148/255, green: 182/255, blue: 230/255))
                                HStack {
                                    Image("night")
                                        .foregroundColor(.black)
                                    Text("Night Routine")
                                        .font(.custom("DIN Alternate Bold", size: 30))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    // health
                    ZStack {
                        Button(action: {
                            self.category = 4
                            self.transition = true
                            self.name = "Health"
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(Color.init(red: 166/255, green: 211/255, blue: 121/255))
                                HStack {
                                    Image("health")
                                        .foregroundColor(.black)
                                    Text("Health")
                                        .font(.custom("DIN Alternate Bold", size: 30))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    // covid
                    ZStack {
                        Button(action: {
                            self.category = 5
                            self.transition = true
                            self.name = "COVID"
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(Color.init(red: 205/255, green: 109/255, blue: 112/255))
                                HStack {
                                    Image("covid")
                                        .foregroundColor(.black)
                                    Text("COVID")
                                        .font(.custom("DIN Alternate Bold", size: 30))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PresetChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        PresetChoiceView(uid: "MH2FHTECUdTUquZVHvgh8i2gQlk1")
    }
}
