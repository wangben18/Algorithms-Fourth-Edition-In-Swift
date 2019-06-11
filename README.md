# 算法第4版数据结构的swift实现
每一个数据结构的目录下都有一个后缀为“Test”的文件包含main函数
1. 编辑main.swift指定要测试的数据结构，例如要测试WeightedGraph的数据结构
``` swift
// main.swift内容
···
WeightedGraphTest.main()
```
2. 在各main函数中指定测试函数，例如测试LazyPrimMSTTest
``` swift
// WeightedGraphTest.swift内容
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
```
>[测试用的数据文件包点此下载](https://algs4.cs.princeton.edu/code/algs4-data.zip)
**（main.swift中指定的数据目录记得修改一下）**
