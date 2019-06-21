//
//  ContentView.swift
//  Text and images
//
//  Created by 杨帆 on 2019/6/21.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    
    static let dateFormat :DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
        
    }()
    
    var dueDate = Date()
    
    var body: some View {
        
        /**
         
         
         VStack{
         
         //行数限制
         Text("Hello World")
         .lineLimit(nil)
         
         //一行显示不下的时候 截断位置
         Text("This is an extremely long string that will never fit even the widest of Phones")
         .truncationMode(.middle)
         
         //字体和对齐方式
         Text("This is an extremely long string that will never fit even the widest of Phones")
         .lineLimit(nil)
         .font(.largeTitle)
         .multilineTextAlignment(.center)
         
         //背景色和字体颜色
         Text("The best laid plans")
         .background(Color.yellow)
         .foregroundColor(Color.red)
         
         //行间距
         Text("This is an extremely long string that will never fit even the widest of Phones")
         .lineLimit(nil)
         .font(.largeTitle)
         .lineSpacing(10)
         //显示日期
         Text("Date: \(dueDate, formatter: Self.dateFormat)")
         
         }
         */
        
        
        
        VStack{
            
            getImage()
            
            //渲染系统图片
            Image(systemName: "cloud.heavyrain.fill")
                //颜色
                .foregroundColor(.red)
                //大小
                .font(.largeTitle)
            
            
            Image("img")
                //调整大小
                .resizable()
                //显示模式
                .aspectRatio(contentMode: .fit)
            
            //设置Gradien
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.green, .red]), startPoint: .leading, endPoint: .trailing), cornerRadius: 4)
            
            //形状
            Rectangle()
                .fill(Color.red)
                .frame(width: 50, height: 50)
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
            
            //形状 图片做背景
            Text("Hacking with Swift")
                .font(.subheadline)
                .background(Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 50))
            
            Text("Hacking with Swift")
                .font(.subheadline)
                .background(
                    Image("img")
                        .resizable()
                        .frame(width: 200, height: 50))
                .clipped()
        }
    }
    
    func getImage() -> Image {
        
        guard let img = UIImage(named: "img") else {
            fatalError("Unable to load image")
        }
        
        return Image(uiImage: img)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
