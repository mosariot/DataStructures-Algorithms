// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Depth-First Search Challenges
 ## 1. BFS or DFS
 
 For each of the following two examples, which traversal (depth-first or
 breadth-first) is better for discovering if a path exists between the
 two nodes? Explain why.
 
 ![Graph](dfschallenge1.png)
 
 Path from **A** to **F**.
 */
// DFS is better, if B has been connected to A before G. Otherwise performance of DFS will be as well as for BFS.
/*:
 Path from **A** to **G**.
 */
// BFS is better, is B has been connected to A before G. Otherwise peformance of BFS will be as well as for DFS.
//: [Next Challenge](@next)
