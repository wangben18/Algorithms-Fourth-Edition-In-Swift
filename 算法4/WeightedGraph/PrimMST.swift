//
//  PrimMST.swift
//  算法4
//
//  Created by liushan on 2019/6/5.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class PrimMST {
    private var edgeTo: [Edge?]
    private var distTo: [Double]
    private var marked: [Bool]
    private var pq = IndexMinPQ<Double>()
    
    var edges: [Edge] {
        return edgeTo.dropFirst().map { return $0! }
    }
    
    var weight: Double {
        var distance: Double = 0
        for dist in distTo {
            distance += dist
        }
        return distance
    }
    
    init(_ G: EdgeWeightedGraph) {
        edgeTo = [Edge?](repeating: nil, count: G.V)
        distTo = [Double](repeating: Double.infinity, count: G.V)
        marked = [Bool](repeating: false, count: G.V)
        
        distTo[0] = 0.0
        pq.insert((0, 0.0))
        while !pq.isEmpty {
            visit(G, pq.delMin())
        }
    }
    
    private func visit(_ G: EdgeWeightedGraph, _ v: Int) {
        marked[v] = true
        for e in G.adj[v] {
            let w = e.other(v)
            if marked[w] { continue }
            if e.weight < distTo[w] {
                edgeTo[w] = e
                distTo[w] = e.weight
                pq.update((w, e.weight))
            }
        }
    }
    
//    func edges() -> [Edge] {
//        return edgeTo.dropFirst().map { return $0! }
//    }
}

class IndexMinPQ<Element: Comparable> {
    private var items = [(Int, Element)]()
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    func insert(_ item: (Int, Element)) {
        items.append(item)
        items.sort { return $0.1 < $1.1 }
    }
    
    func delMin() -> Int {
        let minIndex = items[0].0
        items.remove(at: 0)
        return minIndex
    }

    func update(_ item: (Int, Element)) {
        if items.contains(where: { (key, _) -> Bool in
            return key == item.0
        }) {
            let index = items.firstIndex { (key, _) -> Bool in
                return key == item.0
            }!
            items[index] = item
        } else {
            insert(item)
        }
    }
}
