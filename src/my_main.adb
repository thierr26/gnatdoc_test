with My_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure My_Main is

   N : constant Positive := 15;
   T : My_Package.My_Implementation;
   A : My_Package.Arr := (others => 10);

begin

   if My_Package.My_Function (A) then
      Put_Line ("All elements in A are equal.");
   else
      Put_Line ("All elements in A are not equal.");
   end if;
   Put_Line ("");
   Put_Line (Positive'Image (N) & " first fibonacci numbers:");
   for K in 1 .. N loop
      Put_Line ("  " & Integer'Image (K) & ": "
        & My_Package.Count'Image (T.My_Primitive));
   end loop;

end My_Main;
