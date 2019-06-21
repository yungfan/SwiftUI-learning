import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    @State var username:String
    @State var password:String
    
    var body: some View {
        
        VStack {
            
            Text("登录")
                .font(.title)
                .color(.orange)
                .bold()
                .font(.system(.largeTitle))
                .fontWeight(.medium)
                .italic()
                .padding()
            
        Text("你必须同意如下协议你必须同意如下协议你必须同意如下协议你必须同意如下协议你必须同意如下协议你必须同意如下协议")
                .lineLimit(nil)
           
            
            HStack {
                
                Text("用户名:")
                .frame(width:60)
                
                TextField($username, placeholder: Text("请输入用户名"), onEditingChanged: { (changed) in
                    
                    print("onEditingChanged\(changed)")
                    
                }) {
                    print(self.username)
                    //self.endEditing(true)
                }
                
            }
            .padding(10)// 内间距
            .frame(height:50)
            .textFieldStyle(.roundedBorder)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            HStack {
                
                Text("密码:")
                    .frame(width:60)
                
                SecureField($password, placeholder: Text("请输入密码")) {
                    print(self.password)
                    //self.endEditing(true)
                    
                }
                }
                .padding(10)
                .frame(height:50)
                .textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            Button(action: {
                
                print(self.username)
                print(self.password)
                
            }) {
                Text("登录")
            }
        }
        
        
        
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView(username: "", password: ""))
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
