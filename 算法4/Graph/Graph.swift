//
//  Graph.swift
//  算法4
//
//  Created by liushan on 2019/5/28.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

public class Graph {
    public let V: Int
    private(set) var E: Int
    private var adj: [[Int]]
    
    init(_ V: Int) {
        self.V = V
        self.E = 0
        adj = [[Int]](repeating: [Int](), count: V)
    }
    
    init(_ input: String) {
        var lines = input.split(separator: "\n")
        V = Int(lines.removeFirst())!
        E = 0
        adj = [[Int]](repeating: [Int](), count: V)
        for line in lines.dropFirst() {
            let points = line.split(separator: " ")
            let v = Int(points.first!)!
            for w in points.dropFirst() {
                addEdge(v, Int(String(w))!)
            }
        }
    }
    
    public func addEdge(_ v: Int, _ w: Int) {
        adj[v].insert(w, at: 0)
        adj[w].insert(v, at: 0)
        E += 1
    }
    
    public func adj(_ v: Int) -> [Int] {
        return adj[v]
    }
    
    public func degree(_ v: Int) -> Int {
        return adj(v).count
    }
    
    public func maxDegree() -> Int {
        return adj.max(by: { (a, b) -> Bool in
            return a.count > b.count
        })!.count
    }
    
    public func avgDegree() -> Double {
        return 2.0 * Double(E) / Double(V)
    }
    
    public func numberOfSelfLoops() -> Int {
        var count = 0
        for v in 0..<V {
            for w in adj(v) {
                if v == w {
                    count += 1
                }
            }
        }
        return count/2
    }
    
    public func description() -> String {
        var s = "\(V) vertices, \(E) edges\n"
        for v in 0..<V {
            s += "\(v): "
            for w in adj(v) {
                s += "\(w) "
            }
            s += "\n"
        }
        return s
    }
}

class Cycle {
    private(set) var marked: [Bool]
    private(set) var hasCycle = false
    
    init(_ G: Graph) {
        marked = [Bool](repeating: false, count: G.V)
        for s in 0..<G.V {
            if !marked[s] {
                dfs(G, s, s)
            }
        }
    }
    
    private func dfs(_ G: Graph, _ v: Int, _ u: Int) {
        marked[v] = true
        for w in G.adj(v) {
            if !marked[w] {
                dfs(G, w, v)
            } else if w != u {
                hasCycle = true
            }
        }
    }
}

class TwoColor {
    private(set) var marked: [Bool]
    private var color: [Bool]
    private(set) var isTwoColorable = true
    
    init(_ G: Graph) {
        marked = [Bool](repeating: false, count: G.V)
        color = [Bool](repeating: false, count: G.V)
        for s in 0..<G.V {
            if !marked[s] {
                dfs(G, s)
            }
        }
    }
    
    private func dfs(_ G: Graph, _ v: Int) {
        marked[v] = true
        for w in G.adj(v) {
            if !marked[w] {
                color[w] = !color[v]
                dfs(G, w)
            } else if color[w] == color[v] {
                isTwoColorable = false
            }
        }
    }
}
