//
//  JSONDecoder.swift
//  Show Score
//
//  Created by Felipe Duarte on 15/01/25.
//

import Foundation


//Explicación: Estamos creando una función que nos decodifique el modelo que mapeamos del JSON devuelto por una llamada a red que nosotros especifiquemos. Para esto, vamos a pasarle como argumento una URLRequestde la URL que necesitamos y de otros elementos como los headers que requiere la petición para funcionar (por ejemplo API Key). El otro argumento que vamos a pasar es el modelo que queremos que nos retorne. Por ejemplo en la petición de pelìculas, el retorno es el array de películas.

//usamos un genérico que llamaremos JSON. Este se usará con el fin de dejar como "comodín" qué modelo es el que queremos decodificar.
func getModelFromJSON<MODEL>(request: URLRequest, type: MODEL.Type) async throws -> MODEL where MODEL: Decodable {
    let (data, response) = try await URLSession.shared.getData(for: request)
    let decoder = JSONDecoder()
    
    print("Llamada de red")
    
    if response.statusCode == 200 {
        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw NetworkError.decodingJSON(error)
        }
    } else {
        throw NetworkError.statusCode(response.statusCode)
    }
}
