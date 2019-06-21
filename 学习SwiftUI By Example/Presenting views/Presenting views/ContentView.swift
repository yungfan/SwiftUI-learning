//
//  ContentView.swift
//  Presenting views
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

/**
//导航跳转
struct DetailView: View {
    var body: some View {
        Text("Detail")
    }
}

struct ContentView : View {
    var body: some View {
        NavigationView {
            NavigationButton(destination: DetailView()) {
                Text("Click")
                }.navigationBarTitle(Text("Navigation"))
        }
    }
}
 */

/**
 
//List Row跳转
//构造List
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}

struct RestaurantRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        Text(restaurant.name)
    }
}

struct ContentView: View {
    var body: some View {
        let first = Restaurant(name: "Joe's Original")
        let restaurants = [first]
        
        return NavigationView {
            List(restaurants) { restaurant in
                
                NavigationButton(destination: RestaurantView(restaurant: restaurant)) {
                    RestaurantRow(restaurant: restaurant)
                }
                
                }.navigationBarTitle(Text("Select a restaurant"))
        }
    }
}

//跳转的界面
struct RestaurantView: View {
    var restaurant: Restaurant
    
    var body: some View {
        Text("Come and eat at \(restaurant.name)")
            .font(.largeTitle)
            .lineLimit(nil)
    }
}

 */

//PresentationButton
struct DetailView: View {
    var body: some View {
        Text("Detail")
    }
}

struct ContentView : View {
    var body: some View {

        PresentationButton(destination: DetailView()) {
            Text("Click to show")
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
