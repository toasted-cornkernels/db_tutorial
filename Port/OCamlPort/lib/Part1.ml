let exit_metacommand = ".exit"

let rec part1_main () =
  let input_command : String.t = Scanf.scanf "db> %s" Fn.identity in
  if String.equal input_command exit_metacommand then ()
  else Printf.printf "Unrecognized command '%s'.\n" input_command ;
  part1_main ()
