//
//  WeightedDigraphTest.swift
//  算法4
//
//  Created by liushan on 2019/6/11.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class WeightedDigraphTest {
    static func main() {
        AcyclicSPTest()
    }
    
    static func AcyclicSPTest() {
        let G = EdgeWeightedDigraph(file(named: "tinyEWDAG.txt"))
        let s = 5
        let sp = AcyclicSP(G, s)
        for v in 0..<G.V {
            print("\(s) to \(v) (\(sp.distTo[v].format(f: ".2")))", terminator: ": ")
            for edge in sp.pathTo(v)! {
                print("\(edge.from)->\(edge.to) \((sp.distTo[edge.to]-sp.distTo[edge.from]).format(f: ".2"))", terminator: "  ")
            }
            print()
        }
    }
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
