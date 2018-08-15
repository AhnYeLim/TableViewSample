//: [Previous](@previous)
//새로운 타입 하나 만들기 enum: 남이 마음대로 정할 수 있는게 아닌 내가 값을 지정해서 제약을 둠. 내가 지정한 몇가지 타입 중 하나를 지정.    struct: 값들을 묶어줄 때 사용
enum Gender {
    case Male
    case Female
}
struct Person {
    var name:String
    var age:Int
    var gender:Gender
}

func showPerson(person:Person) {
    print("\(person.name)의 나이는 \(person.age)입니다")
}

var myPerson:Person
myPerson = Person(name: "ahn ye lim", age: 21, gender: .Female)

showPerson(person: myPerson)

//var leftOperand:Int
//var rightOperand:Int
//var result:Int

//func append(myLeftOperand:Int, myRightOPerand:Int) -> Int {
   // return myLeftOperand + myRightOPerand
//}

//var myReturn = append(myLeftOperand: 2, myRightOPerand: 3)
//print("result = \(myReturn)")

//구조체, class :변수와 함수를 묶어서 하나의 타입으로 쓴다. 선언된 변수 안에는 초기 값이 할당되 있어야 함. class 안의 변수를 property 라고 함. class 안의 함수는 method. class 안의 변수는 값을 초기화 해줘야함!초기화 안하면 error남. 구조체는 값 초기화 안해줘도 에러 안남.
class Calculator {
    var leftOperand:Int = 0
    var rightOperand:Int = 0
    var result:Int = 0
    //append라는 함수 사용시 그 각각 더한 값들 저장하기 위해 이렇게 선언함. 더하는데 사용된 인자 값 저장.결과도 저장
    func append(myLeftOperand:Int, myRightOPerand:Int) -> Int {
        leftOperand = myLeftOperand
        rightOperand = myRightOPerand
        result = leftOperand + rightOperand
        return result
      
    }

}

class NewPerson {
    var name:String = ""
    var age:Int = 0
}
//class 는 ()열면 그 안의 변수 값들이 뜨지 않음.
var calc:Calculator = Calculator()
//calc.leftOperand = 10
//calc.rightOperand = 20
//calc.result = 30

//Newperson()

//Calculator()라는 오브젝트(객제)가 만들어짐. 이걸 변수에 할당 하면 객체의 위치가 저장됨. Newperson()은 변수에 할당 안해서 그 객체가 생성만 되고 위치가 저장이 안되서 쓸 수 없음, 객제의 주소를 변수가 담고 있음.(=변수가 객체의 주소 값을 담고 있고 그 객체에 접근하기 위해 변수를 사용함.)

var person = NewPerson()
person.name = "yelim"
person.age = 21

var newResult = calc.append(myLeftOperand: 10, myRightOPerand: 20)
print(newResult)
print(calc.leftOperand)
print(calc.rightOperand)
print(calc.result)














//: [Next](@next)
