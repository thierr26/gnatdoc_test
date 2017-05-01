with My_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure My_Main is

   N : constant Positive := 15;
   T : My_Package.My_Implementation;

begin

   Put_Line (Positive'Image (N) & " first fibonacci numbers:");
   for K in 1 .. N loop
      Put_Line ("  " & Integer'Image (K) & ": "
        & My_Package.Count'Image (T.My_Primitive));
   end loop;

end My_Main;
