import XCTest
@testable import Lab_TDD1

final class TestingTDD1Tests: XCTestCase {
  var testPerson: Person?
  var expectedAge = 45
  let expectedFirstName = "Everett"
  let expectedLastName = "Brothers"
  let expectedName = "Everett Brothers"
  let expectedCanWalk = true
  let expectedNumberOfLegs = 2
  override func setUpWithError() throws {
    self.testPerson = Person(firstName: expectedFirstName, lastName: expectedLastName, canWalk: expectedCanWalk, numberOfLegs: expectedNumberOfLegs, age: expectedAge)
  }
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  func testName() throws {
    guard let testPerson else {
      XCTFail()
      return
    }
    XCTAssertEqual(testPerson.fullName, expectedName)
    XCTAssertEqual(testPerson.firstName, expectedFirstName)
    XCTAssertEqual(testPerson.lastName, expectedLastName)
  }
  func testAge() {
    guard let testPerson else {
      XCTFail()
      return
    }
    XCTAssertEqual(testPerson.age, expectedAge)
  }
  func testBirthday() {
    guard var testPerson else {
      XCTFail()
      return
    }
    XCTAssertEqual(testPerson.age, expectedAge)
    testPerson.birthday()
    expectedAge += 1
    XCTAssertEqual(testPerson.age, expectedAge)
  }
  func testWalking() {
    guard let testPerson else {
      XCTFail()
      return
    }
    XCTAssertTrue(testPerson.canWalk)
  }
  func testNumberOFLegs() {
    guard let testPerson else {
      XCTFail()
      return
    }
    XCTAssertEqual(testPerson.numberOfLegs, expectedNumberOfLegs)
  }
}









