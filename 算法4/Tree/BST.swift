//
//  BST.swift
//  算法4
//
//  Created by liushan on 2019/5/22.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

public class BST<Key:Comparable,Value> {
    
    private var root: Node?
    
    public class Node {
        var key: Key
        var val: Value
        var left: Node?
        var right: Node?
        var N: Int
        
        init(_ key: Key, _ val: Value, _ N: Int) {
            self.key = key
            self.val = val
            self.N = N
        }
    }
    
    func size() -> Int {
        return size(root)
    }
    
    private func size(_ x: Node?) -> Int {
        return x?.N ?? 0
    }
    
    func get(_ key: Key) -> Value? {
        return get(root, key)
    }
    
    private func get(_ x: Node?, _ key: Key) -> Value? {
        guard let x = x else { return nil }
        if key < x.key {
            return get(x.left, key)
        } else if key > x.key {
            return get(x.right, key)
        } else {
            return x.val
        }
    }
    
    func put(_ val: Value, forKey key: Key) {
        root = put(val, forKey: key, in: root)
    }
    
    private func put(_ val: Value, forKey key: Key, in x: Node?) -> Node {
        guard let x = x else { return Node.init(key, val, 1) }
        if key < x.key {
            x.left = put(val, forKey: key, in: x.left)
        } else if key > x.key {
            x.right = put(val, forKey: key, in: x.right)
        } else {
            x.val = val
        }
        x.N = size(x.left) + size(x.right) + 1
        return x
    }
    
    func min() -> Key? {
        guard let root = root else { return nil }
        return min(root).key
    }
    
    private func min(_ x: Node) -> Node {
        guard let left = x.left else { return x }
        return min(left)
    }
    
    func max() -> Key? {
        guard let root = root else { return nil }
        return max(root).key
    }
    
    private func max(_ x: Node) -> Node {
        guard let right = x.right else { return x }
        return max(right)
    }
    
    func floor(_ key: Key) -> Key? {
        return floor(root, key)?.key
    }
    
    private func floor(_ x: Node?, _ key: Key) -> Node? {
        guard let x = x else { return nil }
        if key == x.key {
            return x
        } else if key < x.key {
            return floor(x.left, key)
        }
        let t = floor(x.right, key)
        return t ?? x
    }
    
    func ceiling(_ key: Key) -> Key? {
        return ceiling(root, key)?.key
    }
    
    private func ceiling(_ x: Node?, _ key: Key) -> Node? {
        guard let x = x else { return nil }
        if key == x.key {
            return x
        } else if key > x.key {
            return ceiling(x.right, key)
        }
        let t = ceiling(x.left, key)
        return t ?? x
    }
    
    func select(_ k: Int) -> Key? {
        return select(root, k)?.key
    }
    
    private func select(_ x: Node?, _ k: Int) -> Node? {
        guard let x = x else { return nil }
        let t = size(x.left)
        if t > k {
            return select(x.left, k)
        } else if t < k {
            return select(x.right, k-t-1)
        } else {
            return x
        }
    }
    
    func rank(_ key: Key) -> Int {
        return rank(key, root)
    }
    
    private func rank(_ key: Key, _ x: Node?) -> Int {
        guard let x = x else { return 0 }
        if key < x.key {
            return rank(key, x.left)
        } else if key > x.key {
            return 1 + size(x.left) + rank(key, x.right)
        } else {
            return size(x.left)
        }
    }
    
    func deleteMin() {
        if let root = root {
            self.root = deleteMin(root)
        }
    }
    
    private func deleteMin(_ x: Node) -> Node? {
        if x.left == nil {
            return x.right
        }
        x.left = deleteMin(x.left!)
        x.N = size(x.left) + size(x.right) + 1
        return x
    }
    
    func deleteMax() {
        if let root = root {
            self.root = deleteMax(root)
        }
    }
    
    private func deleteMax(_ x: Node) -> Node? {
        if x.right == nil {
            return x.left
        }
        x.right = deleteMax(x.right!)
        x.N = size(x.left) + size(x.right) + 1
        return x
    }
    
    func delete(_ key: Key) {
        root = delete(&root, key)
    }
    
    private func delete(_ x: inout Node?, _ key: Key) -> Node? {
        guard x != nil else { return nil }
        if key < x!.key {
            x!.left = delete(&x!.left, key)
        } else if  key > x!.key {
            x!.right = delete(&x!.right, key)
        } else {
            if x!.right == nil { return x!.left }
            if x!.left == nil { return x!.right }
            let oldX = x!
            x = min(oldX.right!)
            x!.right = deleteMin(oldX.right!)
            x!.left = oldX.left
        }
        x!.N = size(x!.left) + size(x!.right) + 1
        return x
    }
    
    func keys() -> [Key] {
        guard let min = min(), let max = max() else { return [] }
        return keys(min, max)
    }
    
    private func keys(_ lo: Key, _ hi: Key) -> [Key] {
        var list = [Key]()
        keys(root, &list, lo, hi)
        return list
    }
    
    private func keys(_ x: Node?, _ list: inout [Key], _ lo: Key, _ hi: Key) {
        guard let x = x else { return }
        if lo < x.key {
            keys(x.left, &list, lo, hi)
        }
        if lo <= x.key && hi >= x.key {
            list.append(x.key)
        }
        if hi > x.key {
            keys(x.right, &list, lo, hi)
        }
    }
    
    init() {
        
    }
    
    func printRoot() {
        print("# BST #")
        printTree(root)
        print("#")
    }
    
    private func printTree(_ x: Node?, _ indent: String = "") {
        guard let x = x else {
            print("nil")
            return
        }
        print("[\(x.key) : \(x.val)] \(x.N)")
        print("\(indent)l", terminator: "-")
        printTree(x.left, indent+"\t")
        print("\(indent)r", terminator: "-")
        printTree(x.right, indent+"\t")
    }
}
