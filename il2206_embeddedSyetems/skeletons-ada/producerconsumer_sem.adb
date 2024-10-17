with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Real_Time;
use Ada.Real_Time;

with Ada.Numerics.Discrete_Random;

with Semaphores;
use Semaphores;

procedure ProducerConsumer_Sem is
	
	N : constant Integer := 10; -- Number of produced and consumed tokens per task
	X : constant Integer := 3; -- Number of producers and consumer
		
	-- Buffer Definition
	Size: constant Integer := 4;
	type Index is mod Size;
	type Item_Array is array(Index) of Integer;
	B : Item_Array;
	--给定的In_Ptr, Out_Ptr, Count : Index := 0;
      In_Ptr, Out_Ptr : Index := 0;
      Count: Integer range 0..Size := 0;

   -- Random Delays
   subtype Delay_Interval is Integer range 50..250;
   package Random_Delay is new Ada.Numerics.Discrete_Random (Delay_Interval);
   use Random_Delay;
   G : Generator;
	
   -- => Complete code: Declation of Semaphores
	--    1. Semaphore 'NotFull' to indicate that buffer is not full
	--    2. Semaphore 'NotEmpty' to indicate that buffer is not empty
	--    3. Semaphore 'AtomicAccess' to ensure an atomic access to the buffer
	NotFull : Semaphores.CountingSemaphore(3,3);
   NotEmpty : Semaphores.CountingSemaphore(3,0);
   AtomicAccess: Semaphores.CountingSemaphore(1,1); 


   task type Producer;

   task type Consumer;

   task body Producer is
      Next : Time;
   begin
      Next := Clock;
      for I in 1..N loop
         -- => Complete Code: Write to Buffer
         NotFull.Wait;
         AtomicAccess.Wait;     --这里面的semaphore的count是否影响下面的count呢？    
            B(In_Ptr) := I;  --Item没定义
            In_Ptr := In_Ptr + 1;  
            Count := Count + 1;       
         AtomicAccess.Signal;
         NotEmpty.Signal;

         -- Next 'Release' in 50..250ms
         Next := Next + Milliseconds(Random(G));
         --delay until Next;
      end loop;
   end;

   task body Consumer is
      Next : Time;
      out_Item : Integer;  --define out_Item in consumer
   begin
      Next := Clock;
      for I in 1..N loop
         -- => Complete Code: Read from Buffer
         NotEmpty.Wait;
         AtomicAccess.Wait;            
            out_Item := B(Out_Ptr);  --Item没定义
            Out_Ptr := Out_Ptr + 1;
            Count := Count - 1;
         AtomicAccess.Signal;
         NotFull.Signal;
         Put_Line(Integer'Image(out_Item));  --put_line prints text on the command line， Image transfer integer to string
			
			-- Next 'Release' in 50..250ms
         Next := Next + Milliseconds(Random(G));
         delay until Next;
      end loop;
   end;
	
	P: array (Integer range 1..X) of Producer;
	C: array (Integer range 1..X) of Consumer;
   --P1, P2, P3 : Producer; --the same mean
	
begin -- main task
   null;
end ProducerConsumer_Sem;


