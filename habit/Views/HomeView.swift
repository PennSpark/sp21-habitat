//
//  HomeView.swift
//  habit
//
//  Created by Maggie Yu on 3/18/21.
//  Copyright © 2021 PCL. All rights reserved.
//

/*
 TODO: Follow the Figma design and set up the layout.
 */

//Next tasks to do:
//Move finished tasks to the bottom
//Have unfinished tasks become red if overdue
//Sort tasks in chronological order




/*struct HomeView: View {
    var uid: String
    
    init(uid: String) {
        self.uid = uid
        UITabBar.appearance().backgroundColor = UIColor.init(red: 49/255, green: 139/255, blue: 180/255, alpha: 1)
    }
    var body: some View {
        TabView {
            // home
            HomeTab()
                .tabItem {
                   Image("home")
                }
            // all
            HomeTab()
                .tabItem {
                   Image("all")
                }
            // add habit
            AddHabitView(uid: self.uid, cat: 0)
                .tabItem {
                   Image("add")
                }
            // view category
            Character()
                .tabItem {
                   Image("category")
                }
            // character profile
            CharacterView()
                .tabItem {
                   Image("character")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeTab: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color.init(red: 124/255, green: 168/255, blue: 229/255), Color.init(red: 218/255, green: 220/255, blue: 224/255), Color.white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        
            VStack (spacing: 30) {

                HStack {
                   
                   Text("Settings")
                       .foregroundColor(.black)
                       .font(.system(size: 11))
                       .frame(width: 60, height: 20)
                       .background(Color.white)
                       .cornerRadius(10)
                }


                HStack {
                   Text("+ Add a new habit")
                       .foregroundColor(.black)
                       .frame(width: 180, height: 35)
                       .background(Color.init(red: 114/255, green: 169/255, blue: 145/255))
                       .cornerRadius(20)
                }

                HabitScroll()
                
                //Character
                Image("squirrelBasic")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 300)
                
                Text("PCL")
                   .font(.largeTitle)
            }
            
        }
    }
}

struct Character: View {
    var body: some View {
        LinearGradient(gradient: .init(colors: [.blue, .white, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
    }
}

struct HabitScroll: View {
    
    //1. List of habitModels
    var habitList : [HabitModel] = [.init(id: 0, description: "go for a jog", habitType: "Exercise", time: "9:00 AM"), .init(id: 1, description: "read a book", habitType: "Academic", time: "2:00 PM"), .init(id: 2, description: "Play chess", habitType: "Night Routine", time: "7:30 PM")]
    
    var body: some View {
        VStack {
            HStack {
                Text("TODAY")
                Spacer()
                   .frame(width: 298, height: 10)
            }
            
            /*ScrollView {
                VStack(spacing: 30) {
                   /*ForEach(0..<4) {
                       Text("Habit")
                           .foregroundColor(.white)
                           .font(.largeTitle)
                           .frame(width: 350, height: 65)
                       if ($0 % 2 == 0) {
                           .background(Color.blue)
                       } else {
                           .background(Color.red)
                       }*/
                           
                   ForEach(habitList, id: \.id) { h in
                       let hc = HabitCell(habitItem: h)
                       hc
 
                   }

                }

            }
            .frame(height: 180)*/
        }
        .frame(width: 380, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        .background(Color.white.opacity(0.7))
        .cornerRadius(20)
    }
}

struct HabitModel: Identifiable {
    var id: Int
    //fields
    //Immutable
    let description : String
    let habitType : String
    let time : String
}

struct HabitCell: View {

    var habitItem : HabitModel
    @State var status = false
    
    var body: some View {
        /*let t = HStack {
            Toggle(isOn: $status) {
            }
            .toggleStyle(CheckboxToggleStyle())
            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            //Text fields
            VStack {
                Text(habitItem.description)
                HStack {
                   Text(habitItem.time)
                   Text(habitItem.habitType)
                }
                
//                let t = Text("Habit")
//                    .foregroundColor(.white)
//                    .font(.largeTitle)
//                    .frame(width: 350, height: 65)
//                t.background(Color.green)
                
            }.frame(width: 270, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        if !status {
            t.frame(width: 350, height: 65).background(Color.green)
        } else {
            t.frame(width: 350, height: 65).background(Color.green).opacity(0.5)
        }*/
        EmptyView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(uid: "")
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}



/*func login(_ userToLogIn: String) {
    Alamofire
        .request("\(apiRoot)/v1/users",
            method: .post,
            parameters: ["user" : userToLogIn],
            encoding: JSONEncoding.default)
        .responseJSON { [weak self] response in
            print(response)
            let body = response.value as! NSDictionary
            let authToken = body["authToken"]! as! String
            
            
            self?.user = userToLogIn
            self?.authToken = authToken
            self?.setupFeed()
    }
}*/

/*extension HomeView {
    init(_ h: Home) {
        self = HomeView(
            // a bunch of filler code
            id: h.id.rawValue,
            number: h.number,
            title: h.title,
            synopsis: h.synopsis,
            url: Route.episode(h.id, .view(playPosition: nil)).url,
            small_poster_url: h.posterURL(width: 590, height: 270),
            // ...
        )
    }
}*/*/
 
//
//  HomeView.swift
//  habit
//
//  Created by Maggie Yu on 3/18/21.
//  Copyright © 2021 PCL. All rights reserved.
//
import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseAuth
import FirebaseFirestore
/*
TODO: Follow the Figma design and set up the layout.
*/

//Next tasks to do:
//Move finished tasks to the bottom
//Have unfinished tasks become red if overdue
//Sort tasks in chronological order
struct HomeView: View {
    var uid: String
     
