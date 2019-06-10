//
//  Edge.swift
//  算法4
//
//  Created by liushan on 2019/6/4.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class Edge {
    
    private let v: Int
    private let w: Int
    let weight: Double
    
    init(_ v: Int, _ w: Int, _ weight: Double) {
        self.v = v
        self.w = w
        self.weight = weight
    }
    
    func either() -> Int {
        return v
    }
    
    func other(_ vertex: Int) -> Int {
        if vertex == v {
            return w
        } else if vertex == w {
            return v
        } else {
            print("Inconsistent edge")
            return -1
        }
    }
    
    func description() -> String {
        return "\(v)-\(w) \(weight)"
    }
}

extension Edge: Comparable {
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight == rhs.weight
    }
}
