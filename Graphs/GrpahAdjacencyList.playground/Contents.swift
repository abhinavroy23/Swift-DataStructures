import UIKit

// Graph representation
// 1. Adjency Matrix
// 2. Adjacency List


// Graph representation as ADJACENCY LIST in Swift
class Graph{
    class Node{
        var data : Int?
        var next : Node?
        
        init(data : Int?, next : Node?) {
            self.data = data
            self.next = next
        }
    }
    
    private var indexTable : [Int : Node?] = [Int : Node?]()
    
    //Add Vertex
    func addVertex(_ u : Int){
        if !indexTable.keys.contains(u){
            indexTable.updateValue(nil, forKey: u)
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

let grph : Graph = Graph()
//add vertices
grph.addVertex(0)
grph.addVertex(1)
grph.addVertex(2)
grph.addVertex(3)
grph.addVertex(4)
//add edges
grph.addEdge(0, 1)
grph.addEdge(0, 4)
grph.addEdge(1, 0)
grph.addEdge(1, 2)
grph.addEdge(1, 3)
grph.addEdge(1, 4)
grph.addEdge(2, 1)
grph.addEdge(2, 3)
grph.addEdge(3, 1)
grph.addEdge(3, 2)
grph.addEdge(3, 4)
grph.addEdge(4, 0)
grph.addEdge(4, 1)
grph.addEdge(4, 3)
//print graph
print("printing graph...")
grph.printGraph()
//delete edge
grph.deleteEdge(1, 3)
//print graph
print("printing graph after deleting (1,3)")
grph.printGraph()
