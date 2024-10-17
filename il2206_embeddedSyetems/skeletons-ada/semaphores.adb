-- Package: Semaphores
--
-- ==> Complete the code at the indicated places

package body Semaphores is
   protected body CountingSemaphore is
      entry Wait when Count > 0 is -- To be completed
      begin  
         Count := Count - 1;  --wait(s):if s>0 then grab it and decrement S by 1,not-empty so take-out
      end wait;

      entry Signal when Count < MaxCount is-- To be completed
      begin
         Count := Count + 1;  --Signal(S): increment S by 1,not-full so add-in
      end Signal;

   end CountingSemaphore;
end Semaphores;

-- protected body CountingSemaphore is
--      entry Wait -- To be completed
--      
--      entry Signal -- To be completed
--   end CountingSemaphore;