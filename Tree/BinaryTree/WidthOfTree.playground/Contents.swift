import UIKit

import UIKit

class Node<T>{
    var data : T?
    var left:  Node<T>?
    var right : Node<T>?
    
    init(data : T?, left: Node<T>?, right : Node<T>?) {
        self.data = data
        self.left = left
        self.right = right
    }
}

class BinaryTree<T>{
    var root : Node<T>?
    
    init(root : Node<T>?) {
        self.root = root
    }
}

//Sample Tree
/*
 0
 /     \
 1        2
 /   \     /   \
 3     4   5     6
 / \   /
 7   8 9
 
 Inorder - 7 3 8 1 9 4 0 5 2 6
 Preorder - 0 1 3 7 8 4 9 2 5 6
 Postorder - 7 8 3 9 4 1 5 6 2 0
 BFS - 0 1 2 3 4 5 6 7 8 9
 
 */
let node0 = Node.init(data: 0, left: nil, right: nil)
let node1 = Node.init(data: 1, left: nil, right: nil)
let node2 = Node.init(data: 2, left: nil, right: nil)
let node3 = Node.init(data: 3, left: nil, right: nil)
let node4 = Node.init(data: 4, left: nil, right: nil)
let node5 = Node.init(data: 5, left: nil, right: nil)
let node6 = Node.init(data: 6, left: nil, right: nil)
let node7 = Node.init(data: 7, left: nil, right: nil)
let node8 = Node.init(data: 8, left: nil, right: nil)
let node9 = Node.init(data: 9, left: nil, right: nil)

var tree : BinaryTree = BinaryTree(root: node0)
node0.left = node1
node0.right = node2
node1.left = node3
node1.right = node4
node2.left = node5
node2.right = node6
node3.left = node7
node3.right = node8
node4.left = node9

//Obtain height of tree
func getHeightOfTree(_ root : Node<Int>?) -> Int{ // Complexity - O(n)
    guard let root = root else{
        return 0
    }
    return 1 + max(getHeightOfTree(root.left),getHeightOfTree(root.right))
}

//Width of the tree
func widthOfTree(_ root : Node<Int>?) -> Int{
    
    func getWidthAtLevel(_ root : Node<Int>?,_ level : Int) -> Int{
        guard let root = root else{
            return 0
        }
        
        if level == 1{
            return 1
        }else{
            return getWidthAtLevel(root.left, level-1) + getWidthAtLevel(root.right, level-1)
        }
    }
    
    guard let root = root else{
        return 0
    }
    var maxWidth = Int.min
    for i in 1...getHeightOfTree(root){
        let widthAtLevel = getWidthAtLevel(root, i)
        if widthAtLevel > maxWidth{
            maxWidth = widthAtLevel
        }
    }
    return maxWidth
}
print("WidthOfTree O(n^2): \(widthOfTree(tree.root))")

//Width of tree using queue
func widthOfTreeUsingQueue(_ root : Node<Int>?) -> Int{
    class BFSQueue<T>{ // FIFO
        private var array : [Node<T>] = []
        
        func push(_ node : Node<T>){
            array.append(node)
        }
        
        func pop() -> Node<T>?{
            if array.count > 0{
                let node = array[0]
                array.remove(at: 0)
                return node
            }
            return nil
        }
        
        func size() -> Int{
            return array.count
        }
        
        func isEmpty() -> Bool{
            return array.count == 0
        }
        
        func printQueue(){
            print(array.map{$0.data!})
        }
    }
    
    guard let root = root else{
        return 0
    }
    let queue : BFSQueue<Int> = BFSQueue<Int>()
    
    queue.push(root)
    var maxWidth = 1
    
    while !queue.isEmpty() {
        for _ in 0..<queue.size(){
            if let node = queue.pop(){
                if let left = node.left{
                    queue.push(left)
                }
                if let right = node.right{
                    queue.push(right)
                }
            }
        }
        if maxWidth < queue.size(){
            maxWidth = queue.size()
        }
    }
    return maxWidth
}
print("WidthOfTree O(n): \(widthOfTreeUsingQueue(tree.root))")
