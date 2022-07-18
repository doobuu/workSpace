import UIKit

/*
    if 조건문 {
       // 조건문이 "참"일 때 실행
    } else {
    
    }
 
*/
var isChecked = true

if isChecked {
    print("check")
} else {
    print("not check")
}
// else를 사용하지 않고 if 조건문만 사용할 경우 참이 기본값이기 때문에 초기값에 true가 들어가면 "check" 로 false가 들어가면 결과값이 프린트 되지 않는다 밑에 예시
/* if isChecked {
    print("check")
} */


/*
    if 조건문 1 {
       // 해당 [조건문]이 "참"일 떄 실행
    } else if 조건문2 {
       // 해당 [조건문2]이 "참"일 때 실행
    } else {
    
    }
 
 */
var time = 12

if time == 9 {
    print("아침 식사 시간입니다")
} else if time == 12 {
    print("점심 식사 시간입니다")
} else if time == 18 {
    print("저녁 식사 시간입니다")
} else {
    print("자유 시간입니다")
}


/*
    switch 입력변수 {
    case 입력값1 :
        // 입력변수가 입력값1과 일치할 때 실행
    case 입력값2 :
        // 입력변수가 입력값2와 일치할 때 실행
    case 입력값3 :
        // 입력변수가 입력값3과 일치할 때 실행
    default :
        // 어떤 입력값과도 일치하지 않을 때 실행
    }
 
 */
let color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) // Color Literal 사용시 컬러를 할당할 수 있다

switch color {
case #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):
    print("White")
case #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1):
    print("Green")
case #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1):
    print("blue")
default:
    print("비교할 수 있는 색상이 없습니다")
}


/*
    guard 조건 else {
        조건과 맞지 않을 때 실행
        return
    }
 
 */
func getName(name: String?) -> String{
    guard let uName = name else {
        return "이름값이 존재하지 않습니다"
    }
    return uName
}

getName(name: "혜빈")
getName(name: nil) // 함수 파라미터를 옵셔널로 넣었기 때문에 nil로 실험

