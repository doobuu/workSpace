import UIKit

// 데이터 타입
// Bool :  참, 거짓을 표현하기 위한 타입
var isChecked : Bool = false
isChecked = true

// Int :  64bit 정수형 타입
var temperature : Int = -100 // 초기값
temperature = 100 // 수정값

// UInt : Unsigned Interger 64bit 정수형 타입, 양의 정수 타입
var cakes : UInt = 100
// cakes = -100 양의 정수 타입이기 때문에 음수를 사용하면 컴파일 오류가 발생

// Float : 32bit 부동소수형, 정수도 사용 가능
var pi : Float = 3.14
pi = 314

// Double : 64bit 부동소수형, 정수형 타입 사용 가능
var pi2 : Double = 3.14
pi2 = 314

// Character : 한 문자를 표현하기 위한 타입
var sampleCharacter : Character = "A"
sampleCharacter = "가"
//sampleCharacter = "문자열을 넣을 경우" String type이기 때문에 컴파일 오류가 발셍

// String : 여러 문자를 표현하기 위한 타입
var sampleString : String = "Hi"
sampleString = "안녕하세요"

// Type 추론
// 컴파일러가 초기화된 값을 보고 타입을 추론하는 방법 -> 데이터 타입을 선언하지 않아도 해당 변수에 대한 데이터 타입 추론 가능
var test = 100 // 데이터 타입 없이 변수를 선언해도 컴파일 오류가 일어나지 않는 모습
type(of: test) // -> 결과값이 Int 타입이라는 것을 타입 추론을 통해 알 수 있다
var testString = "타입추론"
type(of: testString)

// Any : 모든 타입을 지칭하는 키워드
var sampleAny : Any = "any"
sampleAny = 10000
sampleAny = 3.14

// nil : 없음, 존재하지 않음을 나타내는 키워드
// var sampleInt : Int = nil 해당 변수 선언은 'nil' cannot initialize specified type 'Int' 컴파일 오류가 발생 nil을 사용하기 위해서는 Optional 변수로 선언해야 한다 -> 타입 뒤에 물음표 ex) Int? = nil
var sampleInt : Int? = nil
type(of: sampleInt) // nil 타입으로 변수 선언시 Optional<Int>로 타입이 선언되는 것을 확인할 수 있다

// var sampleString2 : String = nil 선언시 'nil' cannot initialize specified type 'String' 컴파일 오류 발생(할당될 수 없음) Optional 변수로 선언해야 오류 제거 -> ex) String? = nil
var sampleString2 : String? = nil
type(of: sampleString2) // Optional<String>.Type 인 것을 확인할 수 있다


 

