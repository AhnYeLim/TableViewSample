

var firstName = "구백2"
var lastName = "2"
var email = "바보다"

func printNameAndEmail(firstName n:String, lastName a:String) {
    var fullName = lastName + firstName
    print("\(fullName)의 이메일 주소는 \(email)입니다.")
    
    }
func myFunction(_ x:Int,_ y:Int) {
    
}

//printNameAndEmail(firstName: <#T##String#>, lastName: <#T##String#>) 함수 안에서는 n과 a로 작동됨.

//var fullName = lastName + firstName
//print("\(fullName)의 이메일 주소는 \(email)입니다.")
printNameAndEmail(firstName: firstName, lastName: lastName)


firstName = "민지"
lastName = "김"
email = "zzz@naver.com"


//fullName = lastName + firstName
//print("\(fullName)의 이메일 주소는 \(email)입니다.")



printNameAndEmail(firstName: firstName, lastName: lastName)



func testFunc(name :String) -> String {
    //print("\(name)는 최강공대")
    var returnStr = "\(name)은 최강공대"
    return returnStr
}

let name2 = "902"
var testVal = testFunc(name:"2902")
print(testVal)

testFunc(name:"902")

func add(apple:Int, banana:Int) ->Int{
    return apple + banana
}

func stringAdd(x:String, y:String) -> String{
    return x+y
}
print(stringAdd(x: "2", y: "4"))

 add(apple: 2, banana: 5)
let result1 = add(apple: 5, banana: 7)
let result2 = add(apple:result1, banana: 12)

func myAdd(x:Int, y:Int) {
    print(x+y)
}

myAdd(x: 2, y: 8)
let result3 = myAdd(x: 2, y: 6)
//반환값 없는 함수는 일회성임.
//let result4 = myAdd(x: result3, y: 6) //error뜸




