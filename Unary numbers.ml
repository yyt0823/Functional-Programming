(* Question 1 *)

(* TODO: Write a good set of tests for {!q1a_nat_of_int}. *)
let q1a_nat_of_int_tests : (int * nat) list = [
  (3,S (S (S Z))); 
  (4,S (S (S (S Z))));
  (0, Z)
   
     
]

(* TODO:  Implement {!q1a_nat_of_int} using a tail-recursive helper. *)
let q1a_nat_of_int (n : int) : nat =
  let rec q1_helper n acc =
    if n <= 0 then acc  
    else q1_helper (n - 1) (S acc) in
  q1_helper n Z
  

(* TODO: Write a good set of tests for {!q1b_int_of_nat}. *)
let q1b_int_of_nat_tests : (nat * int) list = [
  (S (S (S Z)),3); 
  (S (S (S (S Z))),4);
  ( Z,0)

]

(* TODO:  Implement {!q1b_int_of_nat} using a tail-recursive helper. *)
let rec q1b_int_of_nat (n : nat) : int = 
  let rec q1b_helper nat_value acc = 
    match nat_value with 
    |Z -> acc
    |S n -> q1b_helper n (acc + 1)
  in
  q1b_helper n 0
(* TODO: Write a good set of tests for {!q1c_add}. *)
let q1c_add_tests : ((nat * nat) * nat) list = [
  (S (S Z), S (S Z)) , S (S (S (S Z)));
  ((Z,Z),Z);
  ((Z, S (S Z)), S (S Z)); 
]

(* TODO: Implement {!q1c_add}. *)
let rec q1c_add (n : nat) (m : nat) : nat = 
  
  match n with
  | Z -> m 
  | S n' -> S (q1c_add n' m)  
  



(* Question 2 *)

(* TODO: Implement {!q2a_neg}. *)
let q2a_neg (e : exp) : exp = 
  Times (Const (-1.0), e)

(* TODO: Implement {!q2b_minus}. *)
let q2b_minus (e1 : exp) (e2 : exp) : exp = 
  Plus (e1,Times (Const (-1.0), e2))

(* TODO: Implement {!q2c_pow}. *)
let rec q2c_pow (e1 : exp) (p : nat) : exp = 
  match p with
  | Z -> Const 1.0  (* Any expression to the power of 0 is 1 *)
  | S n -> Times (e1, q2c_pow e1 n)  (* Multiply e with the result of e to the power of (n - 1) *)

    

(* Question 3 *)

(* TODO: Write a good set of tests for {!eval}. *)
let eval_tests : ((float * exp) * float) list = [

  ((3.0, Plus (Const 3.0, Const 1.0)), 4.0);
  ((3.0, Plus (Const 3.0, Const (-1.0))), 2.0); 
  ((3.0, Times (Const 3.0, Var)), 9.0);
  ((3.0, Plus (Const 3.0, Const 0.0)), 3.0);
  ((3.0, Times (Const 3.0, Const 0.0)), 0.0);
  ((3.0, Div (Const 3.0, Const 1.0)), 3.0);
  ((3.0, Div (Const 0.0, Const 3.0)), 0.0); 
  ((3.0, Var), 3.0);
  ((3.0, Const (3.0)), 3.0); 
]

(* TODO: Implement {!eval}. *)
let rec eval (a : float) (e : exp) : float = 
  match e with 
  | Const c -> c  
  | Var -> a  
  | Plus (e1, e2) -> eval a e1 +. eval a e2  
  | Times (e1, e2) -> eval a e1 *. eval a e2  
  | Div (e1, e2) -> eval a e1 /. eval a e2  


(* Question 4 *)

(* TODO: Write a good set of tests for {!diff_tests}. *)
let diff_tests : (exp * exp) list = [
  (Const 1.0, Const 0.0) ;
  (Var, Const 1.0);
  (Plus (Const 1.0, Var), Plus (Const 0.0, Const 1.0));
  (Times (Const 1.0, Var), Plus (Times (Const 0.0, Var), Times (Const 1.0, Const 1.0))); 
  (Div (Const 1.0, Const 1.0), Div (Plus (Times (Const 0.0, Const 1.0), (Times (Const (-1.0), Times (Const (1.0), Const 0.0)))), Times (Const 1.0, Const 1.0))   );

]

(* TODO: Implement {!diff}. *)
let rec diff (e : exp) : exp = 
  match e with 
  |Const a -> Const 0.0
  |Var -> Const 1.0
  |Plus (a, b) -> Plus (diff a, diff b)
  |Times (a, b) -> Plus (Times (diff a, b), Times (a, diff b))
  |Div (a, b) ->
      Div (
        Plus (Times (diff a, b), Times (Times (a, diff b), Const (-1.0))),
        Times (b, b))
  
        
  
  
  
  
  
  
  
  
  
