//
//  EndPage.swift
//  question1
//
//  Created by glenne d. dela torre on 10/20/24.
//
import SwiftUI

struct EndPage: View{
    @ObservedObject var viewModel = ViewModel()
    @State var nextPage = false
    var body: some View {
        VStack {
            
            Text("Have a good night and a brand new tomorrow!").font(.title).bold()
                .padding()
            Button(action:{
                self.nextPage.toggle()
            }){
                Text("Back").font(.title2)
            }.sheet(isPresented:$nextPage){
                ContentView(viewModel: viewModel)
            }
            
            }
        }
}

#Preview{
    EndPage()
}

