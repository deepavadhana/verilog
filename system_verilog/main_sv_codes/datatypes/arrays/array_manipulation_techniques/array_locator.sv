// Code your design here
typedef enum {RED,BLUE,GREEN,YELLOW}clr_type;
class transaction;
  rand bit [2:0] data;
  rand bit [2:0] addr;
  rand clr_type clr;
  function void print;
    $display("addr=%0d,data=%0d and clr=%s",addr,data,clr.name);
  endfunction
endclass

module top_module;
  transaction tr;
  transaction trans_arr [int];
  //int arr[8]='{5,7,3,4,2,1,8,6};
  initial begin 
    $display("Generating array");
     array_gen();
     array_gen();
     array_gen();
     array_gen();
     array_gen();
     array_gen();
    $display("Finding the index");
    array_index();
    array_index();
    array_index();
    array_index();
    $display("Finding the  first element");
    array_first_index();
    array_first_index();
    array_first_index();
    array_first_index();
    $display("Finding the last element");
    array_last_index();
    array_last_index();
    array_last_index();
    array_last_index();
    $display("Finding the UNIQUE element");
    unique_element_index();
    unique_element_index(); 
    unique_element_index(); 
    unique_element_index();
    end

function void array_gen();
  tr=new();
  assert(tr.randomize());
  tr.print();
  trans_arr[8]=tr;
  tr=new();
  assert(tr.randomize());
  tr.print();
  trans_arr[3]=tr;
  tr=new();
  assert(tr.randomize());
  tr.print();
  trans_arr[4]=tr;
  tr=new();
  assert(tr.randomize());
  tr.print();
  trans_arr[5]=tr;
endfunction

  function void array_index();
    int idx_q[$],idx;
    int qsize;
    idx_q=trans_arr.find_index with (item.clr<=BLUE);
    qsize=idx_q.size;
    $display("Number of index in queue which has red is : %0d ",qsize);
    for(int i=0;i<qsize;i=i+1) begin
      idx=idx_q.pop_front();
      $display("Element in the queue is %0d after poping the front element from the index : %0d ",i+1,idx);
    trans_arr[idx].print();
    end
    
    endfunction
  function void array_first_index();
    int idx_q[$],idx;
    int qsize;
    idx_q=trans_arr.find_first_index with (item.clr<=RED);
    qsize=idx_q.size;
    $display("First index of the queue with color red is %0d",qsize);
    for (int i=0;i<qsize;i=i+1)
      begin
        idx=idx_q.pop_front();
        $display("Element in the queue is %0d after poping the front element from the index : %0d ",i+1,idx);
        trans_arr[idx].print();
      end
  endfunction
  function void array_last_index();
    int idx_q[$],idx;
    int qsize;
    idx_q=trans_arr.find_last_index with(item.clr==GREEN);
    qsize=idx_q.size;
    $display("First index of the queue with color red is %0d",qsize);
    for(int i=0;i<qsize;i=i+1)
    begin
      idx=idx_q.pop_front();
      $display("Element in the queue is %0d after poping the front element from the index : %0d ",i+1,idx);
      trans_arr[idx].print();
      end
  endfunction
  function void unique_element_index();
    int idx_q[$],idx;
    int qsize;
    idx_q=trans_arr.unique_index with(item.addr);
    qsize=idx_q.size;
    $display("Number of index contains unique element is %0d",qsize);
     for(int i=0;i<qsize;i=i+1)
    begin
      idx=idx_q.pop_front();
      $display("Element in the queue is %0d after poping the front element from the index : %0d ",i+1,idx);
      trans_arr[idx].print();
      end
  endfunction
  endmodule
