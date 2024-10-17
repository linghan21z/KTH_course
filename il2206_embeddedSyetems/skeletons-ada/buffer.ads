package Buffer is
   Size: constant Integer := 3;  --size=3
   subtype Item is Integer;  
   type Index is mod Size;  --Index 是用3取模
   type Item_Array is array(Index) of Item;  --so the array is of Integer and width is 3+1=4

   protected type CircularBuffer is
      entry Put(X: in Item); 
      entry Get(X: out Item);
   private
      A: Item_Array;
      In_Ptr, Out_Ptr: Index := 0;  
      Count: Integer range 0..Size := 0;  --count:0--3,so the buffer'size is 3+1=4
   end CircularBuffer;
end Buffer;

