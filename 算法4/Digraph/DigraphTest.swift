//
//  DigraphTest.swift
//  算法4
//
//  Created by liushan on 2019/5/30.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DigraphTest {
    
    static func main() {
        TopologicalTest()
    }
    
    static func DigraphTest() {
        print(Digraph(file(named: "tinyDG.txt")).description())
    }
    
    static func DirectedDFSTest() {
        let G = Digraph(file(named: "tinyDG.txt"))
        let reachable = DirectedDFS(G, 2)
        for v in 0..<G.V {
            if reachable.marked[v] {
                print("\(v)", terminator: " ")
            }
        }
        print("")
    }
    
    static func TopologicalTest() {
        let sg = SymbolDigraph(file(named: "jobs.txt"), "/")
        let top = Topological(sg.G)
        guard let order = top.order else {
            print("order is nil")
            return
        }
        for v in order {
            print(sg.name(v))
        }
    }
}
