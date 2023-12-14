exception TODO

module MetaCommand = struct
  type t = Success | Unrecognized [@@deriving compare, equal]
end

module Statement = struct
  module Type = struct
    type t = Insert | Select [@@deriving compare, equal]
  end

  type t = Type of Type.t [@@deriving compare, equal]
end

module PrepareResult = struct
  type t = Success of Statement.t | Unrecognized [@@deriving compare, equal]
end

let exit_metacommand = ".exit"

let prepare_statement (input_command : String.t) : PrepareResult.t =
  if String.is_prefix input_command ~prefix:"insert" then Success (Type Insert)
  else if String.is_prefix input_command ~prefix:"select" then Success (Type Select)
  else Unrecognized


let execute_statement (statement : Statement.t) =
  match statement with Type Insert -> `STUB | Type Select -> `STUB


let execute_meta_command (input_command : String.t) : MetaCommand.t =
  if String.equal input_command exit_metacommand then exit 0 else Unrecognized


let rec part2_main () =
  let input_command : String.t = Scanf.scanf "db> %s" Fn.id in
  if String.equal input_command exit_metacommand then ()
  else Printf.printf "Unrecognized command '%s'.\n" input_command ;
  part2_main ()
