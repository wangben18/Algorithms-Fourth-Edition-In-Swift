//
//  Digraph.swift
//  算法4
//
//  Created by liushan on 2019/5/30.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class Digraph {
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
        E += 1
    }
    
    public func adj(_ v: Int) -> [Int] {
        return adj[v]
    }
    
    public func reverse() -> Digraph {
        let R = Digraph(V)
        for v in 0..<V {
            for w in adj(v) {
                R.addEdge(w, v)
            }
        }
        return R
    }
    
    public func outDegree(_ v: Int) -> Int {
        return adj(v).count
    }
    
    public func maxOutDegree() -> Int {
        return adj.max(by: { (a, b) -> Bool in
            return a.count > b.count
        })!.count
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
        return count
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
