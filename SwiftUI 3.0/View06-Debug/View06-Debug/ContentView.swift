//
//  ContentView.swift
//  View06-Debug
//
//  Created by 杨帆 on 2021/10/9.
//

import SwiftUI

class TestDebug: ObservableObject {
    @Published var count  = 0
    
    var timer: Timer!
    
    init() {
        timer = Timer(timeInterval: 3, repeats: true, block: { _ in
            self.count += 1
        })
        
        RunLoop.current.add(timer, forMode: .common)
    }
}

struct ContentView: View {
    @ObservedObject var debug = TestDebug()
    
    var body: some View {
        Self._printChanges()
        
        return Text("发生了\(debug.count)次变化")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
