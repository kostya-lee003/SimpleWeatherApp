//
//  ContentView.swift
//  SimpleWeatherApp
//
//  Created by Kostya Lee on 09/02/22.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @ObservedObject var wmodel = WeatherViewModel()
    @ObservedObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(UIColor(named: "backgroundColorsAtTop")!),
                Color(UIColor(named: "backgroundColorsAtBottom")!)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text(self.wmodel.city)
                    .padding()
                    .font(Font.custom("Rubik-Light", size: 40))
                Text(self.wmodel.temp)
                    .padding()
                    .font(Font.custom("Rubik-Light", size: 70))

                HStack {
                    Label(self.wmodel.weatherType, systemImage: "sun.max.fill")
                        .padding()
                        .font(Font.custom("Rubik-Light", size: 35))
                        .labelStyle(CustomLabelStyle())
                }
            }
            
                .foregroundColor(Color(UIColor(named: "LabelTextColor")!))
            

            VStack() {
                Spacer()
                HStack {
                    Spacer()
                    HStack {
                        Button() {
                            contentViewModel.requestAllowOnceLocation()
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color(uiColor: UIColor(named: "LocationButtonColor")!))
                                    .scaleEffect(1.8)
                                Image(uiImage: UIImage(named: "locationIcon")!)
                                    .resizable()
                                    .foregroundColor(Color(uiColor: UIColor(named: "LocationButtonIconColor")!))
                            }
                        }
                        .frame(width: 50, height: 50, alignment: .center)
                            .tint(.purple)
                    }
                    .padding(.init(top: 0, leading: 0, bottom: 40, trailing: 55))
                }
            }
            VStack {
                SearchBar(text: $contentViewModel.query)
                Text(contentViewModel.query)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
            
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var query: String = ""
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    let locationManager = CLLocationManager()
}

extension ContentViewModel {
    func requestAllowOnceLocation() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        
        print("locations = \(latestLocation.coordinate.latitude) \(latestLocation.coordinate.longitude)")

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
