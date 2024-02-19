struct Student {
    var firstName: String
    var lastName: String
    var gpa: Double
}

class StudentJournal {
    var students: [Student] = []
    
    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let newStudent = Student(firstName: firstName, lastName: lastName, gpa: averageGrade)
        students.append(newStudent)
    }
    
    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }
    
    func displayStudents() {
        let sortedStudents = students.sorted { $0.gpa > $1.gpa }
        
        for student in sortedStudents {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.gpa)")
        }
    }
    
    func averageScore() -> Double {
        let totalScore = students.reduce(0.0) { $0 + $1.gpa }
        return totalScore / Double(students.count)
    }
    
    func highestGPAStudent() -> Student? {
        return students.max(by: { $0.gpa < $1.gpa })
    }
}


let journal = StudentJournal()

journal.addStudent(firstName: "Madiyar", lastName: "Kairkhan", averageGrade: 2.73)
journal.addStudent(firstName: "Timur", lastName: "Inamkhojayev", averageGrade: 3.5)
journal.addStudent(firstName: "Ramazan", lastName: "Daurbekov", averageGrade: 3.02)


print("Список студентов (по убыванию GPA):")
journal.displayStudents()

let averageGpa = journal.averageScore()
print("\nAverage Score of all students: \(averageGpa)")

if let highestGPAStudent = journal.highestGPAStudent() {
    print("\nStudent with the highest GPA:")
    print("Name: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.gpa)")
}

journal.removeStudent(firstName: "Madiyar", lastName: "Kairkhan")

print("\nОбновлённый список студентов:")
journal.displayStudents()
