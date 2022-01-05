// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Binary Search Tree Challenges
 ### #1. Binary Tree or Binary Search Tree?
 
 Create a function that checks if a binary tree is a binary search tree.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

let root = BinaryNode(value: 15)
let ten = BinaryNode(value: 10)
let five = BinaryNode(value: 5)
let twelve = BinaryNode(value: 12)
let twentyFive = BinaryNode(value: 25)
let seventeen = BinaryNode(value: 17)

root.leftChild = ten
root.rightChild = twentyFive
ten.leftChild = twelve
ten.rightChild = five
twentyFive.leftChild = seventeen

var notBST = BinarySearchTree<Int>()
notBST.root = root

print(notBST)

bst.isBST()
notBST.isBST()

bst.root!.isBinarySearchTree
notBST.root!.isBinarySearchTree

extension BinarySearchTree {
    
    public func isBST() -> Bool {
        isBST(root)
    }
    
    private func isBST(_ node: BinaryNode<Element>?) -> Bool {
        guard let node = node else { return true }
        if let rightChild = node.rightChild {
            if rightChild.value <= node.value { return false }
        }
        if let leftChild = node.leftChild {
            if leftChild.value > node.value { return false }
        }
        return isBST(node.leftChild) && isBST(node.rightChild)
    }
}

extension BinaryNode where Element: Comparable {
    
    var isBinarySearchTree: Bool {
        isBST(self, min: nil, max: nil)
    }
    
    private func isBST(_ tree: BinaryNode<Element>?,
                       min: Element?, max: Element?) -> Bool {
        guard let tree = tree else { return true }
        if let min = min, tree.value <= min { return false }
        else if let max = max, tree.value > max { return false }
        
        return isBST(tree.leftChild, min: min, max: tree.value) &&
               isBST(tree.rightChild, min: tree.value, max: max)
    }
}

//: [Next Challenge](@next)

