//
//  EdgeWeightedGraph.swift
//  算法4
//
//  Created by liushan on 2019/6/4.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class EdgeWeightedGraph {
    let V: Int
    private(set) var E: Int
    private(set) var adj: [[Edge]]
    
    init(_ V: Int) {
        self.V = V
        self.E = 0
        adj = [[Edge]](repeating: [Edge](), count: V)
    }
    
    init(_ input: String) {
        var lines = input.split(separator: "\n")
        V = Int(lines.removeFirst())!
        E = 0
        adj = [[Edge]](repeating: [Edge](), count: V)
        for line in lines.dropFirst() {
            var points = line.split(separator: " ")
            let v = Int(points.removeFirst())!
            let w = Int(points.removeFirst())!
            let weight = Double(points.removeFirst())!
            addEdge(Edge(v, w, weight))
        }
    }
    
    func addEdge(_ e: Edge) {
        let v = e.either()
        let w = e.other(v)
        adj[v].insert(e, at: 0)
        adj[w].insert(e, at: 0)
        E += 1
    }
}
