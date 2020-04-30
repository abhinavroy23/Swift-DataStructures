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

//Diameter of the tree
// explaination - the distance between two farthest node in tree
///  value is max of one of these
///  1. diameter of left subtree
///  2. diameter of right subtree
///  3. height of left subtree + height of right subtree + 1
func diameterOfTree(_ root : Node<Int>?) -> Int{   // Complexity - O(n^2)
    guard let root = root else {
        return 0
    }
    
    //get left subtree height
    let lHeight = getHeightOfTree(root.left)
    //get right subtree height
    let rHeight = getHeightOfTree(root.right)
    
    //get diameter of left subtree
    let lDiameter = diameterOfTree(root.left)
    //get diameter of right subtree
    let rDiameter = diameterOfTree(root.right)
    
    //return max of diameter of left, diameter of right, left height + right height + 1
    return max(lDiameter, rDiameter, lHeight + rHeight + 1)
}
print("Diameter of the tree O(n^2): \(diameterOfTree(tree.root))")

// Diameter of the tree
// To calculate recursively by utilizing height logic
func diameterOfTree2(_ root : Node<Int>?,_ ans : inout Int) -> Int{
    guard let root = root else{
        return 0
    }
    
    let lHeight =  diameterOfTree2(root.left, &ans)
    let rHeight = diameterOfTree2(root.right, &ans)
    
    ans = max(ans, 1 + lHeight + rHeight)
    return 1+max(lHeight,rHeight)
}
var ans = Int.min
diameterOfTree2(tree.root, &ans)
print("Diameter of the tree2 O(n): \(ans)")
