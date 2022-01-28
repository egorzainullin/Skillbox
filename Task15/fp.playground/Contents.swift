// 2
// Это функция без побочных эффектов и изменений состояний, то есть если ее вызвать в разные момент, то результат ее выполнения будет неизменным.

// 3
let arr = [1, 4, 2, 3, 0, 7]
arr.sorted()

// 4
let stringArray = arr.map({String($0)})

// 5
let stringArr = ["Hello", "Nikita", "and", "world"]
let a = stringArr.reduce("", { result, string in "\(result)\(string) "})
a

// 6

func func1() {
    print("hello,")
}

func func2() {
    print("world!")
}

//let seconds = 2
//let NSEC_PER_SEC = 1_000_000_000
//
//func functionWithDelay(function: () -> Void) async throws {
//    try await Task.sleep(nanoseconds: UInt64(seconds * NSEC_PER_SEC))
//    function()
//}

// 7
func oneThenSecondFunction(func1: @escaping () -> Void, func2: @escaping () -> Void) -> (() -> Void) {
    return {
        func1()
        func2()
    }
}

oneThenSecondFunction(func1: func1, func2: func2)()

// 8
typealias Comparator = (Int, Int) -> Bool

func comp (a: Int, b: Int) -> Bool {
    return a > b
}

func customSort(arr: [Int], comparator: Comparator) -> [Int] {
    let length = arr.count
    var arrToSort: [Int] = Array.init(arr)
    for i in 0..<length {
        var minIndex = i
        for j in i + 1..<length {
            if comparator(arrToSort[minIndex], arrToSort[j]) {
                minIndex = j
            }
        }
        let temp = arrToSort[i]
        arrToSort[i] = arrToSort[minIndex]
        arrToSort[minIndex] = temp
    }
    return arrToSort
}

let sortedArrayWithComparator = customSort(arr: [3, 4, 2, 1], comparator: comp)

// 9
// Инфиксный a+b. префиксный ++i, постфиксный ш++
