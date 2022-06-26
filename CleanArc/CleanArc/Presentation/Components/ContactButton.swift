//
//  RoundReactButton.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import SwiftUI

struct ContactButton: View {
    
    var title: String
    var color: Color
    var onContact: () -> Void
    
    var body: some View {
        Button(action: onContact ) {
            Text("\(title)")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
        }.foregroundColor(.black)
            .background(color)
            .cornerRadius(10)
    }
}

struct CallButton: View {
    
    var onContact: () -> Void
    
    var body: some View {
        ContactButton(title: "Call", color: .green, onContact: onContact)
    }
}

struct ChatButton: View {
    var onContact: () -> Void
    
    var body: some View {
        ContactButton(title: "Chat", color: .blue, onContact: onContact)
    }
}


struct ContactButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ChatButton(onContact: {
                
            })
            CallButton(onContact: {
                
            })
        }
    }
}
