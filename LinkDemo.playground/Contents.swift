//: Playground - noun: a place where people can play


var str = "Hello, playground"

class Node {
    var value:Int!
    var next:Node?
}

class Link {
    private var head:Node?
    private var current:Node?
    
    // 增
    func  insert(value:Int,index:Int){
        if head == nil {
            head = Node()
            head!.value = value
            current = head
        }
        else if index > get_count()-1 {
            let node = Node()
            node.value = value
            current!.next = node
            current = node
        }
        else if index == 0 {
            let node = Node()
            node.value = value
            node.next = head
            head = node
        }
        else{
            let node = Node()
            node.value = value
            
            let indexNode:Node = getNode(index: index-1)
            let next:Node = indexNode.next!
            indexNode.next = node
            node.next = next
        }
    }
    
    // 删
    func  delete(index:Int)  {
        let count = get_count()
        if index >= count {
            return
        }
        if count == 1 {
            head = nil
            current = nil
            return
        }
        if index == 0 {
            head = head?.next
        }
        else{
            var item = head
            for _ in 0..<index-1 {
                item = item!.next
            }
            item?.next = item?.next?.next
        }
    }
    
    // 查询个数
    func get_count() -> Int {
        if head == nil {
            return 0
        }
        else{
            var count = 1
            current = head
            while current?.next != nil {
                current = current?.next
                count += 1
            }
            return count
        }
    }
    
    // 获取第i个节点的指
    func getNodeValue(index:Int) -> Int  {
        let node:Node = getNode(index: index) //head
        let value:Int  = (node.value)!
        return value
    }
    
    // 获取第i个节点对象
    func getNode(index:Int) -> Node {
        var node:Node = head!
        for _ in 0..<index{
            node = node.next!
        }
        return node
    }
    
    // 获取倒数第i个节点的值
    func getReverseNode(index:Int) -> Int  {
        if index > get_count()-1 {
            return 0
        }
        return getNodeValue(index: link.get_count()-1-index)
    }
    
    // 遍历打印单链表
    func show() {
        var item = head
        while item != nil {
            print(item!.value, terminator: "->")
            item = item!.next
        }
        print()
    }
    
    // 单链表翻转
    func reverse()  {
        var p = head
        var q = head?.next
        head?.next = nil
        while q != nil {
            let r = q?.next
            q?.next = p
            p = q
            q = r
        }
        head = p
    }
    
    // 查询中间节点
    func find_mid() -> Int {
        var p = head
        var q = head
        var count = 0
        while p?.next != nil && q?.next?.next != nil {
            p = p?.next
            q = q?.next?.next
            count += 1
        }
        return (p?.value)!
    }
    
    // 两个有序链表相加
    func addLink(link2:Link)  {
        let resultLink:Link = Link()
        var link1_point:Node = head!
        var link2_point:Node = link2.head!
        var result_count = 0
        while true {
            let link1_value:Int = link1_point.value
            let link2_value:Int = link2_point.value
            if link1_value > link2_value {
                resultLink.insert(value: link2_value, index: result_count)
                if link2_point.next != nil {
                    link2_point = link2_point.next!
                }
                else{
                    resultLink.current?.next = link1_point
                    break
                }
            }
            else{
                resultLink.insert(value: link1_value, index: result_count)
                if link1_point.next != nil {
                    link1_point = link1_point.next!
                }
                else{
                    resultLink.current?.next = link2_point
                    break
                }
            }
            result_count += 1
        }
        head = resultLink.head
    }
    
    
    
    func make_circle_link()  {
        let node1:Node = Node()
        node1.value = 1
        
        let node2:Node = Node()
        node2.value = 2
        
        let node3:Node = Node()
        node3.value = 3
        
        let node4:Node = Node()
        node4.value = 4
        
        let node5:Node = Node()
        node5.value = 5
        
        head = node1
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node1
        
    }
    
    func makeTwoCrossLink() {
        
        let node1:Node = Node()
        node1.value = 1
        head = node1
        
        let node2:Node = Node()
        node2.value = 2
        node1.next = node2
        
        let node3:Node = Node()
        node3.value = 3
        node2.next = node3
        
        let node4:Node = Node()
        node4.value = 4
        node3.next = node4
        
        let node7:Node = Node()
        node7.value = 7
        node4.next = node7
        //-------------
        
        
        let node5:Node = Node()
        node5.value = 5
        
        let node6:Node = Node()
        node6.value = 6
        node6.next = node7
        let node9:Node = Node()
        node9.value = 9
        
        let link2 = Link()
        link2.head = node5
        node5.next = node6
        node7.next = node9
        //        let isCross =  self.circle(link2:link2)
        //        print("判断是否相交1:\(isCross)")
        //        let isCross2 = self.isCross2(link2: link2)
        //        print("判断是否相交2:\(isCross2)")
        let vNode:Node =   self.getNodeAfterCross(link2: link2)!   //9. 求两个单链表相交的第一个节点
        let v:Int = vNode.value
        print("相交的节点：\(v)")
    }
    
    // 判断链表是否有环
    func isCirle() -> (isCircle:Bool,nextNode:Node?)  {
        var low = head
        var fast = head
        
        while fast?.next != nil && fast?.next?.next != nil {
            low = low?.next
            fast = fast?.next?.next
            let fa_va:Int = (fast?.value)!
            
            let low_va:Int = (low?.value)!
            print(fa_va,low_va)
            if low === fast {
                return  (true,low?.next)
            }
        }
        return (false,nil)
    }
    
