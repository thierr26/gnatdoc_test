package My_Package is
--  @summary
--  Test package.
--

   subtype Count is Long_Long_Integer range 0 .. Long_Long_Integer'Last;

   type Arr is array (Positive range <>) of Natural;

   type Enum is (One, Two, Three);

   ----------------------------------------------------------------------------

   function My_Function (A : Arr) return Boolean
     with Post =>
            My_Function'Result = (for all Z in A'Range => A(Z) = A(A'First));
   --  @param A An array.
   --  @return True if all array elements are equal, False otherwise.

   ----------------------------------------------------------------------------

   type My_Interface is interface;

   not overriding
   function My_Primitive (Obj : in out My_Interface) return Count is abstract;
   --  @param Obj My_Interface object.
   --  @return Next term of the Fibonacci Sequence.

   ----------------------------------------------------------------------------

   type My_Implementation is new My_Interface with private;

   not overriding function Create return My_Implementation;
   --  @return My_Implementation object.

   overriding
   function My_Primitive (Obj : in out My_Implementation) return Count;
   --  @param Obj My_Implementation object.
   --  @return Next term of the Fibonacci Sequence.

   ----------------------------------------------------------------------------

private

   My_Package_Range_Error : exception;

   type My_Implementation is new My_Interface with
      record
         K : Count := 0;
         Prev_Prev_Term, Prev_Term : Count := 1;
      end record;

end My_Package;
