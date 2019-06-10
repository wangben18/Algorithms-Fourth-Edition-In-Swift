//
//  BreadthFirstPaths.swift
//  算法4
//
//  Created by liushan on 2019/5/29.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class BreadthFirstPaths {
    private var marked: [Bool]
    private var edgeTo: [Int?]
    private let s: Int
    
    init(_ G: Graph, _ s: Int) {
        marked = [Bool](repeating: false, count: G.V)
        edgeTo = [Int?](repeating: nil, count: G.V)
        self.s = s
        bfs(G, s)
    }
    
    private func bfs(_ G: Graph, _ s: Int) {
        marked[s] = true
        var queue = [Int]()
        queue.append(s)
        while !queue.isEmpty {
            let v = queue.removeFirst()
            for w in G.adj(v) {
                if !marked[w] {
                    edgeTo[w] = v
                    marked[w] = true
                    queue.append(w)
                }
            }
        }
    }
    
    public func hasPathTo(_ v: Int) -> Bool {
        return marked[v]
    }
    
    public func pathTo(_ v: Int) -> [Int] {
        guard hasPathTo(v) else { return [] }
        var path = [Int]()
        var x: Int? = v
        while x != nil && x != s {
            path.insert(x!, at: 0)
            x = edgeTo[x!]
        }
        path.insert(s, at: 0)
        return path
    }
}
