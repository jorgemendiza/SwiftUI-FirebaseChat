//
//  ContentView.swift
//  FirebaseRealTimeChatDemo
//
//  Created by Jorge Mendizabal on 25/10/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var isloginMode = false
    @State var email = ""
    @State var password = ""
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack {
                    Picker(selection: $isloginMode, label: Text("Picker"), content: {
                        Text("Login").tag(true)
                        Text("Create Account").tag(false)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if !isloginMode {
                        Button(action: {
                            handleAction()
                        }, label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 65))
                                .padding()
                        })
                    }
                    
                    
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text(isloginMode ? "Log In" : "Create Account")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .padding(.vertical)
                            Spacer()
                        }
                        .background(Color.blue)
                    })
                }.padding()
                
                
            }
            .navigationTitle(isloginMode ? "Login" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                            .ignoresSafeArea())
        }
    }
    
    func handleAction() {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
