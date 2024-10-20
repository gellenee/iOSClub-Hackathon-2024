import SwiftUI
struct Question1: View{
    var feelings: [String: String]
    var newEmotion = ""
    @State var nextPage = false
    var body: some View {
        VStack {
            Text("How are you feeling right now?")
            Button("Shining"){
                newEmotion = "Shining"
            }
            Button("Peaceful"){
                newEmotion = "Peaceful"
            }
            Button("Dark"){
                newEmotion = "Dark"
            }
            .padding()
            Button(action:{
                self.nextPage.toggle()
            }){
                Text("Next")
            }.sheet(isPresented:$nextPage){
                Question2()
            }
        }
        .padding()
    }
}

#Preview{
    Question1()
}

