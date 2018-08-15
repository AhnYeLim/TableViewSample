var name:String = "ahn ye lim"

func testFunc() {
    var name:String = "홍길동"
    print(name)
}
//print(name)시 name은 괄호안에서 먼저 찾음. 괄호안에 name이 없다면 밖에 선언된 name :ahn yelim이 출력됨.

testFunc()

//func나 변수들은 프로그램이 끝나면 사라지지만 class로 선언된 객체들은 사라지지 않음.

class Person {
    var name:String
    //값을 초기화 해야 할 때, 어떤 값을 초기화 할 수 없을 때 optional 사용
    var age:Int?
    
    //class 안에 들어가는 변수는 반드시 초기화를 해야 함. 1.처음에 아예 초기화 2.init라는 함수만들면 선언시에 내가 원하는 놈으로 만들 수 있음. class 선언시 초기화 값 안넣어 줄 수 있음. init라는 함수로 초기화 해 줄 수 있음. 초기화 시킬 수 없을 때 optional 사용. struct은 init이 되어 있는 거고 class는 직접 해줘야함.
    init(name:String, age:Int?) {
        //class의 property 지칭 하는법: self.name = name
        self.name = name
        self.age = age
    }
}
//상속 받기. 기존 person class의 프로퍼티들 쓰고 싶을 때 그대로 또 선언하는 것 보단 상속 받을 수 있음.
class SuperPerson : Person {
    var iq:Int
    
    init(iq:Int, name:String, age:Int) {
        self.iq = iq
        super.init(name: name, age: age)
    }
    
}

func testFunc2() {
    var person = Person(name: "안예림", age:nil)
}

struct Student {
    var name:String = ""
    var age:Int = 0
}

func myFunc3() {
    //var student = Student(name: "yelim", age: 21)
    //var student2 = Student(name: "gildong", age: 24)
    var student = Student()
    student.name = "yelim"
    student.age = 21
}

//메모리 영역에는 stack, heap 2가지 영역이 있음. heap은 메모리가 지워지지 않음. class가 heap영역에 만들어짐. stack은 해당 코드 영역이 끝나면 사라짐. 구조체, class :함수, 변수들 묶어서 사용. heap 영역에 만들어지는 class는 값이 사라지지 않음. 구조체는 그 순간만 생성되고 소멸됨.
