//
//  SettingView.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation
import SwiftUI

struct SettingView: View {
    
    @StateObject var vm = SettingViewModel()
    
    private func build() -> some View {
        VStack {
            if vm.showCantact(Date.now) {
                HStack {
                    if vm.settings.isCallEnabled {
                        CallButton(onContact: {
                            
                        })
                    }
                    if vm.settings.isChatEnabled {
                        ChatButton(onContact: {
                            
                        })
                    }
                }
            }
            WorkTimeLabel(time: vm.settings.workHours)
                .frame(height: 60)
        }
        .padding()
        .task {
            await vm.getSettings()
         }
        .alert("Error", isPresented: $vm.hasError) {
        } message: {
             Text(vm.errorMessage)
        }
    }
    
    var body: some View {
        build()
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
