(* TODO: Add test cases for both Question 1 and 2. *)
let xyz_table1 = (Variable_map.empty
                  |> Variable_map.add "x" true
                  |> Variable_map.add "y" true
                  |> Variable_map.add "z" true)
                 
let xyz_table2 = (Variable_map.empty
                  |> Variable_map.add "x" false
                  |> Variable_map.add "y" false
                  |> Variable_map.add "z" false)
                
let find_sat_assignment_tests : (formula * truth_assignment option) list = [
  (parse_formula "x & y & z", Some xyz_table1);
  (parse_formula "~x & ~y & ~z", Some xyz_table2); 
  (parse_formula "x & ~x", None);

  (parse_formula "x & x", Some (Variable_map.empty
                                |> Variable_map.add "x" true));
  (parse_formula "~x & ~x", Some (Variable_map.empty
                                  |> Variable_map.add "x" false));

  
]

(* Question 1 *)
(*----------------------------------------*)

(* TODO: Implement the function. *)

let find_sat_assignment_exc (formula : formula) : truth_assignment =
  let rec assign vars assignment =
    match vars with
    | [] -> if eval assignment formula then assignment else raise Unsatisfiable_formula
    | x::xs ->
        try
          assign xs (Variable_map.add x true assignment)
        with Unsatisfiable_formula ->
          assign xs (Variable_map.add x false assignment)
  in 
  assign (collect_variables formula) Variable_map.empty 
      



(* Question 2 *)
(*----------------------------------------*)

(* TODO: Implement the function. *)
let rec find_sat_assignment_cps (formula : formula)
    (return : truth_assignment -> 'r) (fail : unit -> 'r) : 'r =
  let rec assign vars assignment return fail =
    match vars with
    | [] -> if eval assignment formula then return assignment else fail ()
    | x::xs ->
        assign xs (Variable_map.add x true assignment)
          return
          (fun () -> assign xs (Variable_map.add x false assignment) return fail)
  in 
  assign (collect_variables formula) Variable_map.empty return fail

