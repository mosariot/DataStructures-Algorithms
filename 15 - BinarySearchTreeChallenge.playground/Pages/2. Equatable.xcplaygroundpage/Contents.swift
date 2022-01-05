// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ### #2. Equatable
 The binary search tree currently lacks `Equatable` conformance. Your challenge is to conform adopt the `Equatable` protocol.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
bst2.insert(4)

print(bst2)

var bst3 = BinarySearchTree<Int>()
bst3.insert(3)
bst3.insert(1)
bst3.insert(4)
bst3.insert(0)
bst3.insert(2)
bst3.insert(5)

print(bst3)

print(bst == bst2)
print(bst == bst3)

extension BinarySearchTree: Equatable {
    
    public static func ==(lhs: BinarySearchTree, rhs: BinarySearchTree) -> Bool {
        isEqual(lhs: lhs.root, rhs: rhs.root)
//        isEqualBookEdition(lhs.root, rhs.root)
    }
    
    private static func isEqual<Element: Equatable>(
        lhs: BinaryNode<Element>?,
        rhs: BinaryNode<Element>?) -> Bool {
            if lhs == nil && rhs == nil { return true }
            if (lhs != nil && rhs == nil) || (lhs == nil && rhs != nil) { return false }
            guard lhs!.value == rhs!.value else { return false }
            return isEqual(lhs: lhs?.leftChild, rhs: rhs?.leftChild) &&
                   isEqual(lhs: lhs?.rightChild, rhs: rhs?.rightChild)
        }
    
    private static func isEqualBookEdition<Element: Equatable>(
        _ node1: BinaryNode<Element>?,
        _ node2: BinaryNode<Element>?) -> Bool {
            guard let node1 = node1, let node2 = node2 else {
                return node1 == nil && node2 == nil
            }

            return node1.value == node2.value &&
                   isEqualBookEdition(node1.leftChild, node2.leftChild) &&
                   isEqualBookEdition(node1.rightChild, node2.rightChild)
        }
    
}


//: [Next Challenge](@next)
