//
//  addHabitView.swift
//  habit
//
//  Created by Leon Hertzberg on 3/27/21.
//  Copyright © 2021 PCL. All rights reserved.
//
import SwiftUI

struct addHabitView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.white, .pink,]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            if UIScreen.main.bounds.height > 800 {
                HabitHome()
            } else {
                ScrollView(.vertical, showsIndicators: false, content: {
                    HabitHome()
                })
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        addHabitView()
    }
}


struct HabitHome: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            addHabit();
        }.padding()
    }
}

struct addHabit: View {
    
    @State var habitName = ""
    @State var currentDate = Date()
    @State var setTime = Date()
    
    @State var dailyState:Bool = false;
    @State var weeklyState:Bool = false;
    @State var neverState:Bool = false;
    
    @State var academicSelected = true;
    @State var exerciseSelected = true;
    @State var mornSelected = true;
    @State var nightlySelected = true;
    @State var healthSelected = true;
    @State var covidSelected = true;
    
    @State var category = "Select A Category"
    
    
    var body: some View {
        VStack {
            Text(category).padding(.bottom,40).font(.largeTitle)
            HStack(spacing: 15) {
                Button(action: {
                    category = "Academic"
                    switchOffOthers()
                            }) {
                    if (academicSelected) {
                        Text("Academic")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.purple)
                            .clipShape(Circle())
                    } else {
                        Text("Academic")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                        }
                
                Button(action: {
                    category = "Exercise"
                    switchOffOthers()
                            }) {
                    if (exerciseSelected) {
                        Text("Exercise")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.pink)
                            .clipShape(Circle())
                    } else {
                        Text("Exercise")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                        }
                
                Button(action: {
                    category = "Morning Routine"
                    switchOffOthers()
                            }) {
                    if (mornSelected) {
                        Text("Morning\nRoutine")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.orange)
                            .clipShape(Circle())
                    } else {
                        Text("Morning\nRoutine")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                        }
                
                Button(action: {
                            print("Nightly Routine Pressed")
                    category = "Nightly Routine"
                    switchOffOthers()
                            }) {
                    if (nightlySelected) {
                        Text("Nightly\nRoutine")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.blue)
                            .clipShape(Circle())
                    } else {
                        Text("Nightly\nRoutine")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                        }
            }.padding(.bottom, 10)
            
            HStack(spacing: 15) {
                Button(action: {
                            print("Health Pressed")
                    category = "Health"
                    switchOffOthers()
                            }) {
                    if (healthSelected) {
                        Text("Health")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.green)
                            .clipShape(Circle())
                    } else {
                        Text("Health")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                        }
                
                Button(action: {
                            print("Covid Pressed")
                    category = "Covid"
                    switchOffOthers()
                            }) {
                    if (covidSelected) {
                        Text("Covid")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.red)
                            .clipShape(Circle())
                    } else {
                        Text("Covid")
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                        }
                
                
            }
            
            VStack {
                HStack (spacing: 15) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                    TextField("Enter Habit Name", text: $habitName)
                }.padding(.bottom, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                    DatePicker("Enter Habit Date", selection: $currentDate, displayedComponents: .date)
                }.padding(.vertical, 10)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                    DatePicker(
                                            "Select Event Time", selection: $setTime, displayedComponents: .hourAndMinute)
                }.padding(.vertical, 10)
                
                Divider()
                
                HStack(spacing : 15) {
                    Button(action:
                                {
                                    //1. Save state
                                    self.dailyState = !self.dailyState
                                    self.weeklyState = false
                                    self.neverState = false
                                    print("State : \(self.dailyState)")


                            }) {
                                HStack(alignment: .top, spacing: 10) {

                                            //2. Will update according to state
                                       Rectangle()
                                                .fill(self.dailyState ? Color.green : Color.red)
                                                .frame(width:20, height:20, alignment: .center)
                                                .cornerRadius(5)

                                    Text("Daily").foregroundColor(.black)

                                }
                            }
                            .foregroundColor(Color.white)
                    
                    Button(action:
                                {
                                    //1. Save state
                                    self.weeklyState = !self.weeklyState
                                    self.dailyState = false
                                    self.neverState = false
                                    print("State : \(self.weeklyState)")


                            }) {
                                HStack(alignment: .top, spacing: 10) {

                                            //2. Will update according to state
                                       Rectangle()
                                                .fill(self.weeklyState ? Color.green : Color.red)
                                                .frame(width:20, height:20, alignment: .center)
                                                .cornerRadius(5)

                                    Text("Weekly").foregroundColor(.black)

                                }
                            }
                            .foregroundColor(Color.white)
                    
                    Button(action:
                                {
                                    //1. Save state
                                    self.neverState = !self.neverState
                                    self.dailyState = false
                                    self.weeklyState = false
                                    print("State : \(self.neverState)")


                            }) {
                                HStack(alignment: .top, spacing: 10) {

                                            //2. Will update according to state
                                       Rectangle()
                                                .fill(self.neverState ? Color.green : Color.red)
                                                .frame(width:20, height:20, alignment: .center)
                                                .cornerRadius(5)

                                    Text("Never").foregroundColor(.black)

                                }
                            }
                            .foregroundColor(Color.white)
                }.padding(.vertical, 10)
                
                
                
            }.padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.top, 25)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            
            
            Button(action: {
                saveHabbit()
            }) {
                Text("SAVE HABIT")
                    .fontWeight(.light)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .foregroundColor(.black)
                    
            }.background(
                LinearGradient(gradient: .init(colors: [.blue, .white]), startPoint: .leading, endPoint: .trailing)
            ).cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 25)
        }
    }
    
    func saveHabbit() {
        //add their habbit to firebase database
        //habitName = name for us
        //currentDate = habbit date
        //setTime = habbit time
        //category = habbit category
        //dailyState = does habbit repeat daily?
    }
    
    func switchOffOthers() {
        if (category.elementsEqual("Academic")) {
            academicSelected = true;
            exerciseSelected = false;
            mornSelected = false;
            nightlySelected = false;
            healthSelected = false;
            covidSelected = false;
        } else if (category.elementsEqual("Exercise")) {
            academicSelected = false;
            exerciseSelected = true;
            mornSelected = false;
            nightlySelected = false;
            healthSelected = false;
            covidSelected = false;
        } else if (category.elementsEqual("Morning Routine")) {
            academicSelected = false;
            exerciseSelected = false;
            mornSelected = true;
            nightlySelected = false;
            healthSelected = false;
            covidSelected = false;
        } else if (category.elementsEqual("Nightly Routine")) {
            academicSelected = false;
            exerciseSelected = false;
            mornSelected = false;
            nightlySelected = true;
            healthSelected = false;
            covidSelected = false;
        } else if (category.elementsEqual("Health")) {
            academicSelected = false;
            exerciseSelected = false;
            mornSelected = false;
            nightlySelected = false;
            healthSelected = true;
            covidSelected = false;
        } else {
            academicSelected = false;
            exerciseSelected = false;
            mornSelected = false;
            nightlySelected = false;
            healthSelected = false;
            covidSelected = true;
        }
    }
}
