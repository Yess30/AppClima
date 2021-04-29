//
//  ClimaModelo.swift
//  ClimaApp
//
//  Created by Mac10 on 29/04/21.
//

import Foundation

struct ClimaModelo {
    let temp: Double
    let ciudad	: String
    let id: Int
    let feels_like: Double
    let humedad: Double
    
    var tempString: String {
        return String(format: "%.1f", temp)
    }
    
    var feelsString: String {
        return String(format: "%.1f", feels_like)
    }
    
    var humedadString: String{
        return String(format: "%.1f", humedad)
    }
    
    
    
    var CondicionClima: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.hail"
        case 500...531:
            return "cloud.sleet"
        case 600...622:
            return "snow"
        case 701...781:
            return "cloud.dust"
        case 800:
            return "cloud.max"
        case 801...804:
            return "cloud.sun"
        default:
            return "cloud"
        }
    }

}
