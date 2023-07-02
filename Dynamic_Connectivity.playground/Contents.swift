import UIKit

/*
 Union Find / Disjoint Set
 常用於社群媒體好友查找、好友關係
 */

class UnionFind {
    
    var parent: [Int]
    
    init(size: Int) {
        parent = Array(0..<size)
    }
    
    // UnionFind 的精神是要 Find! 找到 root
    private func find(_ x: Int) -> Int {
        var root = x
        while root != parent[root] {
            root = parent[root]
        }
        return root
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX != rootY {
            parent[rootX] = rootY
        }
    }
    
    func isConnected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}

/*
 Example
 */

let uf = UnionFind(size: 10)

uf.union(0, 1)
uf.union(2, 3)
uf.union(4, 5)
uf.union(6, 7)

print(uf.isConnected(1, 5))  // false
print(uf.isConnected(3, 2))  // true

uf.union(1, 4)

print(uf.isConnected(1, 5))  // true
