//  addHabitView.swift
//  habit
//
//  Created by Leon Hertzberg on 3/27/21.
//  Copyright © 2021 PCL. All rights reserved.
//
import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseAuth
import FirebaseFirestore
struct AddHabitView: View {
    var uid : String
    var cat : Int
    
    var body: some View {
        ZStack {
            // academic
            if (cat == 0) {
                LinearGradient(gradient: .init(colors: [.white, Color.init(red: 198/255, green: 153/255, blue: 215/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            }
            // exercise
            else if (cat == 1) {
                LinearGradient(gradient: .init(colors: [.white, Color.init(red: 241/255, green: 220/255, blue: 205/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            }
            // morning
            else if (cat == 1) {
                LinearGradient(gradient: .init(colors: [.white, Color.init(red: 236/255, green: 185/255, blue: 110/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            }
            // night
            else if (cat == 1) {
                LinearGradient(gradient: .init(colors: [.white, Color.init(red: 166/255, green: 211/255, blue: 121/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            }
            // health
            else if (cat == 1) {
                LinearGradient(gradient: .init(colors: [.white, Color.init(red: 148/255, green: 182/255, blue: 230/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            }
            // health
            else if (cat == 1) {
                LinearGradient(gradient: .init(colors: [.white, Color.init(red: 148/255, green: 182/255, blue: 230/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            }
            
            
            
            if UIScreen.main.bounds.height > 800 {
                HabitHome(uid: self.uid, cat: self.cat)
            } else {
                ScrollView(.vertical, showsIndicators: false, content: {
                    HabitHome(uid: self.uid, cat: self.cat)
                })
            }
        }
    }
}


struct HabitHome: View {
    var uid : String
    var cat : Int
    @State var index = 0
    
    var body: some View {
        VStack {
            addHabit(uid: self.uid, cat: self.cat);
        }.padding()
    }
}

struct addHabit: View {
    var uid : String
    var cat : Int
    
    @State var habitName = ""
    @State var currentDate = Date()
    @State var setTime = Date()
    @State var checkState:Bool = false;
    @State var category = "Exercise"
    
    @State var academicSelected = false;
    
    @State var transition = false
    
    
    var body: some View {
        VStack {
            // transition to HomeView
            NavigationLink(destination: HomeView(uid: self.uid), isActive: $transition) {
                EmptyView()
            }
            /*
             want to make it so that when  a  categories button is pressed
             ie the category is selected
             all the other buttons colors go from their category color to gray
             so whatever u click keeps its category color, whatever you dont turns
             gray
             
             (except for before any are ever selected they maintan their og color
             */
            Text(category)
            .font(.custom("DIN Alternate Bold", size: 40))
            /*if (name == "Exercise") {
                Text("Exercise")
                    .font(.custom("DIN Alternate Bold", size: 40))
            }
            else {
                
            }*/
            
            HStack(spacing: 5) {
                // academic
                Button(action: {
                    self.category = "Academic"
                    self.academicSelected = !self.academicSelected
                    if (self.academicSelected) {
                        self.academicSelected = !self.academicSelected
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.init(red: 198/255, green: 153/255, blue: 215/255))
                        Image("academic")
                            .foregroundColor(.black)
                    }
                }
                
                // exercise
                Button(action: {
                    self.category = "Exercise"
                    self.academicSelected = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.init(red: 241/255, green: 220/255, blue: 205/255))
                        Image("exercise")
                            .foregroundColor(.black)
                    }
                }
                // morning
                Button(action: {
                    self.category = "Morning Routine"
                    self.academicSelected = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.init(red: 236/255, green: 185/255, blue: 110/255))
                        Image("morning")
                            .foregroundColor(.black)
                    }
                }
                // night
                Button(action: {
                    self.category = "Night Routine"
                    self.academicSelected = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.init(red: 148/255, green: 182/255, blue: 230/255))
                        Image("night")
                            .foregroundColor(.black)
                    }
                }
                // health
                Button(action: {
                    self.category = "Health"
                    self.academicSelected = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.init(red: 166/255, green: 211/255, blue: 121/255))
                        Image("health")
                            .foregroundColor(.black)
                    }
                }
                // covid
                Button(action: {
                    self.category = "COVID"
                    self.academicSelected = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.init(red: 205/255, green: 109/255, blue: 112/255))
                        Image("covid")
                            .foregroundColor(.black)
                    }
                }
            }
            
            VStack {
                HStack (spacing: 15) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                    TextField("Enter Habit Name", text: $habitName)
                }
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                    DatePicker("Enter Habit Date", selection: $currentDate, displayedComponents: .date)
                }
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                    DatePicker(
                                            "Select Event Time", selection: $setTime, displayedComponents: .hourAndMinute)
                }
                
                Divider()
                Button(action: {
                    self.saveHabit()
                }) {
                    if (transition) {
                        Text("HABIT SAVED!").bold()
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .foregroundColor(Color.init(red: 198/255, green: 153/255, blue: 215/255))
                           
                    }
                    else {
                        Text("SAVE HABIT")
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .foregroundColor(.black)
                    }
                    
                }
                
                /*HStack(spacing : 15) {
                    Button(action:
                                {
                                    //1. Save state
                                    self.checkState = !self.checkState
                                    print("State : \(self.checkState)")


                            }) {
                                HStack(alignment: .top, spacing: 10) {

                                            //2. Will update according to state
                                       Rectangle()
                                                .fill(self.checkState ? Color.green : Color.init(red: 198/255, green: 153/255, blue: 215/255))
                                                .frame(width:20, height:20, alignment: .center)
                                                .cornerRadius(5)

                                    Text("Repeating Habit").foregroundColor(.black)

                                }
                            }
                            .foregroundColor(Color.white)
                }*/
                
            }.padding(.vertical)
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(10)
            
            
            /*Button(action: {
                self.saveHabit()
            }) {
                if (transition) {
                    Text("HABIT SAVED!").bold()
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .foregroundColor(Color.init(red: 198/255, green: 153/255, blue: 215/255))
                       
                }
                else {
                    Text("SAVE HABIT")
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .foregroundColor(.black)
                }
                
            }.background(
                Color.white
            ).cornerRadius(8)*/
        }
    }
    
    func saveHabit() {
        //add their habbit to firebase database
        //habitName = name for us
        //currentDate = habbit date
        //setTime = habbit time
        //category = habbit category
        //checkState = does habbit repeat
        self.transition = true
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(uid: "MH2FHTECUdTUquZVHvgh8i2gQlk1", cat: 0)
    }
}
