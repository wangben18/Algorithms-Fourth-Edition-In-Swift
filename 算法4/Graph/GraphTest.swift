//
//  GraphTest.swift
//  算法4
//
//  Created by liushan on 2019/5/28.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class GraphTest {
    
    static func main() {
        GraphTest()
    }
    
    static func GraphTest() {
        print(Graph(file(named: "tinyG.txt")).description())
    }
    
    static func DFSTest() {
        let G = Graph(file(named: "tinyG.txt"))
        let search = DepthFirstSearch(G, 9)
        _ = (0..<G.V).map { if search.marked[$0] { print("\($0) ", terminator: "") } }
        print("")
        print(search.count == G.V ? "Connected" : "Not connected")
    }
    
    static func DFPTest() {
        let G = Graph(file(named: "tinyCG.txt"))
        let s = 0
        let path = DepthFirstPaths(G, s)
        for v in 0..<G.V {
            print("\(s) to \(v): ", terminator: "")
            if path.hasPathTo(v) {
                for x in path.pathTo(v) {
                    if x == s { print(x, terminator: "") }
                    else { print("-\(x)", terminator: "") }
                }
                print("")
            }
        }
    }
    
    static func BFPTest() {
        let G = Graph(file(named: "tinyCG.txt"))
        let s = 0
        let path = BreadthFirstPaths(G, s)
        for v in 0..<G.V {
            print("\(s) to \(v): ", terminator: "")
            if path.hasPathTo(v) {
                for x in path.pathTo(v) {
                    if x == s { print(x, terminator: "") }
                    else { print("-\(x)", terminator: "") }
                }
                print("")
            }
        }
    }
    
    static func CCTest() {
        let G = Graph(file(named: "tinyG.txt"))
        let cc = CC(G)
        
        let M = cc.count
        print("\(M) components")
        
        var components = [[Int]](repeating: [Int](), count: M)
        for v in 0..<G.V {
            components[cc.id[v]].append(v)
        }
        for i in 0..<M {
            for v in components[i] {
                print("\(v) ", terminator: "")
            }
            print("")
        }
    }
    
    static func SymbolGraphTest(_ fileName: String, _ sp: Character) {
        let sg = SymbolGraph(file(named: fileName), sp)
        let G = sg.G
        while true {
            guard let index = sg.index(readLine()!) else { continue }
            for w in G.adj(index) {
                print("    \(sg.name(w))")
            }
        }
    }
    
    static func DegreesOfSeparation(_ fileName: String, _ sp: Character, _ source:String) {
        let sg = SymbolGraph(file(named: fileName), sp)
        guard let sourceIndex = sg.index(source) else {
            print("\(source) not in database.")
            return
        }
        let bfs = BreadthFirstPaths(sg.G, sourceIndex)
        while true {
            guard let sink = readLine(), let sinkIndex = sg.index(sink) else {
                print("Not in database")
                continue
            }
            if bfs.hasPathTo(sinkIndex) {
                for v in bfs.pathTo(sinkIndex) {
                    print("    \(sg.name(v))")
                }
            }
        }
    }
}
