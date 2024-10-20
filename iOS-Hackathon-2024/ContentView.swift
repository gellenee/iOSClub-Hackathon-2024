import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    @State var showQuestions = false
    @State var showMood = false
    var body: some View {
        VStack {
            Text("Welcome").font(.title).bold()
                .padding()
            Text("Jot down your feelings!").font(.title).bold()

                .padding()
            Button(action:{
                self.showQuestions.toggle()
            }){
                Text("Add mood").font(.title2)
            }.sheet(isPresented:$showQuestions){
                Question1(viewModel:viewModel)
            }
            .padding()
            Button(action:{
                self.showMood.toggle()
            }){
                Text("Mood of the Month").font(.title2)
                    .foregroundColor(.pink)
            }.sheet(isPresented:$showMood){
                MoodTrend(viewModel:viewModel)
            }
        }
        
    }
}
#Preview {
    ContentView()
}
