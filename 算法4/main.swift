//
//  main.swift
//  算法4
//
//  Created by liushan on 2019/5/22.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

func file(named fileName: String) -> String {
    let dir = FileManager.default.urls(for: .userDirectory, in: .allDomainsMask).first!.appendingPathComponent("/liushan/algs4/algs4-data/")
    return try! String(contentsOf: dir.appendingPathComponent(fileName), encoding: .utf8)
}

WeightedDigraphTest.main()
