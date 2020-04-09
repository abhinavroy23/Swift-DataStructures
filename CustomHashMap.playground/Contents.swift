import Foundation

class CustomhashMap<T: Hashable, U>{
    typealias HashElement = (key : T, value : U)
    private var bucket : [[HashElement]]
    private var bucketSize : Int
    
    init(capacity : Int) {
        self.bucketSize = capacity
        bucket = Array(repeating: [], count: capacity)
    }
    
    private func bucketIndex(forKey key : T) -> Int{
        var divisor : Int = 0
        for str in String(describing: key).unicodeScalars{
            let ascii = Character(str).asciiValue ?? 0
            divisor = divisor + Int(ascii)
        }
        return divisor % bucketSize
    }
    
    func insert(value : U, forKey key : T){
        let index = bucketIndex(forKey: key)
        var bucketIndex : Int?
        for (idx,hashElement) in bucket[index].enumerated(){
            if key == hashElement.key{
                bucketIndex = idx
            }
        }
        if let idx = bucketIndex{
            bucket[index][idx] = (key,value)
        }else{
            bucket[index].append((key,value))
        }
    }
    
    func removeValue(forKey key : T) -> Bool{
        let index = bucketIndex(forKey: key)
        var bucketIndex : Int?
        for (idx,hashElement) in bucket[index].enumerated(){
            if hashElement.key == key{
                bucketIndex = idx
            }
        }
        if let idx = bucketIndex{
            bucket[index].remove(at: idx)
            return true
        }
        return false
    }
    
    func value(forKey key: T) -> U?{
        let index = bucketIndex(forKey: key)
        for hashElement in bucket[index]{
            if hashElement.key == key{
                return hashElement.value
            }
        }
        return nil
    }
}

let map : CustomhashMap<String,Int> = CustomhashMap<String,Int>.init(capacity: 10)
map.insert(value: 5, forKey: "test")
map.insert(value: 6, forKey: "test")
map.value(forKey: "test")
