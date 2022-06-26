//
//  PetListView.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation
import SwiftUI

struct PetListView: View {
    
    @StateObject var vm = PetListViewModel()
    
    @State var showSafari = false
    
    private func listRow(_ pet: Pet) -> some View {
        Button(action: {
            // tell the app that we want to show the Safari VC
            self.showSafari = true
        }) {
            HStack {
                AsyncImage(url: URL(string: pet.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 44, height: 44)
                .background(Color.gray)
                .clipped()
                    
                Text(pet.title)
            }
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url:URL(string: pet.contentUrl)!)
        }
        
    }
    
    private func PetList() -> some View {
        List {
            ForEach(vm.pets) { item in
                listRow(item)
            }
        }
        .listStyle(PlainListStyle())
        .task {
           await vm.getPets()
        }
        .alert("Error", isPresented: $vm.hasError) {
        } message: {
            Text(vm.errorMessage)
        }
    }
    
    var body: some View {
       PetList()
    }
}
