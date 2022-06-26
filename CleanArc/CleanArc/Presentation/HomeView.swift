//
//  ContentView.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            SettingView()
            PetListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
