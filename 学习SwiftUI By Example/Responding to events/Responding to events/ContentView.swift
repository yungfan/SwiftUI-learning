//
//  ContentView.swift
//  Responding to events
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

/**

struct ContentView : View {
    var body: some View {
 
    }
}
 */

/**
 
//Toggle
struct ContentView : View {
    
    @State var showGreeting = true
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $showGreeting) {
                Text("Show welcome message")
            }.padding()
            
            if showGreeting {
                Text("Hello World!")
            }
        }
        
        
    }
}
*/

/**
 
//Button
struct ContentView : View {
    
    @State var showDetails = false
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                
                self.showDetails.toggle()
                
            }) {
                Text("Show details")
            }
            
            if showDetails {
                
                Text("Hello World!")
                    .font(.largeTitle)
                    .lineLimit(nil)
            }
        }
        
        
    }
}
*/

/**
//TextField
struct ContentView : View {
    
    @State private var emailAddress = ""
    @State private var password = ""
    
    var body: some View {
        
        VStack {
            
            TextField($emailAddress, placeholder: Text("请输入Email"))
                .textFieldStyle(.roundedBorder)
                .padding()
            SecureField($password, placeholder: Text("请输入密码"))
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Text("Email: \(emailAddress)")
            Text("password: \(password)")
        }
        
        
    }
}
 */

/**

//Slider
struct ContentView : View {
    @State var celsius: Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $celsius, from: 0, through: 100, by: 1)
            Text("\(celsius)")
        }
    }
}
 */

/**

//DatePicker
struct ContentView : View {

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }

    @State var birthDate = Date()

    var body: some View {
        VStack {

            DatePicker($birthDate, maximumDate: Date(), displayedComponents: .date)


            Text("\(birthDate, formatter: dateFormatter)")
        }
    }
}
 */

/**

//SegmentedControl
struct ContentView : View {
    @State private var favoriteColor = 0
    var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        VStack {
            SegmentedControl(selection: $favoriteColor) {
                ForEach(0..<colors.count) { index in
                    Text(self.colors[index])
                }
            }
            
            Text("Value: \(colors[favoriteColor])")
        }
    }
}
 */

/**
 
//单双击手势
struct ContentView : View {
    var body: some View {
        
        VStack {
            //单击
            Text("Tap me!")
                .tapAction {
                    print("Tapped!")
            }
            
            //双击
            Image("img")
                .tapAction(count: 2) {
                    print("Double tapped!")
            }
        }
    }
}
*/

/**

//其他手势
struct ContentView : View {
    var body: some View {
        
        VStack {
            
            Image("img")
                .gesture(
                    
                    LongPressGesture(minimumDuration: 2)
                        .onEnded { _ in
                            
                            print("LongPressGesture!")
                    }
                    
            )
        }
    }
}
 */
//lifecycle
struct ContentView : View {
    var body: some View {
        
        VStack {
            
            Image("img")
                .onAppear{
                      print("appeared!")
            }
                .onDisappear{
                      print("disAppeared!")
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
