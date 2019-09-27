import UIKit

var newArray: [Int] = [1,2,54,3,23,54,7676,45,2,24,65,87,56,3,4,235,1245,0]

//
////SORT ARRAY FUNCTION     BAD O(N2)
//
var sortedArray = newArray.sorted()
var arrayInteration = newArray.count - 1

var topPointer = newArray[0]
var bottomPointer = newArray[0]

func findTopAndBottom() {
    
    for i in 1...arrayInteration  {
        if newArray[i] > topPointer{
            topPointer = newArray[i]
        }
    }
    
    for i in 1...arrayInteration {
        if newArray[i] < bottomPointer{
            bottomPointer = newArray[i]
        }
    }
}

//
////----------------------------------------------------------------------------------------------------------------------
//
//// BINARY SEARCH FUNCTION
//

func binarySearchFunction(array: [Int], key: Int) -> Bool {
    if array.count == 0 {
        return false
    }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex/2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midIndex...maxIndex - 1])
        return binarySearchFunction(array: slice, key: key)
    }
    
    if key < midValue {
        let slice = Array(array[minIndex...midIndex - 1])
        return binarySearchFunction(array: slice, key: key)
    }
    
    if key == midValue {
        print("Success, \(key) is in the array")
        return true
    }
    
    return false
}


binarySearchFunction(array: sortedArray, key: 65)

//
////----------------------------------------------------------------------------------------------------------------------

// TWO SUM PROBLEM

var twoSumArray = sortedArray

// check if two numbers can sum

func twoSum(array: [Int], a: Int) -> Bool {
    
    var highIndex = twoSumArray.count - 1
    var lowIndex = 0
    while lowIndex < highIndex {
        let pointerSum = twoSumArray[lowIndex] + twoSumArray[highIndex]
        if pointerSum == a {
            print("Success \(twoSumArray[highIndex]) and \(twoSumArray[lowIndex]) equal \(a)")
            return true
        } else if pointerSum > a {
            highIndex -= 1
        } else if pointerSum < a {
            lowIndex += 1
        }
    }
    return false
}

twoSum(array: twoSumArray, a: 27)




//--------------------------------------------------------------------------------------------------------------------------------

// MOST COMMON ITEM IN ARRAY

var colorArray: [String] = ["red", "blue", "blue", "green", "yellow", "purple", "orange", "white", "red", "red"]

func mostCommonColor(array: [String]) -> [String: Int] {
    
    var topColors:[String: Int] = [:]
    var colorDictionary: [String: Int] = [:]
    
    for color in array {
        if let count = colorDictionary[color] {
            colorDictionary[color] = count + 1
        } else {
            colorDictionary[color] = 1
        }
    }
    
    let highestValue = colorDictionary.values.max()
    
    
    for (color, count) in colorDictionary {
        if colorDictionary[color] == highestValue {
            topColors[color] = count
        }
    }
    
    
    print(topColors)
    
    return topColors
    
    
}

mostCommonColor(array: colorArray)

//--------------------------------------------------------------------------------------------------------------------------------

//FACROTIAL


func factorial(value: UInt) -> UInt {
    
    if value == 0 {
        return 1
    }
    var product: UInt = 1
    for i in 1...value {
        product = product * i
    }
    return product
}

factorial(value: 6)



func recursiveFactorial(value: Int) -> Int {
    if value == 0 {
        return 1
    }
    return  value * recursiveFactorial(value: value - 1)
}

recursiveFactorial(value: 5)



//--------------------------------------------------------------------------------------------------------------------------------

//REVERSE WORDS
//
var sampleSentance = "Lets start today by learning a new challange"

func reverseWordsInSentance(sentance: String) -> String {
    let allWords = sampleSentance.components(separatedBy: " ")
    var newSentance = ""
    
    
    for index in 0...allWords.count - 1 {
        let word = allWords[index]
        if newSentance != "" {
            newSentance += " "
        }
        
        if index % 2 == 1 {
            let reversedWord = String(word.reversed())
            newSentance += reversedWord
        } else {
            newSentance += word
        }
    }
    return newSentance
}
reverseWordsInSentance(sentance: sampleSentance)


//
//--------------------------------------------------------------------------------------------------------------------------------

//MERGE SORT

let array = [1,4,5,23,45,2323,9]

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [T] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

mergeSort(array)
print(array)
print(mergeSort( array))

