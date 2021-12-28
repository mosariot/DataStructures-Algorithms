public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

// depth-first recursion edition
extension TreeNode {
    public func forEachDepthFirstRecursion(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach { $0.forEachDepthFirstRecursion(visit: visit) }
    }
}

// depth-first stack implementation
extension TreeNode {
    public func forEachDepthFirstStack(visit: (TreeNode) -> Void) {
        visit(self)
        var stack = Stack<TreeNode>()
        children.forEach { stack.push($0) }
        while let node = stack.pop() {
            visit(node)
            node.children.forEach { $0.forEachDepthFirstStack(visit: visit) }
        }
    }
}

// level-order
extension TreeNode {
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

// search
extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
