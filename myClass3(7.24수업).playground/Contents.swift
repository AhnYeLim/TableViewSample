//변수를 초기화 하는 함수:init'
//하나의 설계도를 만드는 과정. 정의만 한 것.
class GYview {
    var name:String
    
    init(name:String) {
        self.name = name
        //self는 자신이 속해 있는 GYview class그 자체 말하는 거. 점찍어서 GYview의 변수 name에 접근.
    }
    init(addName:String) {
        name = addName + "Hello"
    }
}
//var로 저장안하면 그 값에 접근 할 수 없음.
var a = GYview(name:"테스트 뷰")
a.name

//강의에서 추가로 배운 내용. init로 class의 변수에 대한 다양한 값 초기화 가능.
var c = GYview(addName: "yelim")
c.name


//기존 class 기능 상속 받고 싶을 때
class GYButton : GYview {
    var title:String
    
    init(name:String, title:String) {
        self.title = title
        super.init(name: name)
    }
}
//super:상위 개념. 상속받은 class 를 super이라고 지칭함.
var b = GYButton(name: "first", title: "second")
b.title