    init(uid: String) {
        self.uid = uid
        // UITabBar.appearance().backgroundColor = UIColor.init(red: 49/255, green: 139/255, blue: 180/255, alpha: 1)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().backgroundColor = UIColor.gray
    }
    var body: some View {
            TabView {
                // home
                HomeTab()
                    .tabItem {
                        VStack {
                            Image("home")
                        }
                    }
                // all
                HomeTab()
                    .tabItem {
                       Image("all")
                    }
                // add habit
                AddHabitView(uid: self.uid, cat: 0)
                    .tabItem {
                       Image("add")
                    }
                // view category
                CharacterView()
                    .tabItem {
                       Image("category")
                    }
                // character profile
                CharacterView()
                    .tabItem {
                       Image("character")
                    }
            }
            .navigationBarBackButtonHidden(true)
        
        
    }
}

struct HomeTab: View {
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: .init(colors: [Color.white, Color.init(red: 218/255, green: 220/255, blue: 224/255), Color.init(red: 124/255, green: 168/255, blue: 229/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
        
            VStack (spacing: 30) {

                HStack {
                   Spacer()
                   Image("settings")
                    Spacer()
                        .frame(width: 20)
                }

                HStack {
                   Spacer()
                   Text("May 8, 2021")
                      .font(.custom("DIN Alternate Bold", size: 30))
                   Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 380)
                        .foregroundColor(.white)
                    HabitScroll()
                }
                
                HStack {
                    //Character
                    Image("squirrelBasic")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 250)
                    
                    Spacer()
                        .frame(width: 40)
                }
                
                
                
                Spacer()
            }
            
        }
    }
}



    struct HabitScroll: View {
     
     //0. hMap
     
     @State var hMap = [
         "120480": [false, 3, "Go for a jog"],
         "113403": [false, 2, "Go for a swim"]
     ]
     
     //1. List of habitModels
     var habitList : [HabitModel] = [.init(id: 0, description: "Go for a jog", habitType: "Exercise", time: "9:00 AM"), .init(id: 1, description: "Read a book", habitType: "Academic", time: "2:00 PM"), .init(id: 2, description: "Play chess", habitType: "Night Routine", time: "5:00 PM"), .init(id: 3, description: "Attend Showcase", habitType: "Health", time: "7:00 PM")
     ]
     var body: some View {
         VStack {
             
             
            ScrollView {
               VStack(spacing: 10) {
                   ForEach(habitList, id: \.id) { h in
                      HabitCell(habitItem: h)
                   }
                }

            }
            .frame(height: 180)
            
            
         }
         .frame(width: 380, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //        .background(Color.white.opacity(0.7))
         .cornerRadius(20)
     }
 }

 struct HabitModel: Identifiable {
     @State var id: Int
     //fields
     //Immutable
     @State var description : String
     @State var habitType : String
     @State var time : String
 }

 struct HabitCell: View {

    var habitItem : HabitModel
    @State var status = false
    /*@State var color =
    init(habitItem: HabitModel) {
        self.habitItem = habitItem
        var color : Color
        // academic
        if (self.habitItem.id == 0) {
            color = Color.init(red: 198/255, green: 153/255, blue: 215/255)
        }
        // exercise
        else if (self.habitItem.id == 1) {
            color = Color.init(red: 241/255, green: 220/255, blue: 205/255)
        }
        // morning
        else if (self.habitItem.id == 2) {
            color = Color.init(red: 236/255, green: 185/255, blue: 110/255)
        }
        // night
        else if (self.habitItem.id == 3) {
            color = Color.init(red: 148/255, green: 182/255, blue: 230/255)
        }
        // health
        else if (self.habitItem.id == 4) {
            color = Color.init(red: 166/255, green: 211/255, blue: 121/255)
        }
        // covid
        else if (self.habitItem.id == 4) {
            color = Color.init(red: 205/255, green: 109/255, blue: 112/255)
        }
    }*/
     
     var body: some View {
        ZStack {
            // academic
            if (self.habitItem.id == 0) {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 65)
                    .foregroundColor(status ? Color.init(red: 198/255, green: 153/255, blue: 215/255, opacity: 0.25) : Color.init(red: 198/255, green: 153/255, blue: 215/255, opacity: 1))
            }
            // exercise
            else if (self.habitItem.id == 1) {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 65)
                    .foregroundColor(status ? Color.init(red: 241/255, green: 220/255, blue: 205/255, opacity: 0.25) : Color.init(red: 241/255, green: 220/255, blue: 205/255, opacity: 1))
            }
            // morning
            else if (self.habitItem.id == 2) {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 65)
                    .foregroundColor(status ? Color.init(red: 236/255, green: 185/255, blue: 110/255, opacity: 0.25) : Color.init(red: 236/255, green: 185/255, blue: 110/255, opacity: 1))
            }
            // night
            else if (self.habitItem.id == 3) {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 65)
                    .foregroundColor(status ? Color.init(red: 148/255, green: 182/255, blue: 230/255, opacity: 0.25) : Color.init(red: 148/255, green: 182/255, blue: 230/255, opacity: 1))
            }
            // health
            else if (self.habitItem.id == 4) {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 65)
                    .foregroundColor(status ? Color.init(red: 166/255, green: 211/255, blue: 121/255, opacity: 0.25) : Color.init(red: 166/255, green: 211/255, blue: 121/255, opacity: 1))
            }
            // covid
            else if (self.habitItem.id == 5) {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 65)
                    .foregroundColor(status ? Color.init(red: 205/255, green: 109/255, blue: 112/255, opacity: 0.25) : Color.init(red: 205/255, green: 109/255, blue: 112/255, opacity: 1))
            }

            
            HStack {
                 Image(systemName: status ? "checkmark.square" : "square")
                              .resizable()
                              .frame(width: 22, height: 22)
                   .onTapGesture { self.status.toggle()
                }
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        Text(habitItem.description)
                            .font(.custom("DIN Alternate Bold", size: 25))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        Text(habitItem.time)
                        Spacer()
                        Text(habitItem.habitType)
                   }
                   
                }.frame(width: 270, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
        
     
         /*let t = HStack {
//             Toggle(isOn: $status) {
//             }
//             .toggleStyle(CheckboxToggleStyle())
//             .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
 //            //Text fields
             VStack {
                 Text(habitItem.description)
                 HStack {
                    Text(habitItem.time)
                    Text(habitItem.habitType)
                 }
                 
             }.frame(width: 270, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
         }
         if !status {
             t.frame(width: 350, height: 65).background(Color.green)
         } else {
             t.frame(width: 350, height: 65).background(Color.blue).opacity(0.5)
         }*/
     }
 }

 struct HomeView_Previews: PreviewProvider {
     static var previews: some View {
        HomeView(uid: "MH2FHTECUdTUquZVHvgh8i2gQlk1")
     }
 }

 struct CheckboxToggleStyle: ToggleStyle {
     func makeBody(configuration: Configuration) -> some View {
         return HStack {
             Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                 .resizable()
                 .frame(width: 22, height: 22)
                 .onTapGesture { configuration.isOn.toggle() }
         }
     }
 }


