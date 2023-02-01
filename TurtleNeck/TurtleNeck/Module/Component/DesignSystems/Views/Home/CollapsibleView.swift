//
//  CollapsibleView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/31.
//

import SwiftUI

struct CollapsibleView<Content: View>: View {
    let label: () -> Text
    let content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                collapsed.toggle()
            } label: {
                HStack() {
                    label()
                        .font(.body.weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: collapsed ? "chevron.down" : "chevron.up")
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding()

            VStack {
                Divider().padding(.horizontal, 20)
                content()
                    .font(.caption)
                    .padding(.bottom, 12)
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                HStack {
                    Spacer()
                    Text("출처: 국가건강정보포털(health.kdca.go.kr)")
                        .font(.caption)
                        .padding(.trailing, 3)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 3)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .animation(.easeOut, value: collapsed)
            .clipped()
        }
        .background(.white)
        .cornerRadius(5)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .shadow(radius: 1, y: 1)
    }
}

struct CollapsibleView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsibleView {
            Text("타이틀")
        } content: {
            Text("내용")
        }

    }
}
