(* Question 1: Manhattan Distance *)
(* TODO: Write a good set of tests for distance. *)
let distance_tests = [
  (
    ((0, 0), (0, 0)), (* input: two inputs, each a pair, so we have a pair of pairs *)
    0                 (* output: the distance between (0,0) and (0,0) is 0 *)
  ); (* end each case with a semicolon *)
     
  (((1,2),(3,4)),4);
  (((0,0),(3,2)),5);
  (((3,2),(0,0)),5);
  (((-5,2),(3,-4)),14);
  
    (* Your test cases go here *)
]
;;

(* TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)
let distance (x1, y1) (x2, y2) = 
  abs (x1 - x2) + abs (y1 - y2) 



(* Question 2: Binomial *)
(* TODO: Write your own tests for the binomial function.
         See the provided test for how to write test cases.
         Remember that we assume that  n >= k >= 0; you should not write test cases where this assumption is violated.
*)
let binomial_tests = [
  (* Your test cases go here. Correct this incorrect test case for the function. *)
  ((0, 0), 1);
  ((1, 1), 1);
  ((1, 0), 1); 
  ((2, 1), 2);
  ((2, 2), 1);
  ((2, 0), 1); 
]

(* TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)
let binomial n k =
  (*raise NotImplemented *)
  let rec fac r = 
    if r = 0 then 1
    else if r = 1 then 1
    else r * fac (r - 1) 
  in (fac n) / (fac k * fac(n-k))



(* Question 3: Lucas Numbers *)

(* TODO: Write a good set of tests for lucas_tests. *)
let lucas_tests = [
  (2,3);
  (3,4);
  (1,1);
  (0,2);
  
]

(* TODO: Implement a tail-recursive helper lucas_helper. *)
let rec lucas_helper n a b  = 
  (*raise NotImplemented*)
  if n = 0 then a 
  else if n = 1 then b
  else lucas_helper (n-1) b (a+b)
  


(* TODO: Implement lucas by calling lucas_helper. *)
let lucas n =
  (*raise NotImplemented*)
  lucas_helper n 2 1
