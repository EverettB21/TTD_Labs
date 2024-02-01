//
//  Student.swift
//  Lab-TDD3
//
//  Created by Everett Brothers on 2/1/24.
//

import Foundation

class StudentController {
  var studentNetwrokService: StudentNetworkService
  var students = [String]()
  init(studentNetwrokService: StudentNetworkService) {
    self.studentNetwrokService = studentNetwrokService
    students = studentNetwrokService.fetchDataFromDataBass()
  }
  func addStudent(studentName: String) {
    studentNetwrokService.addToDataBase(studentName: studentName)
    students.append(studentName)
  }
}

protocol StudentNetworkService {
  func addToDataBase(studentName: String)
  func fetchDataFromDataBass() -> [String]
}
