generic

   type Index_Type is (<>);
   --  Array index type.

   type Element_Type is private;
   --  Array element type.

   type Array_Type is array (Index_Type range <>) of Element_Type;
   with function "<" (Left, Right : Element_Type) return Boolean is <>;

package My_Generic_Package is
--  @summary
--  Test package (generic).
--

   function Is_Flat (A : Array_Type) return Boolean
     with Post => Is_Flat'Result
            = (for all K in A'Range => A(K) = A(A'First));
   --  @param A Array.
   --  @return True if the array elements from the second one on are equal to
   --  the first array element, False otherwise. Arrays with less than
   --  two elements all cause the function to return True.

   function Is_Monotone (A : Array_Type) return Boolean
     with Post => Is_Monotone'Result
            = ((for all K in Index_Type'Succ (A'First) .. A'Last
            => A(K) < A(Index_Type'Pred (K))
            or A(K) = A(Index_Type'Pred (K)))
            or else (for all K in Index_Type'Succ (A'First) .. A'Last
            => A(Index_Type'Pred (K)) < A(K)
            or A(K) = A(Index_Type'Pred (K))));
   --  @param A Array.
   --  @return True if the array elements from the second one on fulfill one of
   --  the following conditions, False otherwise:
   --
   --  -
   --    They are all greater than or equal to their predecessor.
   --
   --  -
   --    They are all lower than or equal to their predecessor.
   --
   --  Arrays with less than three elements all cause the function to return
   --  True.

end My_Generic_Package;
