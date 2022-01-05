// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ### #3. Comparing Trees
 Create a method that checks if the current tree contains all the elements of another tree.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
bst2.insert(100)

extension BinarySearchTree {
    
    func contains<Element: Hashable>(_ tree: BinarySearchTree<Element>) -> Bool {
        var originalSet = Set<Element>()
        var secondSet = Set<Element>()
        root?.traverseInOrder { originalSet.insert($0 as! Element) }
        tree.root?.traverseInOrder { secondSet.insert($0) }
        let originalCount = originalSet.count
        for element in secondSet {
            originalSet.insert(element)
        }
        return originalCount == originalSet.count
    }
}

extension BinarySearchTree where Element: Hashable {
    
    public func containsBookEdition(_ subtree: BinarySearchTree) -> Bool {
        var set: Set<Element> = []
        root?.traverseInOrder { set.insert($0) }
        var isEqual = true
        subtree.root?.traverseInOrder { isEqual = isEqual && set.contains($0) }
        return isEqual
    }
}

bst.contains(bst2)
bst.containsBookEdition(bst2)
