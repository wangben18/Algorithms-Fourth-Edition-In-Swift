//
//  AcyclicSP.swift
//  算法4
//
//  Created by liushan on 2019/6/11.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class AcyclicSP {
    private var edgeTo: [DirectedEdge?]
    private(set) var distTo: [Double]
    
    init(_ G: EdgeWeightedDigraph, _ s: Int) {
        edgeTo = [DirectedEdge?](repeating: nil, count: G.V)
        distTo = [Double](repeating: Double.infinity, count: G.V)
        distTo[s] = 0
        let top = Topological(Digraph(G))
        for v in top.order! {
            relax(G, v)
        }
    }
    
    private func relax(_ G: EdgeWeightedDigraph, _ v: Int) {
        for e in G.adj[v] {
            let w = e.to
            if distTo[w] > distTo[v] + e.weight {
                distTo[w] = distTo[v] + e.weight
                edgeTo[w] = e
            }
        }
    }
    
    func hasPathTo(_ v: Int) -> Bool {
        return distTo[v] < Double.infinity
    }
    
    func pathTo(_ v: Int) -> [DirectedEdge]? {
        guard hasPathTo(v) else { return nil }
        var path = [DirectedEdge]()
        
        var e = edgeTo[v]
        while e != nil {
            path.insert(e!, at: 0)
            e = edgeTo[e!.from]
        }
        return path
    }
}

extension Digraph {
    convenience init(_ G: EdgeWeightedDigraph) {
        self.init(G.V)
        for v in 0..<G.V {
            for w in G.adj[v] {
                addEdge(v, w.to)
            }
        }
    }
}
