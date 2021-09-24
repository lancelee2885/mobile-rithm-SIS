//
//  EventData.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI
import Alamofire

struct EventResponse: Codable, Identifiable {
    let id = UUID()
    var results: Array<EventInstance>
}

struct EventInstance: Codable, Identifiable {
    let id = UUID()
    var title : String
    var api_url : String
}

struct Event: Codable, Identifiable {
    
    let id = UUID()
    var title: String
    var description: String
    var staff: [String]
    var start_at: String
    var end_at: String
    var asset_set: [String]
    
}

class EventApi: ObservableObject {
    @Published var eventSessions = [EventInstance]()
    @Published var eventLinks = [String]()
    @Published var events = [Event]()
    
    
    init () {
        guard let url = URL(string: "https://r22.students.rithmschool.com/api/events/") else { return }
        
        AF.request(url, headers: [
            "Authorization": "Token 5fb3d95a5a1980f112918e03be474e70da961175",
            "Accept": "application/json"
        ]).responseJSON { response in
            guard let data = response.data else {return}
            do {
                let _eventList = try JSONDecoder().decode(EventResponse.self, from: data)
                self.eventSessions = _eventList.results.shuffled()
                
                for n in 1...5 {
                    self.eventLinks.append(self.eventSessions[n].api_url)
                }
            } catch {
                print("ERROR")
            }
            
            for link in self.eventLinks {
                AF.request("https" + link.dropFirst(4), headers: [
                            "Authorization": "Token 5fb3d95a5a1980f112918e03be474e70da961175",
                            "Accept": "application/json"
                        ]).responseJSON { response in
                            guard let data = response.data else {return}
                            do {
                                let _event = try JSONDecoder().decode(Event.self, from: data)
                                self.events.append(_event)
                                print(_event.title)
                            } catch {
                                print("ERROR")
                            }
                }
            }
        }
    }
}
