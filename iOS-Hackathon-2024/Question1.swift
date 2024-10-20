//
//  Question1.swift
//  question1
//
//  Created by glenne d. dela torre on 10/19/24.
//

import SwiftUI
struct Question1: View{
    
    @State var newEmotion = ""
    @State var nextPage = false
    @ObservedObject var viewModel = ViewModel()
   
    var body: some View {
        VStack (spacing:35){
            Spacer()
            Text("How are you feeling right now?").font(.title).bold()
                .padding()
            
            CustomButton(onPress: {
                newEmotion = "Shining"
            }, buttonMessage: "Shining")
            
            CustomButton(onPress: {
                newEmotion = "Peaceful"
            }, buttonMessage: "Peaceful")
            
            CustomButton(onPress: {
                newEmotion = "Dark"
            }, buttonMessage: "Dark")

            Button(action:{
                let date = Date()
                let month = Calendar.current.component(.month, from: date)
                viewModel.addItem(key: month, val: newEmotion)
                self.nextPage.toggle()
            }){
                Text("Next").font(.title2)
            }.sheet(isPresented:$nextPage){
                Question2(viewModel:viewModel)
            }
            Spacer()
        }
        .padding()
    }
}

struct CustomButton: View {
    let onPress: () -> Void
    let buttonMessage: String
    var body: some View {
        Button(action: onPress, label: {
            Text(buttonMessage)
                .frame(width: 200, height: 60)
                .foregroundColor(.black)
                .background(Color(.sRGB, red: 1.0, green: 1.0, blue: 0.5))
            
                .clipShape(Capsule())
                .font(.title2)
        })
        
    }
}

#Preview{
    Question1()
}

