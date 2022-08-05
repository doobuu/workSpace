import UIKit

/*
 
 저장 프로퍼티:
  단순한 값을 저장하고 있는 프로퍼티
  변수 또는 상수 키워드를 이용해서 사용 가능
 
 */

//struct Student{
//    var name: String
//    var age: Int
//}
//
//var dooboo = Student(name: "두부", age: 20)
//print(dooboo)
// 프로퍼티 옵저버 실습을 위해 주석을 달았고 원래는 저장 프로퍼티를 위한 실습 문법

/*
 
 연산 프로퍼티:
  실제값을 저장하고 있는 것이 아니라 get/set 으로 값을 탐색하고
  간접적으로 다른 프로퍼티의 값을 설정할 수 있다
 
 */

struct WeeklySalary{
    var hourlyWage: Double
    var workinghours: Double
    
    var wage: Double{
        get{
           return hourlyWage * workinghours
        }
        set{
           workinghours = newValue / hourlyWage
        }
    }
}

var myWeeklySalary = WeeklySalary(hourlyWage: 10000, workinghours: 4)
print(myWeeklySalary)
print(myWeeklySalary.wage)
myWeeklySalary.wage = 50000
print(myWeeklySalary.workinghours)


/*
 
 프로퍼티 옵저버:
  프로퍼티의 새 값이 설정될 때마다 이벤트를 감지할 수 있다
  willSet: 값이 저장되기 바로 직전의 시점
  didSet: 새 값이 저장되고 난 후의 시점에서 호출
 
 */


struct Student {
    var name: String {
        willSet {
            print("\(name) -> \(newValue)로 변경예정입니다")
        }
        
        didSet {
            print("\(oldValue) -> \(name)로 변경되었습니다")
        }
    }
}

var dooboo = Student(name: "두부")
dooboo.name = "dooboo"
// 프로퍼티가 변경될 때마다 willset과 didset에서 변경을 감지할 수 있다


/*
  
 타입 프로퍼티:
  static을 이용해서 사용 가능하다
  인스턴스 생성을 하지 않아도 사용할 수 있다
  저장 프로퍼티, 연산 프로퍼티로 사용 가능하다
 
 */


struct SomeStruct {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 1
    }
}

SomeStruct.storedTypeProperty
SomeStruct.computedTypeProperty
// 타입 프로퍼티에서는 static을 사용한다 타입 프로퍼티로 선언한 프로퍼티일 경우 인스턴스를 생성하지 않아도 바로 호출할 수 있다 ex) SomeStruct.storedTypeProperty

print("\(SomeStruct.storedTypeProperty)")
print("\(SomeStruct.computedTypeProperty)")
