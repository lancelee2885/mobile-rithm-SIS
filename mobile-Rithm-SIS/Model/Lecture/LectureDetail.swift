//
//  LectureDetail.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct LectureDetail: View {
    var lecture: Lecture
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(lecture.title)
                    .font(.title)
                
                Divider()
                Text("\(Helper.formatDate(input: lecture.start_at)) - \(Helper.formatDate(input: lecture.end_at))")
                    .font(.title3)
                    .foregroundColor(.gray)
                Spacer().frame(height: 60)
                Text(lecture.description)
                    .font(.title2)
                    .padding(.horizontal, 30.0)
                Spacer().frame(height: 60)
                Text("Staff: ")
                    .font(.title3)
                HStack {
                    ForEach(lecture.staff, id: \.self) { staffLink in
                        CircleImage(image: Image( staffLink.components(separatedBy: "/")[5])
                        )
                            .padding(10)
                    }
                }
            }
        }
    }
}

struct LectureDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        LectureDetail(lecture: lectureExample)
    }
    
}
