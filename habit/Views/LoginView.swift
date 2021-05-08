//
//  LoginView.swift
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
//import Firebase
/*
 TODO:
 - Set up the Google account and link Firestore to the project
 - have a working Login Authorization. https://benmcmahen.com/authentication-with-swiftui-and-firebase/ might be a good resource?
 - Implement LoginView based on Figma
 */

struct LoginView: View {
    @State private var userCreated = true
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: .init(colors: [Color.init(red: 124/255, green: 168/255, blue: 229/255), Color.init(red: 218/255, green: 220/255, blue: 224/255), Color.init(red: 247/255, green: 119/255, blue: 149/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                if UIScreen.main.bounds.height > 800 {
                    Home()
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        Home()
                    })
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct Home: View {
    @State var index = 0
    @State var userCreated = true
    
    var body: some View {
        VStack {
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Button(action: {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                        self.index = 0
                    }
                    
                    
                }, label: {
                    Text("Log in")
                        .foregroundColor(self.index == 0 ? .white : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }).background(self.index == 0 ? Color.init(red: 25/255, green: 71/255, blue: 129/255) : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                        self.index = 1
                    }
                    
                }, label: {
                    Text("Sign Up")
                        .foregroundColor(self.index == 1 ? .white : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }).background(self.index == 1 ? Color.init(red: 25/255, green: 71/255, blue: 129/255) : Color.clear)
                .clipShape(Capsule())
            }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            
            if self.index == 0 {
                Login()
                Spacer()
                    .frame(height: 10)
                
                Button(action: {
                    
                }){
                    Text("Forgot Password?")
                        .foregroundColor(.white)
                }
            } else {
                SignUp()
            }
            
            Spacer()
                .frame(height: 30)
            
        }.padding()
    }
}

struct Login: View {
    @State var email = ""
    @State var password = ""
    @State var uid = ""
    @State private var visible = false
    
    @State private var transition = false
    @State private var loginError = false
    
    var body: some View {
        VStack {
            VStack {
                HStack (spacing: 7.5) {
                    Image(systemName: "envelope")
                        .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    TextField("Enter Email Address", text: $email)
                        .autocapitalization(.none)
                }.padding(.bottom, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    if self.visible {
                        TextField("Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                       
                    } else {
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                        
                    }
                    Button(action: {
                        self.visible.toggle()
                    }) {
                        Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                            .padding(.horizontal)
                            .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    }
                   
                }.padding(.vertical, 20)
            }.padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Color.white)
            .cornerRadius(10)
            
            Spacer()
                .frame(height: 20)
            
            Button(action: {
                Auth.auth().signIn(withEmail: self.email.trimmingCharacters(in: .whitespacesAndNewlines), password: self.password.trimmingCharacters(in: .whitespacesAndNewlines)) {
                    (result, error) in
                    if error != nil {
                        self.loginError = true
                    } else {
                        self.uid = result?.user.uid ?? "Error"
                        self.transition = true
                    }
                }
                self.email = ""
                self.password = ""
            }) {
                Text("LOG IN")
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .foregroundColor(.white)
                NavigationLink(destination: HomeView(uid: self.uid), isActive: $transition) {
                    EmptyView()
                }
                    
            }.background(
                Color.init(red: 25/255, green: 71/255, blue: 129/255)
            ).cornerRadius(25)
        }
    }
}

struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State private var repassword = ""
    @State var uid = ""
    
    //Error alert
    @State private var alertText = ""
    @State private var alertMessage = ""
    @State private var alertDismiss = ""
    @State private var showAlert = false
    
    @State private var userCreated = false
    @State private var passwordVisible = false
    @State private var repasswordVisible = false
    
    @State private var transition: Int? = 0
    
    var body: some View {
        VStack {
            VStack {
                //Transitions
                
                HStack (spacing: 10) {
                    Image(systemName: "envelope")
                        .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    TextField("Enter Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }.padding(.bottom, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    if self.passwordVisible {
                        TextField("Enter Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                       
                    } else {
                        SecureField("Enter Password", text: $password)
                            .autocapitalization(.none)
                        
                    }
                    Button(action: {
                        self.passwordVisible.toggle()
                    }) {
                        Image(systemName: self.passwordVisible ? "eye.slash.fill" : "eye.fill")
                            .padding(.horizontal)
                            .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    }
                   
                }.padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    if self.repasswordVisible {
                        TextField("Re-enter Password", text: $repassword)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                       
                    } else {
                        SecureField("Re-enter Password", text: $repassword)
                            .autocapitalization(.none)
                        
                    }
                    Button(action: {
                        self.repasswordVisible.toggle()
                    }) {
                        Image(systemName: self.repasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .padding(.horizontal)
                            .foregroundColor(Color.init(red: 25/255, green: 71/255, blue: 129/255))
                    }
                   
                }.padding(.vertical, 20)
            }.padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Color.white)
            .cornerRadius(10)
            
            Spacer()
            .frame(height: 20)
            
            Button(action: {
                //Validate entries
                let s = self.validate()
                
                //Return error if entries are not valid
                if (s != nil) {
                    self.alertText = "Error"
                    self.alertMessage = s ?? "Error"
                    self.alertDismiss = "Try Again"
                    self.showAlert = true
                } else {
                    //Create user
                    Auth.auth().createUser(withEmail: self.email.trimmingCharacters(in: .whitespacesAndNewlines), password: self.password.trimmingCharacters(in: .whitespacesAndNewlines)) { (result, error) in
                        
                        //Return error if user cannot be created
                        if let error = error {
                            self.alertText = "Error"
                            self.alertMessage = error.localizedDescription
                            self.alertDismiss = "Try Again"
                            self.showAlert = true
                        } else {
                            
                            //Add first and last name to database
                            let db = Firestore.firestore()
                            
                            db.collection("users").document(result!.user.uid).setData(["uid": result!.user.uid, "email": self.email]) { (error) in
                                
                                
                                //Return error if data could not be entered
                                if let error = error {
                                    self.alertText = "Error"
                                    self.alertMessage = error.localizedDescription
                                    self.alertDismiss = "Try Again"
                                    self.showAlert = true
                                    
                                } else {
                                    self.uid = result?.user.uid ?? "Error"
                                    self.userCreated = true;
                                }
                            }
                        }
                    }
                }
            }) {
                Text("CREATE ACCOUNT")
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .foregroundColor(.white)
                NavigationLink(destination: IntroView(uid: uid), isActive: $userCreated) {
                    EmptyView()
                }
                    
            }.background(
                Color.init(red: 25/255, green: 71/255, blue: 129/255)
            ).cornerRadius(25)
        }
        //Error alert
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertText), message: Text(alertMessage), dismissButton: Alert.Button.default(Text(alertDismiss), action: {
                
            }))
        }
    }
    
    
    //Validate user data entries
    func validate() -> String? {
        let e = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let pw = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let rpw = repassword.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (e == "" || pw == "") {
            return "please fill in all data"
        }
        else if (pw != rpw) {
            return "Passwords do not match"
        }
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        if (!passwordTest.evaluate(with: pw)) {
            return "Please Enter a valid password. A valid password has 8 characters, at least 1 lowercase letter, and at least one special character ($@$#!%?&)"
        }
        return nil
    }
}
