//
//  ContentView.swift
//  Alerts and action sheets
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

/**

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}
 */
/**

//Alert
struct ContentView : View {
    //要显示，需要定义某种可绑定条件，以确定警报是否应该可见
    @State var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Show Alert")
            }
            .presentation($showingAlert) {
                Alert(title: Text("Important message"), message: Text("Wear sunscreen"), primaryButton: .destructive(Text("Delete")) {
                    print("Deleting...")
                    }, secondaryButton: .cancel())
        }
    }
}
 */

struct ContentView : View {
    //要显示，需要定义某种可绑定条件，以确定警报是否应该可见
    @State var showingSheet = false
    
    var sheet: ActionSheet {
        ActionSheet(title: Text("温馨提示"), message: Text("取相片"), buttons: [
            .cancel(),
            .default(Text("相机"), onTrigger: {
            self.showingSheet = false
        }),
            .default(Text("相册"), onTrigger: {
            self.showingSheet = false
        })])
    }
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Show ActionSheet")
            }
            .presentation(showingSheet ? sheet : nil)
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
