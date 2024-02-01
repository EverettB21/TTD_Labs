import XCTest
@testable import Lab_TDD3

class FakeDataBase: StudentNetworkService {
  func addToDataBase(studentName: String) {
    students.append(studentName)
  }
  func fetchDataFromDataBass() -> [String] {
    students
  }
  var students = [String]()
}

final class FakeMockStubTests: XCTestCase {
  let dataBase = FakeDataBase()
  var studentController: StudentController?
  override func setUpWithError() throws {
    self.studentController = StudentController(studentNetwrokService: dataBase)
  }
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  func testAdd() {
    XCTAssertTrue(dataBase.students.isEmpty)
    studentController?.addStudent(studentName: "Everett")
    XCTAssertTrue(dataBase.students.contains("Everett"))
  }
  func testFetch() {
    XCTAssertNotNil(studentController?.students)
  }
}
