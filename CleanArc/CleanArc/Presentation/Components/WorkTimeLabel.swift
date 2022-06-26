//
//  WorkTimeLabel.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import SwiftUI

struct WorkTimeLabel: View {
    
    var time: String
    
    var body: some View {
        Text("Office Hours: \(time)")
            .font(.body)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .border(Color.gray, width: 1)
            
    }
}

struct WorkTimeLabel_Previews: PreviewProvider {
    static var previews: some View {
        WorkTimeLabel(time: "M-F 10:00 - 18:00")
    }
}
