import Foundation

class CustomHashSet{

    private let bucketSize : Int = 10
    private var bucket : [[Int?]]
    
    init() {
        bucket = Array.init(repeating: [], count: bucketSize)
    }
    
    func insert(_ element : Int?){
        let index = hashValue(element)
        if !bucket[index].contains(element){
            bucket[index].append(element)
        }
    }
    
    func delete(_ element : Int?) -> Bool{
        let index = hashValue(element)
        if let listIndex = bucket[index].firstIndex(of: element){
            bucket[index].remove(at: listIndex)
            return true
        }
        return false
    }
    
    func search(_ element : Int?) -> (Int,Int){
        let index = hashValue(element)
        let listForIndex = bucket[index]
        for i in 0..<listForIndex.count{
            if element == listForIndex[i]{
                return (index,i)
            }
        }
        return (-1,-1)
    }
    
    func hashValue(_ element : Int?) -> Int{
        if let element = element{
            return element % bucketSize
        }
        return 0
    }
}

let list : CustomHashSet = CustomHashSet()
list.insert(1)
list.insert(11)
list.insert(2)
list.insert(10)
list.insert(20)
list.insert(nil)
