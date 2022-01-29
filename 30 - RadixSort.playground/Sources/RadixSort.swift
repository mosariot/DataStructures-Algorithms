extension Array where Element == Int {
    
    public mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            forEach { number in
                let remainingPart = number / digits
                if remainingPart > 0 { done = false }
                let digit = remainingPart % base
                buckets[digit].append(number)
            }
            digits *= base
            self = buckets.flatMap { $0 }
        }
    }
}
