//
//  DijkstraSP.swift
//  算法4
//
//  Created by liushan on 2019/6/11.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DijkstraAllPairsSP {
    private var all = [DijkstraSP]()
    
    init(_ G: EdgeWeightedDigraph) {
        for v in 0..<G.V {
            all.append(DijkstraSP(G, v))
        }
    }
    
    func path(from s: Int, to t: Int) -> [DirectedEdge]? {
        return all[s].pathTo(t)
    }
    
    func dist(from s: Int, to t: Int) -> Double {
        return all[s].distTo[t]
    }
}

class DijkstraSP {
    private var edgeTo: [DirectedEdge?]
    private(set) var distTo: [Double]
    private var pq = IndexMinPQ<Double>()
    
    init(_ G: EdgeWeightedDigraph, _ s: Int) {
        edgeTo = [DirectedEdge?](repeating: nil, count: G.V)
        distTo = [Double](repeating: Double.infinity, count: G.V)
        distTo[s] = 0
        pq.insert((0, 0.0))
        while !pq.isEmpty {
            relax(G, pq.delMin())
        }
    }
    
    private func relax(_ G: EdgeWeightedDigraph, _ v: Int) {
        for e in G.adj[v] {
            let w = e.to
            if distTo[w] > distTo[v] + e.weight {
                distTo[w] = distTo[v] + e.weight
                edgeTo[w] = e
                pq.update((w, distTo[w]))
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
