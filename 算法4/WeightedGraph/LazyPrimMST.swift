//
//  LazyPrimMST.swift
//  算法4
//
//  Created by liushan on 2019/6/4.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class LazyPrimMST {
    private var marked: [Bool]
    private var mst = [Edge]() // 最小生成树的边，队列
    private var pq = [Edge]() // 横切边，优先队列
    
    init(_ G: EdgeWeightedGraph) {
        marked = [Bool](repeating: false, count: G.V)
        visit(G, 0)
        while !pq.isEmpty {
            let e = pq.removeFirst()
            let v = e.either()
            let w = e.other(v)
            if marked[v] && marked[w] {
                continue
            }
            mst.append(e)
            if !marked[v] { visit(G, v) }
            if !marked[w] { visit(G, w) }
        }
    }
    
    private func visit(_ G: EdgeWeightedGraph, _ v: Int) {
        marked[v] = true
        for e in G.adj[v] {
            if !marked[e.other(v)] {
                pq.append(e)
            }
        }
        pq.sort()
    }
    
    func edges() -> [Edge] {
        return mst
    }
    
    func weight() -> Double {
        var weight: Double = 0
        _ = mst.map { weight += $0.weight }
        return weight
    }
}
