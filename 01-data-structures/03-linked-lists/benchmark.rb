require 'benchmark'

Benchmark.bm { |x|
  x.report('Create_Array_10_000') do
    ary = Array (1..10,000)
  end

  x.report('Create_Linked_List_10_000') do
    llist = LinkedList.new
    for i in (1..10,000)
      llist.add_to_tail(i)
    end
  end

  x.report('Array_Find_5_000') do
    ary[4999]
  end

  x.report('Linked_List_Find_5_000') do
    current_node = @head

    while current_node != 5,000
      current_node = current_node.next
    end
  end

  x.report('Array_Delete_5_000') do
    ary.delete_at(4999)
  end

  x.report('Linked_List_Delete_5_000') do
    current_node = @head

    if current_node != 5,000
      current_node = current_node.next
    else
      current_node = current_node.next.next
    end

  end
}
