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
        
        Weather.forecastWeather { (results:[Weather]) in
            
            print("Begining....")
            
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

