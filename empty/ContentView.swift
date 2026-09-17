import SwiftUI

struct ContentView: View {
    @State var userName: String = "some name"
    
    var body: some View {
        VStack {
            Text(userName)
            
            Button {
                userName = "you're Heisenberg"
            } label: {
                Text("Say my name")
            }
        }
    }
}
    
#Preview {
    ContentView()
}