class HomeViewModel {
    
    @State var uid = "MH2FHTECUdTUquZVHvgh8i2gQlk1"
    
    var habitList = [HabitModel]()
    
    var db = Firestore.firestore()
    
    func fetchData() {
        let userRef = db.collection("users").document(self.uid)
        
        
        userRef.getDocument(source: .cache) { (document, error) in
            if let document = document {
                let hMap = document.get("habitMap")
            } else {
                print("Document does not exist in cache")
            }
        }
        
        //...
    }
}

 //func login(_ userToLogIn: String) {
 //    Alamofire
 //        .request("\(apiRoot)/v1/users",
 //            method: .post,
 //            parameters: ["user" : userToLogIn],
 //            encoding: JSONEncoding.default)
 //        .responseJSON { [weak self] response in
 //            print(response)
 //            let body = response.value as! NSDictionary
 //            let authToken = body["authToken"]! as! String
 //
 //
 //            self?.user = userToLogIn
 //            self?.authToken = authToken
 //            self?.setupFeed()
 //    }
 //}

 //extension HomeView {
 //    init(_ h: Home) {
 //        self = HomeView(
 //            // a bunch of filler code
 //            id: h.id.rawValue,
 //            number: h.number,
 //            title: h.title,
 //            synopsis: h.synopsis,
 //            url: Route.episode(h.id, .view(playPosition: nil)).url,
 //            small_poster_url: h.posterURL(width: 590, height: 270),
 //
 //        )
 //    }
 //}
