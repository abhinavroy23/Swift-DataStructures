import UIKit

// Graph representation
// 1. Adjency Matrix
// 2. Adjacency List


// Graph representation as ADJACENCY MATRIX in Swift
class Graph{
    private var matrix : [[Bool]]
    private var numberOfNodes : Int
    
    init(_ nodesCount : Int) {
        self.numberOfNodes = nodesCount
        matrix = Array.init(repeating: Array.init(repeating: false, count: numberOfNodes), count: numberOfNodes)
    }
    
    //Add edge
    func addEdge(_ u : Int,_ v : Int){
        matrix[u][v] = true
        matrix[v][u] = true
    }
    
    //Remove Edge
    func removeEdge(_ u : Int,_ v : Int){
        matrix[u][v] = false
        matrix[v][u] = false
    }
    
    //check if edge
    func isEdge(_ u : Int,_ v : Int) -> Bool{
        return matrix[u][v]
    }
    
    //Utility function to print graph
    func printGraph(){
        for i in 0..<matrix.count{
            var rowStr : String = ""
            for j in 0..<matrix[i].count{
                let element = matrix[i][j]
                rowStr.append("\(element)   ")
            }
            print(rowStr)
        }
    }
    
}

let grph : Graph = Graph.init(5)
grph.addEdge(0, 1)
grph.addEdge(1, 2)
grph.addEdge(2, 3)
grph.addEdge(3, 4)
grph.addEdge(4, 0)
grph.addEdge(1, 4)
grph.addEdge(1, 3)
grph.printGraph()
