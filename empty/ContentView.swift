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

            Button {
                tasks.addTask(title: "New task")
                note = ""
            } label: {
                Text("Add note")
            }
            .padding()
        }
    }
}
    
#Preview {
    ContentView()
}
