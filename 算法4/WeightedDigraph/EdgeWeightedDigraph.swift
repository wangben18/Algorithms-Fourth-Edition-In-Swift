//
//  EdgeWeightedDigraph.swift
//  算法4
//
//  Created by liushan on 2019/6/6.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class EdgeWeightedDigraph {
    let V: Int
    private(set) var E: Int
    private(set) var adj: [[DirectedEdge]]
    
    init(_ V: Int) {
        self.V = V
        self.E = 0
        adj = [[DirectedEdge]](repeating: [DirectedEdge](), count: V)
    }
    
    init(_ input: String) {
        var lines = input.split(separator: "\n")
        V = Int(lines.removeFirst())!
        E = 0
        adj = [[DirectedEdge]](repeating: [DirectedEdge](), count: V)
        for line in lines.dropFirst() {
            var points = line.split(separator: " ")
            let v = Int(points.removeFirst())!
            let w = Int(points.removeFirst())!
            let weight = Double(points.removeFirst())!
            addEdge(DirectedEdge(from: v, to: w, weight))
        }
    }
    
    func addEdge(_ e: DirectedEdge) {
        adj[e.from].insert(e, at: 0)
        E += 1
    }
    
    func edges() -> [DirectedEdge] {
        var edges = [DirectedEdge]()
        for v in 0..<V {
            for edge in adj[v] {
                edges.append(edge)
            }
        }
        return edges
    }
}
