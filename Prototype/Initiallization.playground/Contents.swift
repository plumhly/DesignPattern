//: Playground - noun: a place where people can play

import UIKit

class Sum {
    var resultCache: [[Int]]
    var firstValue: Int
    var secondValue: Int
    
    /* round1
    init(first: Int, second: Int) {
        resultCache = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)
        for i in 0..<10 {
            for j in 0..<10 {
                resultCache[i][j] = i + j
            }
        }
        firstValue = first
        secondValue = second
    }
 */
    init(first: Int, second: Int, cacheSize: Int) {
        resultCache = [[Int]](repeating: [Int](repeating: 0, count: cacheSize), count: cacheSize)
        for i in 0..<cacheSize {
            for j in 0..<cacheSize {
                resultCache[i][j] = i + j
            }
        }
        firstValue = first
        secondValue = second
    }
    
    var result: Int {
        get {
            return (firstValue < resultCache.count && secondValue < resultCache[firstValue].count) ? resultCache[firstValue][secondValue] : firstValue + secondValue
        }
    }
    
}

/* round 1
var result1 = Sum(first: 0, second: 9).result
var result2 = Sum(first: 3, second: 8).result
*/

//round 2
var result1 = Sum.init(first: 0, second: 9, cacheSize: 10).result




