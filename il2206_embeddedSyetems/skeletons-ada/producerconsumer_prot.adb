with Ada.Text_IO;  --with allow to use a library unit,here Ada.Text_IO for textual functions
use Ada.Text_IO;

with Ada.Real_Time;
use Ada.Real_Time;

with Buffer;
use Buffer;

with Ada.Numerics.Discrete_Random;

procedure ProducerConsumer_Prot is --main task of the application

   N : constant Integer := 10; -- Number of produced and consumed tokens per task
	X : constant Integer := 3; -- Number of producers and consumers
	
   -- Random Delays
   subtype Delay_Interval is Integer range 50..250;
   package Random_Delay is new Ada.Numerics.Discrete_Random (Delay_Interval);
   use Random_Delay;
   G : Generator;

   -- ==> Complete code: Use Buffer
   --?????maybe should be declaration of buffer here
   myCircularBuffer : Buffer.CircularBuffer;

   task type Producer;

   task type Consumer;

   task body Producer is
      Next : Time;
   begin
      Next := Clock;
      for I in 1..N loop
			
         -- ==> Complete code: Write to Buffer
         myCircularBuffer.Put(I); --X or N?
			
         -- Next 'Release' in 50..250ms
         Next := Next + Milliseconds(Random(G));  --transmission interval
         delay until Next;
      end loop;
   end;

   task body Consumer is
      Next : Time;
      X : Integer;
   begin
      Next := Clock;
      for I in 1..N loop
         -- Read from X
			
         -- ==> Complete code: Read from Buffer
         myCircularBuffer.Get(X);
			
         Put_Line(Integer'Image(X));  --put_line prints text on the command line， Image transfer integer to string
         Next := Next + Milliseconds(Random(G));
         delay until Next;  --periodic tasks,delay until will delay a task until a certain absolute time(now is clock)
      end loop;
   end;
	
	P: array (Integer range 1..X) of Producer;  --X = 3 Number of producers and consumers
	C: array (Integer range 1..X) of Consumer;
	
begin -- main task
   null;  --Will wait here until all tasks have terminated
end ProducerConsumer_Prot;


