//
//  ContentView.swift
//  View02-LocationButton
//
//  Created by 杨帆 on 2021/10/8.
//

import CoreLocationUI
import MapKit
import SwiftUI

class ObservableLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.91667, longitude: 116.41667), latitudinalMeters: 500, longitudinalMeters: 500)
    
    override init() {
        super.init()
        
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }

        region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

struct ContentView: View {
    @StateObject var manager = ObservableLocationManager()

    var body: some View {
        ZStack {
            Map(coordinateRegion: $manager.region)

            LocationButton(.currentLocation) {
                manager.requestLocation()
            }
            .foregroundColor(.white)
            .cornerRadius(10)
            .labelStyle(.iconOnly)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
