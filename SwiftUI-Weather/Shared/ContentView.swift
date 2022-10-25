//
//  ContentView.swift
//  Shared
//
//  Created by Gabriel Stevens on 10/15/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var player = AVPlayer()
    @State private var isLight = false
    
    var body: some View {
       
        ZStack {
            
            BackgroundView(isLight:$isLight)
            
            VStack {
                CityTextView(cityName: "Fuquay-Varina, NC")
                CurrentWeatherView(imageName: isLight ? "tropicalstorm" : "hurricane", temperature: 62)
                VideoPlayer(player:player)
                    .onAppear(){
                        player = AVPlayer(url: URL(string:"https://media.istockphoto.com/id/1337372998/video/2021-hurricane-ida-time-lapse-satellite-imagery.mp4?s=mp4-640x640-is&k=20&c=3JYDIqY1dDMxBMoTMUQrHpjGafWGMNpY-cIFoGznkU8=")!)
                    }
                    
                    
                    .edgesIgnoringSafeArea(.all)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack (alignment: .center, spacing: 32){
                    WeatherDayView(dayOfWeek: "SUN", imageName: "cloud.snow.fill", temperature: 34)
                    WeatherDayView(dayOfWeek: "MON", imageName: "wind.snow", temperature: 18)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "snowflake", temperature: 28)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sleet.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.bolt.fill", temperature: 55)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 61)
                                    
                    }
                }
                
                
                Spacer()
                Button{
                    isLight.toggle()
                } label:{
                    GenericButton(title: isLight ? "Switch To Dark Mode" : "Switch To Light Mode",
                                  textColor:isLight ? .white : .gray,
                                  backgroundColor:isLight ? Color("darkblue") : Color("charcoal"))
                    
                }
                    
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

struct WeatherDayView: View {
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(dayOfWeek)
                .font(.system(size:20, weight:.medium))
                .foregroundColor(Color.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 20, weight:.heavy))
                .foregroundColor(Color.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isLight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[ isLight ? Color("standardblue"):.black,
                                          isLight ? Color("lightblue"):Color("darkblue")]), startPoint: .topTrailing, endPoint: UnitPoint.bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView:View{
    var cityName:String
    var body: some View{
        Text(cityName)
            .font(.system(size:32, weight:.thin, design:.rounded))
            .foregroundColor(Color.white)
            .padding()
        
    }
}

struct CurrentWeatherView: View {
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack(spacing:6){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:160, height: 160)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight:.thin))
                .foregroundColor(Color.white)
            
        }
        .padding(.bottom, 20)
    }
}


