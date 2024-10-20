//
//  Question2.swift
//  question1
//
//  Created by glenne d. dela torre on 10/19/24.
//


import SwiftUI

struct Question2: View{
    @ObservedObject var viewModel = ViewModel()
    @State var nextPage = false
    @State var newEmotion = "Shining"
    var body: some View {
        
        VStack (spacing:35){
            Spacer()
            Text("Who contributes the most to your mood today?").font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .center)
                .lineLimit(nil)
                
            CustomButton(onPress: {
            }, buttonMessage: "Family")
            
            CustomButton(onPress: {
            }, buttonMessage: "Friends")
            
            CustomButton(onPress: {
            }, buttonMessage: "People from school/work")
            CustomButton(onPress: {
            }, buttonMessage: "Strangers")
            CustomButton(onPress: {
            }, buttonMessage: "Myself!")
            
            Button(action:{
                self.nextPage.toggle()
            }){
                Text("Next").font(.title2)
            }.sheet(isPresented:$nextPage){
                EndPage(viewModel: viewModel)
            }

            Spacer()
        }
        
        .padding()
    }
}

#Preview{
    Question2()
}

