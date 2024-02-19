struct Task {
    var title: String
    var description: String
    var isCompleted: Bool
}

class ToDoList {
    var tasks: [Task] = []
    
    func addTask(title: String, description: String) {
        let newTask = Task(title: title, description: description, isCompleted: false)
        tasks.append(newTask)
    }
    
    func removeTask(title: String) {
        tasks.removeAll { $0.title == title }
    }
    
    func changeTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
        }
    }
    
    func displayTasks() {
        for task in tasks {
            print("Название: \(task.title), Описание: \(task.description), Статус: \(task.isCompleted)")
        }
    }
    
    func displayCompletedTasks() {
        let completedTasks = tasks.filter { $0.isCompleted }
        print("\nВыполненные задачи:")
        for task in completedTasks {
            print("Название: \(task.title), Описание: \(task.description)")
        }
    }
    
    func displayOutstandingTasks() {
        let outstandingTasks = tasks.filter { !$0.isCompleted }
        print("\nOutstanding Tasks:")
        for task in outstandingTasks {
            print("Названиеe: \(task.title), Описание: \(task.description)")
        }
    }
    
    func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
}

let toDoList = ToDoList()

toDoList.addTask(title: "Встреча с Маркетинговым отделом", description: "Сделать выводы насчёт рекламной кампании")
toDoList.addTask(title: "Провести вечер с семьёй", description: "Традиционный досуг")

print("Задачи в порядке их добавления:")
toDoList.displayTasks()

toDoList.changeTaskStatus(title: "Встреча с Маркетинговым отделом", isCompleted: true)

toDoList.displayCompletedTasks()
toDoList.displayOutstandingTasks()

toDoList.removeTask(title: "Провести вечер с семьёй")

print("\nОбновлённый список:")
toDoList.displayTasks()

toDoList.clearCompletedTasks()

print("\nСписок задач:")
toDoList.displayTasks()
