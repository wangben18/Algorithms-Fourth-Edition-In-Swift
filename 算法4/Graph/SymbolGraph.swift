//
//  SymbolGraph.swift
//  算法4
//
//  Created by liushan on 2019/5/29.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class SymbolGraph {
    private var st = Dictionary<String, Int>()
    private var keys: [String]
    private(set) var G: Graph
    
    init(_ input: String, _ sp: Character) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let words = line.split(separator: sp)
            for word in words {
                if !st.keys.contains(String(word)) {
                    st[String(word)] = st.count
                }
            }
        }
        keys = [String](repeating: "", count: st.count)
        for name in st.keys {
            keys[st[name]!] = name
        }
        G = Graph(st.count)
        for line in lines {
            let words = line.split(separator: sp)
            let v = st[String(words[0])]!
            for word in words.dropFirst() {
                G.addEdge(v, st[String(word)]!)
            }
        }
    }
    
    public func contains(_ s: String) -> Bool {
        return st.keys.contains(s)
    }
    
    public func index(_ s: String) -> Int? {
        return st[s]
    }
    
    public func name(_ v: Int) -> String {
        return keys[v]
    }
}
