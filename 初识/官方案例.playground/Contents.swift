import SwiftUI
import PlaygroundSupport
import MapKit


struct MapView : UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 31.29065118, longitude: 118.3623587)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct ContentView : View {
    
    var body: some View {
    
        VStack {
            MapView()
                .frame(height: 300)
            VStack(alignment: .leading) {
                Text("XX学院")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("安徽省芜湖市弋江区")
                        .font(.subheadline)
                    Spacer()
                    Text("文昌西路24号")
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

// 创建UIHostingController
let vc = UIHostingController(rootView: ContentView())
// UIHostingController赋值给liveView
PlaygroundPage.current.liveView = vc
