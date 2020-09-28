//
//  ContentView.swift
//  SwiftUI41
//
//  Created by 杨帆 on 2019/10/22.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct Map: UIViewRepresentable {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    func setupManager(){
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<Map>) -> MKMapView {
        
        self.setupManager()
        
        let map = MKMapView(frame: UIScreen.main.bounds)
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        
        
        return map
    }
    
    func updateUIView(_ uiView: Map.UIViewType, context: UIViewRepresentableContext<Map>) {
        
    }
    
}



struct ContentView: View {
    var body: some View {
        
        Map()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
