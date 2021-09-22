//
//  LectureDetail.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct EventDetail: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text(event.title)
            Text(event.description)
//            Text(lecture.staff[0])
        }
    }
}
//
//struct EventDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LectureDetail(event: )
//    }
//}
