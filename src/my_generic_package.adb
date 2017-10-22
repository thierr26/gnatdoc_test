package body My_Generic_Package is

   ----------------------------------------------------------------------------

   function Is_Flat (A : Array_Type) return Boolean
     is (
         A'Length < 2
           or else (for all K in Index_Type'Succ (A'First) .. A'Last
           => A(K) = A(A'First))
        );

   ----------------------------------------------------------------------------

   function Is_Monotone (A : Array_Type) return Boolean
     is (
         A'Length < 3
           or else (for all K in Index_Type'Succ (A'First) .. A'Last
           => A(K) < A(Index_Type'Pred (K))
           or A(K) = A(Index_Type'Pred (K)))
           or else (for all K in Index_Type'Succ (A'First) .. A'Last
           => A(Index_Type'Pred (K)) < A(K)
           or A(K) = A(Index_Type'Pred (K)))
        );

   ----------------------------------------------------------------------------

end My_Generic_Package;
