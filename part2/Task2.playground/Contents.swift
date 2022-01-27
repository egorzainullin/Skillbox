import UIKit

// 4. Для того, чтобы не писать один и тот же код для разных типов.

// 5. Ассоцииророванные типы используюся в протоколах.

// 6
func printIfEqual<T: Equatable>(firstValue:T, secondValue: T) {
    if firstValue == secondValue {
        print("They are equal!")
    }
    else {
        print("they are not equal")
    }
}

func printMax<T: Comparable>(firstValue: T, secondValue: T) {
    if firstValue >= secondValue {
        print(firstValue)
    }
    else {
        print(secondValue)
    }
}

func minInFirstMaxInSecond<T: Comparable>(firstValue: inout T, secondValue: inout T) {
    
    if firstValue >= secondValue {
        let temp = firstValue
        firstValue = secondValue
        secondValue = temp
    }
}

var a = 2
var b = 1
minInFirstMaxInSecond(firstValue: &a, secondValue: &b)
print(a, b)

func comfg<T>(f: @escaping (T) -> Void, g: @escaping (T) -> Void) -> ((T) -> Void) {
    return {
        a in
        f(a)
        g(a)
    }
}

let f = { a in print(a)}
let g = f

comfg(f: f, g: g)(5)

// 7
extension Array where Element: Comparable {
    func max() -> Element {
        var max = self[0]
        for i in 1..<self.count {
            if max < self[i] {
                max = self[i]
            }
        }
        return max
    }
}

extension Array where Element: Equatable {
    mutating func distinct(){
        var i = 0
        while (i < self.count) {
            var j = i + 1
            while (j < self.count) {
                if self[j] == self[i] {
                    self.remove(at: j)
                }
                else {
                    j += 1
                }
            }
            i += 1
        }
    }
}

var arr = [1, 2, 1, 3, 2]
arr.distinct()

// 8
