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
        CPM()
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
    
    static func CPM() {
        let text = file(named: "jobsPC.txt")
        var lines = text.split(separator: "\n")
        let N = Int(lines.removeFirst())!
        let G = EdgeWeightedDigraph(2*N+2)
        let s = 2 * N
        let t = s + 1
        for i in 0..<N {
            let a = lines.removeFirst().split(separator: " ")
            let duration = Double(a[0])!
            G.addEdge(DirectedEdge(from: i, to: i+N, duration))
            G.addEdge(DirectedEdge(from: s, to: i, 0.0))
            
            G.addEdge(DirectedEdge(from: i+N, to: t, 0.0))
            for j in 2..<a.count {
                let successor = Int(a[j])!
                G.addEdge(DirectedEdge(from: i+N, to: successor, 0.0))
            }
        }
        let lp = AcyclicLP(G, s)
        print("Start times:")
        for i in 0..<N {
            print("\(i.format(f: "4")): \(lp.distTo[i].format(f: "5.1"))")
        }
        print("Finish time: \(lp.distTo[t].format(f: "5.1"))")
    }
}

extension Int {
    func format(f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
