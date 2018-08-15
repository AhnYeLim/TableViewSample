////: A UIKit based Playground for presenting user interface
//
//import Foundation
//import PlaygroundSupport
//
////간단한 HTML, JSON 가져오기
////데이터를 가져올 웹사이트의 주소(url)와 해당 웹사이트에 접속하기(session) 및 접속해서 특정 작업 수행하기(task)
//
//
//// Playgound에서도 JSON Get 출력하도록 함
//PlaygroundPage.current.needsIndefiniteExecution = true
//
////url은 사이트의 주소, http로 시작하는 url은 info.plist에 추가적인 작업 필요
//let urlPath = "https://www.youtube.com"
//let url = NSURL(string: urlPath)
//
////session은 접속. 해당 웹사이트에 접속하기 위해 URLSession.shared를 통해 세션을 연다.
//let session = URLSession.shared
//
////task는 url과 session 모두 필요
//
////어느 url을 가져올 것인지 인자값을 정의하도록 한다
////session이 연결되면 어떤 task를 수행할 것인지 completionHandler에 입력하도록 한다.
////completionHandle 클로져에 세션이 열리면서 data, response, error 3가지 값 반환
//let task = session.dataTask(with: url! as URL, completionHandler: {
//    (data, response, error) -> Void in
//
//    if error == nil {
//        let urlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//        print(urlContent ?? "No contents found")
//    } else {
//        print("Error occurred")
//    }
//})
//
//
//task.resume()


//JSON 데이터 가져오기
//이번에는 HTML이 아닌 JSON
//이때 사용되는 메서드는 에러를 throw하므로 do-try-catch를 통해 처리해야 한다.

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let urlPath = "https://swapi.co/api/people/1/"
let url = NSURL(string: urlPath)
let session = URLSession.shared

let task = session.dataTask(with: url! as URL, completionHandler: {
    (data, response, error) -> Void in
    
    do {
        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
        print(jsonResult)
    } catch {
        print("Error")
    }
})

task.resume()
