// Copyright 2020 Abhinav Roy, All rights reserved.
// Implementation of [STACKS as Array] in Swift with all basic operations
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

class Stack<T>{
    private var top : Int?
    private var array : [T] = [T]()

    // Push Operation: Push element at the top
    func push(element : T){
        if let top = self.top{
            self.top = top + 1
        }else{
            self.top = 0
        }
        self.array.append(element)
    }
    
    // Pop Operation: Pop the top element
    func pop(){
        if let top = self.top{
            self.array.remove(at: top)
            self.top = top - 1
        }else{
            print("Stack is Empty, Nothing to Pop.")
        }
    }
    
    // Peek opperation: Get the top index
    func peek() -> Int?{
        return self.top
    }
    
    // isEmpty Operation: Check if the stack is empty or not
    func isEmpty() -> Bool{
        if let _ = self.top{
            return false
        }
        return true
    }
    
    func printStack(withPrefix prefix : String = ""){
        print("\(prefix): \(self.array)")
    }
}

let stack : Stack<Int> = Stack<Int>()
stack.push(element: 1)
stack.printStack(withPrefix: "Pushed 1")
stack.push(element: 2)
stack.printStack(withPrefix: "Pushed 2")
stack.push(element: 3)
stack.printStack(withPrefix: "Pushed 3")
stack.pop()
stack.printStack(withPrefix: "Poped top")
stack.printStack(withPrefix: "Check if emoty - \(stack.isEmpty())")
stack.push(element: 4)
stack.printStack(withPrefix: "Pushed 4")
stack.printStack(withPrefix: "Stack's top index - \(stack.peek())")
