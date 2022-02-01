// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Breadth-First Search Challenges
 ## 1. Maximum Queue Size
 
 For the following undirected graph, list the maximum number of items ever
 in the queue. Assume that the starting vertex is A.
 
 ![Undirected Graph](maxItemInQueue.png)
 */
extension Graph where Element: Hashable {
    
    func bfsMaxQueue(from source: Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        var maxQueueCount = 0
        var currentQueueCount = 0
        
        queue.enqueue(source)
        currentQueueCount += 1
        maxQueueCount += 1
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            currentQueueCount -= 1
            visited.append(vertex)
            let neighborEdges = edges(from: vertex)
            neighborEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    currentQueueCount += 1
                    if currentQueueCount > maxQueueCount {
                        maxQueueCount = currentQueueCount
                    }
                    enqueued.insert(edge.destination)
                }
            }
        }
        print("Max queue count is: \(maxQueueCount)")
        return visited
    }
}

let graph = AdjacencyList<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")
let f = graph.createVertex(data: "F")
let g = graph.createVertex(data: "G")
let h = graph.createVertex(data: "H")
let i = graph.createVertex(data: "I")
let j = graph.createVertex(data: "J")

graph.add(.undirected, from: a, to: b, weight: nil)
graph.add(.undirected, from: a, to: c, weight: nil)
graph.add(.undirected, from: a, to: d, weight: nil)
graph.add(.undirected, from: c, to: i, weight: nil)
graph.add(.undirected, from: i, to: f, weight: nil)
graph.add(.undirected, from: i, to: g, weight: nil)
graph.add(.undirected, from: i, to: j, weight: nil)
graph.add(.undirected, from: f, to: e, weight: nil)
graph.add(.undirected, from: e, to: h, weight: nil)

graph.bfsMaxQueue(from: a)
//: [Next Challenge](@next)
