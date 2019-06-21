//
//  ContentView.swift
//  List
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

//静态
struct RestaurantRow : View {
    
    var name:String
    
    var body: some View {
        
        Text("Restaurant: \(name)")
        
    }
    
}

struct ContentView: View {
    var body: some View {
        
        List {
            
            //带Section
            Section(header: Text("Restaurants")) {
                
                RestaurantRow(name: "A")
                RestaurantRow(name: "B")
                RestaurantRow(name: "C")
                
            }
           
        }
        
    }
}
 */

/**

//动态
//Model
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}
//Row
struct RestaurantRow: View {
    var restaurant: Restaurant
    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

struct ContentView: View {
    
    var body: some View {
        
        let first = Restaurant(name: "Joe's Original")
        let second = Restaurant(name: "The Real Joe's Original")
        let third = Restaurant(name: "Original Joe's")
        let restaurants = [first, second, third]
        
        return List(restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
        
    }
}
 */

/**

//删除
struct ContentView : View {
    @State var users = ["Paul", "Taylor", "Adele"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.identified(by: \.self)) { user in
                    Text(user)
                    }
                    .onDelete(perform: delete(at:))
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            users.remove(at: first)
        }
    }
}
 */

/**

//移动
struct ContentView : View {
    @State var users = ["Paul", "Taylor", "Adele"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.identified(by: \.self)) { user in
                    Text(user)
                    }
                    .onMove(perform: move(from:to:))
                }
                //可以通过EditButton开启编辑功能
                .navigationBarItems(trailing: EditButton())
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        // sort the indexes low to high
        let reversedSource = source.sorted()
        
        // then loop from the back to avoid reordering problems
        for index in reversedSource.reversed() {
            // for each item, remove it and insert it at the destination
            users.insert(users.remove(at: index), at: destination)
        }
    }
}
 */

/**

//分组
struct RestaurantRow : View {
    
    var name:String
    
    var body: some View {
        
        Text("Restaurant: \(name)")
        
    }
    
}

struct ContentView: View {
    var body: some View {
        
        List {
            
            //带Section
            Section(header: Text("Restaurants")) {
                
                RestaurantRow(name: "A")
                RestaurantRow(name: "B")
                RestaurantRow(name: "C")
                
            }
            
        }.listStyle(.grouped)
        
    }
}
 */

//多个元素
struct User: Identifiable {
    var id = UUID()
    var username = "Anonymous"
}

struct ContentView : View {
    let users = [User(), User(), User()]
    //它创建一个隐式的HStack来存放View，所以默认是水平摆放
    var body: some View {
        List(users) { user in
            Image("img")
                .resizable()
                .frame(width: 40, height: 40)
            Text(user.username)
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
