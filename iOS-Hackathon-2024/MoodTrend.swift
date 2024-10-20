//
//  MoodTrend.swift
//  question1
//
//  Created by glenne d. dela torre on 10/20/24.
//
import SwiftUI

struct MoodTrend: View{
    @ObservedObject var viewModel = ViewModel()
    @State var nextPage = false
    @State var backPage = false
    @State var moodMonth = ""
    
    
    var body: some View {
        
        VStack (spacing:35){
            Spacer()
            let mood = viewModel.maxItem()
            Text("Mood of the Month").font(.title).bold()
                .padding()
            
            Text(" \(mood)").font(.title).bold()
                .foregroundColor(.blue)
            
            Button(action:{
                self.backPage.toggle()
            }){
                Text("Back").font(.title2)
            }.sheet(isPresented:$backPage){
                ContentView(viewModel: viewModel)
            }
            Spacer()
            Spacer()
            
        }
        
        .padding()
    }
}

#Preview{
    MoodTrend()
}
