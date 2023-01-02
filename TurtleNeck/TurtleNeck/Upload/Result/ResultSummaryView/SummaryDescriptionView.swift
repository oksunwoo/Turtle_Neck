//
//  SummaryDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct SummaryDescriptionView: View {
    let summary: Result
    
    var body: some View {
        VStack (spacing: 10){
            HStack {
                Text("Date")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text(Date(), style: .date)
                    .foregroundColor(Color("DeepBlue"))
                    .bold()
            }
            
            HStack {
                Text("Data Validity")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text(summary.shortDescription)
                    .foregroundColor(Color("DeepBlue"))
                    .bold()
            }
          
            HStack {
                Text("Provided by")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("Turtle Neck")
                    .foregroundColor(Color("DeepBlue"))
                    .bold()
            }
        }
        .font(.footnote)
        .padding()
    }
}

struct SummaryDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryDescriptionView(summary: .veryGood)
    }
}
