import UIKit

// Graph Traversal
// 1. BFS
// 2. DFS

// Breadth first traversal BFS of a graph
// For graph image refer this link
// Link - https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/

//Linked List implementation
class Node{
    var data : Int?
    var next : Node?
    
    init(data : Int?, next : Node?) {
        self.data = data
        self.next = next
    }
}

//Graph Implementation
class Graph{
    private var indexTable : [Int : Node?] = [Int : Node?]()
    
    func addVertices(_ vertices : [Int]){
        for vertex in vertices{
            if !indexTable.keys.contains(vertex){
                indexTable.updateValue(nil, forKey: vertex)
            }
        }
    }
    
    //Add Edge
    func addEdge(_ u : Int,_ v : Int){
        if let root = indexTable[u] as? Node{
            var node : Node?  = root
            while node?.next != nil {
                node = node?.next
            }
            node?.next = Node(data: v, next: nil)
        }else{
            indexTable[u] = Node(data: v, next: nil)
        }
    }
    
    //Delete Edge
    func deleteEdge(_ u : Int,_ v : Int){
        if let root = indexTable[u] as? Node{
            if let data = root.data, v == data{
                indexTable[u] = nil
            }else{
                var node : Node? = root
                while node?.next != nil{
                    if v == node?.next?.data{
                        node?.next = node?.next?.next
                    }else{
                        node = node?.next
                    }
                }
            }
        }else{
            print("Edge (\(u),\(v)) does not exist")
        }
    }
    
    //isEdge
    func isEdge(_ u : Int,_ v : Int) -> Bool{
       if let root = indexTable[u] as? Node{
            if let data = root.data, v == data{
                return true
            }else{
                var node : Node? = root
                while node?.next != nil{
                    if v == node?.next?.data{
                        return true
                    }
                    node = node?.next
                }
            }
        }
        return false
    }
    
    //Utility function to print graph
    func printGraph(){
        for (key,value) in indexTable{
            var row : String = "\(key) -> "
            if let value = value{
                var node : Node? = value
                while node != nil {
                    if let data = node?.data{
                        row.append("\(data)    ")
                    }
                    node = node?.next
                }
            }
            print(row)
        }
    }
}

//Queue implementation
class Queue{
    private var array : [Int] = [Int]()
    
    //push from rear
    func push(_ element : Int){
        array.append(element)
    }
    
    //delete from front
    func pop() -> Int?{
        if array.count > 0{
            let element = array[0]
            array.remove(at: 0)
            return element
        }
        return nil
    }
    
    func isEmpty() -> Bool{
        return array.count == 0
    }
}

// extension Graph class to impmenent size and adjancent elements
extension Graph{
    
    //size
    func size() -> Int{
        return indexTable.count
    }
    
    func getAdjacentList(_ source : Int) -> Node?{
        return indexTable[source] as? Node
    }
    
}

// BFS traversal from a given source
func BFSTraversal(_ graph : Graph, _ source : Int){
    guard source < graph.size() else {
        return
    }
    
    var queue : Queue = Queue()
    var visited : [Bool] = Array(repeating: false, count: graph.size())
    
    //append initial node to queue
    queue.push(source)
    visited[source] = true
    
    while !queue.isEmpty() {
        if let s = queue.pop(){
            print("\(s)", separator: "", terminator: "   ") //print without line
            if let adjacentList = graph.getAdjacentList(s) as? Node{
                var node : Node? = adjacentList
                while node != nil{
                    if let data = node?.data{
                        if !visited[data]{
                            visited[data] = true
                            queue.push(data)
                        }
                    }
                    node = node?.next
                }
            }
        }
    }
    print() //newline
}

//Test cases
let grp : Graph = Graph()
grp.addVertices([0,1,2,3,4])
grp.addEdge(0, 1)
grp.addEdge(0, 2)
grp.addEdge(1, 2)
grp.addEdge(2, 0)
grp.addEdge(2, 3)
grp.addEdge(3, 3)

BFSTraversal(grp, 2)

let grp1 : Graph = Graph()
grp1.addVertices([0,1,2,3,4,5])
grp1.addEdge(0, 1)
grp1.addEdge(1, 2)
grp1.addEdge(2, 3)
grp1.addEdge(3, 4)
grp1.addEdge(0, 2)
grp1.addEdge(1, 3)
grp1.addEdge(4, 0)
grp1.addEdge(4, 1)
grp1.addEdge(4, 5)

BFSTraversal(grp1, 0)


