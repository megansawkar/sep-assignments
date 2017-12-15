require 'benchmark'
require './linked_list.rb'

ary = []
llist = LinkedList.new

Benchmark.bm { |x|
  x.report('Create_Array_10_000') do
    ary = Array (1..10000)
  end

  x.report('Create_Linked_List_10_000') do
    for i in (1..10000)
      llist.add_to_tail(Node.new(i))
    end
  end

  x.report('Array_Find_5_000') do
    ary[4999]
  end

  x.report('Linked_List_Find_5_000') do
    current_node = llist.head

    while current_node.data != 5000
      current_node = current_node.next
    end
  end

  x.report('Array_Delete_5_000') do
    ary.delete_at(4999)
  end

  x.report('Linked_List_Delete_5_000') do
    current_node = llist.head

    if current_node.data != 5000
      current_node = current_node.next
    else
      current_node = current_node.next.next
    end

  end
}
