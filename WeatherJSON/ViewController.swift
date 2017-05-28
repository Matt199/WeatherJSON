//
//  ViewController.swift
//  WeatherJSON
//
//  Created by Mateusz Kopacz on 28.05.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial struct
        
        print("Begining....")
        Weather.forecastWeather(location: "54.0924200,18.7778700") { (results:[Weather]) in
            
            for res in results {
                
                    print("\(res) \n\n")
            
            }
            
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

