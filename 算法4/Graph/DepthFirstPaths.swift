//
//  DepthFirstPaths.swift
//  算法4
//
//  Created by liushan on 2019/5/28.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DepthFirstPaths {
    private var marked: [Bool]
    private var edgeTo: [Int?]
    private let s: Int
    
    init(_ G: Graph, _ s: Int) {
        marked = [Bool](repeating: false, count: G.V)
        edgeTo = [Int?](repeating: nil, count: G.V)
        self.s = s
        dfs(G, s)
    }
    
    private func dfs(_ G: Graph, _ v: Int) {
        marked[v] = true
        _ = G.adj(v).map{ if !marked[$0] {edgeTo[$0] = v; dfs(G, $0)} }
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
