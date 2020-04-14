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


// DFS: Inorder traversal --> L, Ro, R
func inorder(_ root : Node<Int>?){
    guard let root = root else{
        return
    }
    if let left = root.left{
        inorder(left)
    }
    if let data = root.data{
        print(data, separator: "", terminator: " ")
    }
    if let right = root.right{
        inorder(right)
    }
}
print("Inorder:", separator: "", terminator: " ")
inorder(tree.root)
print()
