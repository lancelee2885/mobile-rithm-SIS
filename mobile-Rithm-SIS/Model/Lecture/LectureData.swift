
import SwiftUI
import Alamofire

struct LectureResponse: Codable, Identifiable {
    let id = UUID()
    var results: Array<LectureInstance>
}

struct LectureInstance: Codable, Identifiable {
    let id = UUID()
    var title : String
    var api_url : String
}

struct Lecture: Codable, Identifiable {
    
    let id = UUID()
    var title: String
    var description: String
    var staff: [String]
    var start_at: String
    var end_at: String
    var asset_set: [String]
    
}

class LectureApi: ObservableObject {
    @Published var lectureSessions = [LectureInstance]()
    @Published var lectureLinks = [String]()
    @Published var lectures = [Lecture]()
    
    
    init () {
        guard let url = URL(string: "https://r22.students.rithmschool.com/api/lecturesessions/") else { return }
        
        AF.request(url, headers: [
            "Authorization": "Token Hidden",
            "Accept": "application/json"
        ]).responseJSON { response in
            guard let data = response.data else {return}
            do {
                let _lectureList = try JSONDecoder().decode(LectureResponse.self, from: data)
                self.lectureSessions = _lectureList.results.shuffled()
                
                for n in 1...5 {
                    self.lectureLinks.append(self.lectureSessions[n].api_url)
                }
            } catch {
                print("ERROR")
            }
            
            for link in self.lectureLinks {
                AF.request("https" + link.dropFirst(4), headers: [
                            "Authorization": "Token Hidden",
                            "Accept": "application/json"
                        ]).responseJSON { response in
                            guard let data = response.data else {return}
                            do {
                                let _lecture = try JSONDecoder().decode(Lecture.self, from: data)
                                self.lectures.append(_lecture)
                                print(_lecture.title)
                            } catch {
                                print("ERROR")
                            }
                }
            }
        }
        
        
        
    }
}