    // 判断链表是否相交，第一种方法。
    func isCross(link2:Link) -> Bool {
        
        var item = link2.head
        while item?.next != nil {
            item  = item?.next
        }
        item?.next = head
        
        if isCirle().isCircle == true {
            return true
        }
        return false
    }
    
    
    // 判断链表是否相交，第二种方法
    func isCross2(link2:Link) -> Bool {
        var point1 = head
        var point2 = link2.head
        while point1?.next != nil {
            point1 = point1?.next
        }
        while point2?.next != nil {
            point2 = point2?.next
        }
        if point2 === point1 {
            
            return true
        }
        return false
    }
    
    // 求相交后第一个节点
    func getNodeAfterCross(link2:Link) -> Node? {
        let link1_count  = get_count()
        let link2_count = link2.get_count()
        if link1_count > link2_count {
            for _ in 0..<(link1_count-link2_count){
                head  = head?.next
            }
        }
        else{
            for _ in 0..<(link2_count-link1_count){
                link2.head = link2.head?.next
            }
        }
        var point1 = head
        var point2 = link2.head
        while point1 != nil && point2 != nil {
            
            point1 = point1?.next
            point2 = point2?.next
            if point1 === point2 {
                let value:Int = (point1?.value)!
                return point1
            }
        }
        return nil
    }
    
    func deleteLink()  {
        let node1:Node = Node()
        node1.value = 1
        head = node1
        
        let node2:Node = Node()
        node2.value = 2
        node1.next = node2
        
        let node3:Node = Node()
        node3.value = 3
        node2.next = node3
        
        let node4:Node = Node()
        node4.value = 4
        node3.next = node4
        
        let node7:Node = Node()
        node7.value = 7
        node4.next = node7
        
        
        let node8:Node = Node()
        node8.value = 8
        
        let deleteResult:Bool =  pToBeDeleted(node: node8)
        let deleteResult1:Bool =  pToBeDeleted(node: node1)
        let deleteResult2:Bool =  pToBeDeleted(node: node7)
        let deleteResult3:Bool =  pToBeDeleted(node: node4)
        
        print(deleteResult)
        print(deleteResult1)
        print(deleteResult2)
        print(deleteResult3)
    }
    
    
    func pToBeDeleted(node:Node) -> Bool {
        print("删除前------")
        show()
        print("删除后------")
        //  给出一单链表头指针pHead和一节点指针pToBeDeleted，O(1)时间复杂度删除节点pToBeDeleted
        var item = head
        if item === node {
            head = head?.next
            print("删除头结点")
        }
        else{
            while item?.next !== node && item?.next != nil{
                item = item?.next
            }
            
            if item?.next === node {
                item?.next = node.next
            }
            else{
                show()
                return false
            }
        }
        show()
        return true
    }
    
}

let link = Link()

link.insert(value: 10, index: 0)

link.insert(value: 11, index: 1)
link.insert(value: 12, index: 2)
link.insert(value: 13, index: 3)
link.insert(value: 14, index: 4)
link.insert(value: 15, index: 5)
link.show()
let count = link.get_count() //1. 求单链表中结点的个数
print("count = \(count)")

//link.reverse()  //2. 将单链表反转
//link.show()  //5. 从尾到头打印单链表

let value = link.getReverseNode(index: 1)  //3. 查找单链表中的倒数第K个结点（k > 0）
print("count backwards 2 = \(value)")

let mid_value:Int = link.find_mid()  //4. 查找单链表的中间结点
print("mid value is \(mid_value)")
//
////6. 已知两个单链表pHead1 和pHead2 各自有序，把它们合并成一个链表依然有序
let link1  = Link()
link1.insert(value: 10, index: 0)

link1.insert(value: 11, index: 1)
link1.insert(value: 12, index: 2)
link1.insert(value: 13, index: 3)
link1.insert(value: 14, index: 4)
link1.insert(value: 15, index: 5)

let link2 = Link()
link2.insert(value: 12, index: 0)

link2.insert(value: 13, index: 1)
link2.insert(value: 24, index: 2)
link2.insert(value: 35, index: 3)
link2.insert(value: 46, index: 4)
link2.insert(value: 57, index: 5)

let link3  = Link()
link3.insert(value: 10, index: 0)
link3.insert(value: 11, index: 1)
link3.insert(value: 12, index: 2)
link3.insert(value: 13, index: 3)
link3.insert(value: 14, index: 4)
link3.insert(value: 15, index: 5)

let link4 = Link()
link4.insert(value: 0, index: 0)
link4.insert(value: 1 , index: 1)
link4.insert(value: 2, index: 2)
link4.insert(value: 3, index: 3)
link4.insert(value: 4, index: 4)
link4.insert(value: 5, index: 5)

print("链表4和3链接--------------------------")
link4.addLink(link2: link3)
link4.show()

let circle  = Link()
circle.make_circle_link()
let node1 = circle.isCirle()
print("判断一个单链表中是否有环\(node1.isCircle)")  //7. 判断一个单链表中是否有环
let value1:Int =  (node1.nextNode?.value)!
print("已知一个单链表中存在环，求进入环中的第一个节点\(value1)")  //10.已知一个单链表中存在环，求进入环中的第一个节点

circle.makeTwoCrossLink()  //8. 判断两个单链表是否相交
circle.deleteLink()
//
//11. 给出一单链表头指针pHead和一节点指针pToBeDeleted，O(1)时间复杂度删除节点pToBeDeleted

