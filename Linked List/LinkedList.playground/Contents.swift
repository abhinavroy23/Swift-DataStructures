// Copyright 2020 Abhinav Roy, All rights reserved.
// Implementation of Linked List in Swift and all basic operations
import Foundation
import UIKit

class Node<T : Comparable>{
    var data : T?
    var next : Node<T>?
    
    init(data: T?, next : Node<T>?) {
        self.data = data
        self.next = next
    }
}
class LinkedList<T : Comparable>{
    var root : Node<T>?
    
    init(root : Node<T>?) {
        self.root = root
    }
}

//MARK: Insert in Linked List
//Insert at end
func insertAtEnd<T : Comparable>(inLinkedList linkedList : inout LinkedList<T>, data : T){
    let nodeToInsert = Node.init(data: data, next: nil)
    guard let root = linkedList.root else{
        linkedList.root = nodeToInsert
        return
    }
    var endNode : Node<T>? = root
    while endNode?.next != nil {
        endNode = endNode?.next
    }
    endNode?.next = nodeToInsert
}
//Insert at index
func insertAtIndex<T : Comparable>(inLinkedList linkedList : inout LinkedList<T>, index : Int, data : T){
    let nodeToInsert = Node.init(data: data, next: nil)
    guard let root = linkedList.root else{
        return
    }
    var tempNode : Node<T>? = root
    var currentIndex : Int = 0
    while tempNode?.next != nil && currentIndex < index-1 {
        tempNode = tempNode?.next
        currentIndex = currentIndex + 1
    }
    //add element after temp node
    if currentIndex == index-1{
        nodeToInsert.next = tempNode?.next
        tempNode?.next = nodeToInsert
    }else{
        print("Error: Index doesn't exist")
    }
}

//MARK: Delete at index
func deleteInLinkedList<T : Comparable>(linkedList : LinkedList<T>, atIndex index : Int){
    guard let root = linkedList.root else{
        print("Error: Linked list is empty")
        return
    }
    var currentIndex : Int = 0
    var currentNode : Node<T>? = root
    while currentNode?.next != nil && currentIndex < index-1 {
        currentNode = currentNode?.next
        currentIndex = currentIndex + 1
    }
    if currentIndex == index-1{
        currentNode?.next = currentNode?.next?.next
    }else{
        print("Error: Index doesn't exist")
    }
}


//MARK: Helper methods
// Create Linked List from array
func getDummyLinkedList<T : Comparable>(withData data : [T]) -> LinkedList<T>{
    
    func append<T : Comparable>(root : inout Node<T>?, data : T){
        let nodeToInsert = Node.init(data: data, next: nil)
        guard let _ = root else{
            root = nodeToInsert
            return
        }
        var endNode : Node<T>? = root
        while endNode?.next != nil {
            endNode = endNode?.next
        }
        endNode?.next = nodeToInsert
    }
    
    let resultList : LinkedList<T> = LinkedList<T>.init(root: nil)
    guard data.count > 0 else {
        return resultList
    }
    var rootNode : Node<T>?
    for elem in data{
        append(root: &rootNode, data: elem)
    }
    resultList.root = rootNode
    return resultList
}

//Print linked list
func printLinkedList<T : Comparable>(list : LinkedList<T>, withTitle title: String){
    var root : Node<T>? = list.root
    var arr : [T] = [T]()
    while root != nil {
        if let data = root?.data{
            arr.append(data)
        }
        root = root?.next
    }
    print("\(title): \(arr)")
}

var ll = getDummyLinkedList(withData: [1,2,3,4,5])
printLinkedList(list: ll, withTitle: "Print linkdeList")
insertAtEnd(inLinkedList: &ll, data: 6)
printLinkedList(list: ll, withTitle: "Insert 6 at the end")
insertAtIndex(inLinkedList: &ll, index: 2, data: 7)
printLinkedList(list: ll, withTitle: "Insert 7 at index 2")
deleteInLinkedList(linkedList: ll, atIndex: 2)
printLinkedList(list: ll,withTitle: "Delete element at index 2")
