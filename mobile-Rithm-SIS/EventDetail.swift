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
        
        ScrollView {
            VStack(alignment: .center) {
                Text(event.title)
                    .font(.title)
                
                Divider()
                Text("\(Helper.formatDate(input: event.start_at)) - \(Helper.formatDate(input: event.end_at))")
                    .font(.title3)
                    .foregroundColor(.gray)
                Spacer().frame(height: 60)
                Text(event.description)
                    .font(Font.custom("Source-Serif", size: 20))
                    .font(.title2)
                    .padding(.horizontal, 7.0)
                Spacer().frame(height: 60)
                Text("Staff: ")
                    .font(.title3)
                HStack {
                    ForEach(event.staff, id: \.self) { staffLink in
                        CircleImage(image: Image( staffLink.components(separatedBy: "/")[5])
                        )
                            .padding(10)
                    }
                }
            }
        }
        
        
    }
}
//
//struct EventDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LectureDetail(event: )
//    }
//}
