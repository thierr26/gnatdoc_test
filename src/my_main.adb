with My_Package;
with My_Generic_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure My_Main is

   N : constant Positive := 15;
   T : My_Package.My_Implementation;
   A : My_Package.Arr := (1 => 10, 2 => 10, 3 => 10);

   package P is new My_Generic_Package
     (Index_Type => Positive,
      Element_Type => Natural,
      Array_Type => My_Package.Arr);

begin

   if My_Package.My_Function (A) then
      Put_Line ("All elements in A are equal.");
   else
      Put_Line ("All elements in A are not equal.");
   end if;
   if P.Is_Flat (A) then
      Put_Line ("Flat array.");
   else
      Put_Line ("Non flat array.");
   end if;
   if P.Is_Monotone (A) then
      Put_Line ("Monotonic array.");
   else
      Put_Line ("Non Monotonic array.");
   end if;
   Put_Line ("");
   Put_Line (Positive'Image (N) & " first fibonacci numbers:");
   for K in 1 .. N loop
      Put_Line ("  " & Integer'Image (K) & ": "
        & My_Package.Count'Image (T.My_Primitive));
   end loop;

end My_Main;
