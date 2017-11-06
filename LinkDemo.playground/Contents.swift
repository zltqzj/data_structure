//: Playground - noun: a place where people can play


var str = "Hello, playground"
class Node {
    var value:Int!
    var next:Node?
}

class Link {
    private var head:Node?
    private var current:Node?
    
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
    
    func getNodeValue(index:Int) -> Int  {
        let node:Node = getNode(index: index) //head
        let value:Int  = (node.value)!
        return value
    }
    
    func getNode(index:Int) -> Node {
        var node:Node = head!
        for _ in 0..<index{
            node = node.next!
        }
        return node
    }
    
    func getReverseNode(index:Int) -> Int  {
        if index > get_count()-1 {
            return 0
        }
       return getNodeValue(index: link.get_count()-1-index)
    }
    
    
    
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
    
    func show() {
        var item = head
        while item != nil {
            print(item!.value, terminator: "->")
            item = item!.next
        }
         print()
    }
    
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



//7. 判断一个单链表中是否有环
//8. 判断两个单链表是否相交
//9. 求两个单链表相交的第一个节点
//10. 已知一个单链表中存在环，求进入环中的第一个节点
//11. 给出一单链表头指针pHead和一节点指针pToBeDeleted，O(1)时间复杂度删除节点pToBeDeleted

