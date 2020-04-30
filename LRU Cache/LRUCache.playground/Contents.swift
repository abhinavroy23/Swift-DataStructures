import UIKit

class LRUCache1<T : Hashable>{
    public class Deque<T : Hashable> {
        private var array = [T]()
        
        public var isEmpty: Bool {
            return array.isEmpty
        }
        
        public var count: Int {
            return array.count
        }
        
        public func enqueue(_ element: T) {
            array.append(element)
        }
        
        public func enqueueFront(_ element: T) {
            array.insert(element, at: 0)
        }
        
        public func dequeue() -> T? {
            if isEmpty {
                return nil
            } else {
                return array.removeFirst()
            }
        }
        
        public func dequeueBack() -> T? {
            if isEmpty {
                return nil
            } else {
                return array.removeLast()
            }
        }
        
        public func index(forElement element : T) -> Int?{
            return array.firstIndex { (elem) -> Bool in
                return elem == element
            }
            return nil
        }
        
        public func remove(atIndex index : Int) -> T?{
            if index < array.count{
                let elem = array[index]
                array.remove(at: index)
                return elem
            }
            return nil
        }
        
        public func peekFront() -> T? {
            return array.first
        }
        
        public func peekBack() -> T? {
            return array.last
        }
        
        public func display(){
            print(array)
        }
    }
    
    private var dequeue : Deque<T> = Deque<T>()
    private var set : Set<T> = Set<T>()
    private var frameSize : Int
    
    init(size : Int) {
        self.frameSize = size
    }
    
    func refer(_ element : T) -> T{
        
        // Check if element exists in the cache
        
        // If element does not exists following scenarios are present
        // 1. if frame is not full - simply append at the start
        // 2. if frame is full = remove from last and append at the start
        if !set.contains(element){
            if dequeue.count == frameSize{
                if let last = dequeue.dequeueBack(){
                    set.remove(last)
                }
            }
        }
            // If element exists in the cache following scenarios are present
            // 1. if element exists at the front return element
            // 2. if element does not exists at the front remove element at add at front
        else{
            if let elem = dequeue.peekFront(), elem == element{
                return elem
            }else{
                if let index = dequeue.index(forElement: element){
                    _ = dequeue.remove(atIndex: index)
                }
            }
        }
        dequeue.enqueueFront(element)
        set.insert(element)
        
        dequeue.display()
        return dequeue.peekFront()!
    }
}

let cache : LRUCache1<Int> = LRUCache1<Int>.init(size: 3)
cache.refer(1)
cache.refer(2)
cache.refer(3)
cache.refer(4)
cache.refer(1)
cache.refer(2)
cache.refer(5)
cache.refer(1)
cache.refer(2)
cache.refer(3)
cache.refer(4)
cache.refer(5)
