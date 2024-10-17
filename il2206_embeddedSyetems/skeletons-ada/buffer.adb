package body Buffer is
   protected body CircularBuffer is

      entry Put(X: Item) when Count < Size is  --producer behavior putin and increment,
      begin                                    --and only write a data element into a not-full buffer
         A(In_Ptr) := X;
         In_Ptr := In_Ptr + 1;
         Count := Count + 1;
      end Put;

      entry Get(X: out Item) when Count > 0 is  --consumer behavior takeout and decrement,
      begin                                     --and only can read a data element from a not-empty buffer
         X := A(Out_Ptr);  --A is the Item_Array 4-width
         Out_Ptr := Out_Ptr + 1;  --Out_Ptr is like index索引
         Count := Count - 1;
      end Get;
   end CircularBuffer;
end Buffer;
