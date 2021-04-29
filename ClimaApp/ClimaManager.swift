//
//  ClimaManager.swift
//  ClimaApp
//
//  Created by Mac17 on 21/04/21.
//

import Foundation

protocol ClimaManagerDelegado {
    func actualizarClima(clima:ClimaModelo)
}


struct ClimaManager {
    let  climaURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&lang=es&appid=43c02b88939bc65afefdef7ff3b31822"
    var delegado: ClimaManagerDelegado?
    
    
    func buscarClima(ciudad: String){
        let UrlString = "\(climaURL)&q=\(ciudad)"
        
        realizarSolicitud(urlString: UrlString)
    }
    
    func realizarSolicitud(urlString:String){
        //1
        if let url = URL(string: urlString){
            //2 crear una url session
            let session = URLSession(configuration: .default)
            //3
            let tarea = session.dataTask(with: url) { (datos, respuesta, error) in
                if error != nil{
                    print("Error al Obtener los Datos: \(error!)")
                    return
                }
                
                if let datosSeguros = datos {
                    if let ObjClima = self.parsearJSON(datosClima:datosSeguros){
                        self.delegado?.actualizarClima(clima:ObjClima)
                    
                    }
                }
            }
            
            tarea.resume()
        }
    }
    
    func parsearJSON(datosClima:Data) -> ClimaModelo?{
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados = try decodificador.decode(ClimaDatos.self, from: datosClima)
            
            let name:String = datosDecodificados.name
            let temp:Double = datosDecodificados.main.temp
            let id:Int = datosDecodificados.weather[0].id;
            let feels:Double = datosDecodificados.main.feels_like
            let humedad:Double = datosDecodificados.main.humidity
            
            let ObjClimaModelo = ClimaModelo(temp: temp, ciudad: name, id: id, feels_like: feels, humedad: humedad)
            
            print(ObjClimaModelo.CondicionClima)
            return ObjClimaModelo
            
            
        }catch{
            print(error.localizedDescription)
            return nil
            
        }
        
        
    }
    
   
    
    
    
    
    
}
