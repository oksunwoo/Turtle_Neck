//
//  ResultDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/30.
//

import SwiftUI

struct ResultDescriptionView: View {
    let kilogram: Int
    let degree: Int
    let grade: Grade
    
    var body: some View {
        VStack (spacing: 10){
            HStack {
                Text("Date")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text(Date(), style: .date)
                    .foregroundColor(.deepBlue)
                    .bold()
            }
//            HStack {
//                Text("Grade")
//                    .foregroundColor(Color(.systemGray4))
//                Spacer()
//                Text("\(grade.rawValue)")
//                    .foregroundColor(.deepBlue)
//                    .bold()
//            }
            HStack {
                Text("Degree")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("\(String(Int(degree)))º")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
            HStack {
                Text("Pressure")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("\(kilogram)")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
            HStack {
                Text("Provided by")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("Turtle Neck")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
        }
        .font(.footnote)
        .padding()
    }
}

struct ResultDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDescriptionView(kilogram: 50, degree: 30, grade: .veryGood)
    }
}
