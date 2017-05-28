//
//  Weather.swift
//  WeatherJSON
//
//  Created by Mateusz Kopacz on 28.05.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import Foundation

struct Weather {
    
    let summary: String
    let icon: String
    let pressure: Double
    let temperature: Double
    
    
    enum SerializationError: Error {
        case missing(String)
    }
   
    
    // In case of wrong serialization throw an Serializaition error
    init(json:[String:Any]) throws {
    
        
        
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("Summary is Missing")}
    
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("Icon is missing")}

        guard let pressure = json["pressure"] as? Double else {throw SerializationError.missing("pressure is missing")}
        
        guard let temperature = json["temperature"] as? Double else {throw SerializationError.missing("Temperature is missing")}
        
        
        
        self.summary = summary
        self.icon = icon
        self.pressure = pressure
        self.temperature = temperature
        
    }
    
    
    static let apiBaseAdress = "https://api.darksky.net/forecast/d8d214e6919786840cff195857c3ad78/"
    
    
    // need to check @escaping
    static func forecastWeather(location: String, completion: @escaping ([Weather]) -> ()) {
    
        let url = apiBaseAdress + location
        let reguest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: reguest) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var weatherArray: [Weather] = []
            
            if let data = data {
            
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                        if let dailyForecast = json["daily"] as? [String:Any] {
                        
                            // Double squareBracket!!!!
                            
                            if let dailyData = dailyForecast["data"] as? [[String:Any]] {
                            
                                for dataInJson in dailyData {
                                
                                    if let weatherData = try? Weather(json: dataInJson) {
                                    
                                        weatherArray.append(weatherData)
                                    
                                    }
                                    
                                
                                }
                            
                            }
                        
                        }
                        
                    
                    }
                
                
                } catch {
                
                    
                        print(error)
                
                
                }
            
                
                        completion(weatherArray)
            
            
            }
            
            
            
        }
        
    task.resume()
    
    }
    
    
    
}

