import SwiftUI

struct ToDo: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

@Observable
class TasksVM {
    var tasks: [ToDo] = []
    
    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            return
        }
        tasks.append(ToDo(title: title, isCompleted: false))
    }
}


struct ContentView: View {
    @State var tasks = TasksVM()
    @State var note: String = ""

    var body: some View {
        VStack {
            HStack{
                Text("To-Do List")
            }
            
            List(tasks.tasks) { task in
                Text(task.title)
            }
            
            Spacer()
            
            TextField("Введите заметку", text: $note)
                .padding(20)
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(50)
            
            Button {
                tasks.addTask(title: note)
                note = ""
            } label: {
                Text("Add note")
            }
            .padding()
            .font(.headline)
            .foregroundColor(.black)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
}
    
#Preview {
    ContentView()
}
