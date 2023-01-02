//
//  ResultDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/30.
//

import SwiftUI

struct ResultDescriptionView: View {
    let degree: Double
    
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
                Text("\(String(degree))%")
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
        .padding(.trailing)
        
    }
}

struct ResultDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDescriptionView(degree: 30)
    }
}
