// Copyright 2020 Abhinav Roy, All rights reserved.
// Implementation of [STACKS as Linked List] in Swift with all basic operations
import Foundation

//
//   -------------------------------
//   1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
//   -------------------------------
//   ^
//   |
//  Top
//
//  Stacks
//  LIFO Data Structure
//  Push/Pop both happens at one end
//  Operations: Push, Pop, peek/top, isEmpty

class Node<T>{
    var data : T?
    var next : Node<T>?
    
    init(data: T, next: Node<T>?) {
        self.data = data
        self.next = next
    }
}
class LinkedList<T>{
    var root : Node<T>?
    
    init(root: Node<T>?) {
        self.root = root
    }
}

class Stacks<T>{
    private var linkedList : LinkedList<T> = LinkedList<T>(root: nil)
    
    // Push Operation: Push element at the top
    func push(element: T){
        if let root = linkedList.root{
            let rootNode = root
            linkedList.root = Node.init(data: element, next: rootNode)
        }else{
            linkedList.root = Node.init(data: element, next: nil)
        }
    }
    
    // Pop Operation: Pop the top element
    func pop(){
        if let root = linkedList.root{
            linkedList.root = root.next
        }
    }
    
    // Peek opperation: Get the top index
    func peek() -> Node<T>?{
        return linkedList.root
    }
    
    // isEmpty Operation: Check if the stack is empty or not
    func isEmpty() -> Bool{
        if let _ = linkedList.root{
            return false
        }
        return true
    }
    
    func printStack(withPrefix prefix : String){
        var arr : [T] = [T]()
        guard let root = linkedList.root else{
            print("\(prefix): \(arr)")
            return
        }
        var temp : Node? = root
        while temp != nil {
            if let data = temp?.data{
                arr.append(data)
            }
            temp = temp?.next
        }
        print("\(prefix): \(arr)")
    }
}

let stack : Stacks<Int> = Stacks<Int>()
stack.printStack(withPrefix: "Initial Stack")
stack.push(element: 1)
stack.printStack(withPrefix: "Pushed 1")
stack.push(element: 2)
stack.printStack(withPrefix: "Pushed 2")
stack.push(element: 3)
stack.printStack(withPrefix: "Pushed 3")
stack.pop()
stack.printStack(withPrefix: "Poped top")
stack.push(element: 4)
stack.printStack(withPrefix: "Pushed 4")
stack.printStack(withPrefix: "Check if Empty - \(stack.isEmpty())")
stack.printStack(withPrefix: "Top of the stack - \(stack.peek())")


