//
//  ContentView.swift
//  06 View
//
//  Created by 杨帆 on 2020/9/19.
//

import SwiftUI
import MapKit
import AVKit

struct Annotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.2906511800, longitude: 118.3623587000), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let annotations = [Annotation(coordinate: .init(latitude: 31.2926511800, longitude: 118.3623587000)),
                    Annotation(coordinate: .init(latitude: 31.2886511800, longitude: 118.3623587000)),
                    Annotation(coordinate: .init(latitude: 31.2906511800, longitude: 118.3623587000))]
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $region, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: annotations) {annotation in
                MapMarker(coordinate: annotation.coordinate)
            }
            
            Button("缩放") {
                region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            }
            
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "test", withExtension: "mp4")!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
