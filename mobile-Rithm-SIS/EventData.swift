//
//  EventData.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct EventList: Codable, Identifiable {
    let id = UUID()
    var results: Array<EventInstance>
}

struct EventInstance: Codable, Identifiable {
    let id = UUID()
    var title : String
    var api_url : String
}

class EventApi {
    func getEvents(completion: @escaping (EventList) -> ()) {
        guard let url = URL(string: "https://r22.students.rithmschool.com/api/events/") else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token 5fb3d95a5a1980f112918e03be474e70da961175"
                         , forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            let events = try! JSONDecoder().decode(EventList.self, from: data!)

            DispatchQueue.main.async {
                completion(events)
            }
        }
        .resume()
    }
}
