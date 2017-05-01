package body My_Package is

   ----------------------------------------------------------------------------

   not overriding
   function Create return My_Implementation is

   begin

      return (Others => <>);

   end Create;

   ----------------------------------------------------------------------------

   overriding
   function My_Primitive (Obj : in out My_Implementation) return Count is

      Ret : Count;

   begin

      if Obj.K = 0 then
         Ret := Obj.Prev_Prev_Term;
      elsif Obj.K = 1 then
         Ret := Obj.Prev_Term;
      elsif Count'Last - Obj.Prev_Term < Obj.Prev_Prev_Term then
         raise My_Package_Range_Error with "Cannot compute "
           & Count'Image (Obj.K + 1) & "th Fibonacci number";
      else
         Ret := Obj.Prev_Prev_Term + Obj.Prev_Term;
         Obj.Prev_Prev_Term := Obj.Prev_Term;
         Obj.Prev_Term := Ret;
      end if;

      Obj.K := Obj.K + 1;

      return Ret;

   end My_Primitive;

   ----------------------------------------------------------------------------

end My_Package;
