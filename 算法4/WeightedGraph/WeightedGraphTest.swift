//
//  WeightedGraphTest.swift
//  算法4
//
//  Created by liushan on 2019/6/4.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class WeightedGraphTest {
    
    static func main() {
        LazyPrimMSTTest()
    }
    
    static func LazyPrimMSTTest() {
        let mst = PrimMST(EdgeWeightedGraph(file(named: "tinyEWG.txt")))
        for e in mst.edges {
            print(e.description())
        }
        print(mst.weight)
    }
}
