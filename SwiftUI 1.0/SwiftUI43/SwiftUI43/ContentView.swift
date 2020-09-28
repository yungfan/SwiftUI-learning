//
//  ContentView.swift
//  SwiftUI43
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI

struct SegementControl: UIViewRepresentable {
    
    @Binding var selectedItem: Int
    
    func makeUIView(context: UIViewRepresentableContext<SegementControl>) -> UISegmentedControl {
        
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "红", at: 1, animated: true)
        segment.insertSegment(withTitle: "黄", at: 2, animated: true)
        segment.insertSegment(withTitle: "绿", at: 3, animated: true)
        
        segment.addTarget(context.coordinator, action: #selector(Coordinator.updateSelectedIndex(sender:)), for: .valueChanged)
        
        return segment
        
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: UIViewRepresentableContext<SegementControl>) {
        
        uiView.selectedSegmentIndex = selectedItem
        
    }
    
    func makeCoordinator() -> Coordinator {
        
        Coordinator(segment: self)
        
    }
    
    
    class Coordinator: NSObject {
        
        var segment:SegementControl
        
        init(segment: SegementControl) {

            self.segment = segment
            
        }
        
        @objc func updateSelectedIndex(sender: UISegmentedControl){
            
            self.segment.selectedItem = sender.selectedSegmentIndex
        }
        
    }
    
}

struct ContentView: View {
    
    @State var selectedItem: Int = 1
    var body: some View {
        
        
        
        VStack{
            
            SegementControl(selectedItem: $selectedItem)
            Text("你选中的为:\(selectedItem)")
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
