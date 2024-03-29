(* ovid-tokens.sml
 *
 * COPYRIGHT (c) 2024 John Reppy (http://cs.uchicago.edu/~jhr)
 * All rights reserved.
 *
 * Sample code
 * CMSC 22600
 * Spring 2024
 * University of Chicago
 *
 * The representation of tokens in the ML Lite scanner.
 *)

structure OvidTokens =
  struct

    datatype token
      = KW_case                 (* "case" *)
      | KW_do                   (* "do" *)
      | KW_else                 (* "else" *)
      | KW_end                  (* "end" *)
      | KW_fun                  (* "fun" *)
      | KW_if                   (* "if" *)
      | KW_in                   (* "instance" *)
      | KW_instance             (* "instance" *)
      | KW_let                  (* "let" *)
      | KW_of                   (* "of" *)
      | KW_overload             (* "overload" *)
      | KW_then                 (* "then" *)
      | KW_type                 (* "type" *)
      | LP                      (* "(" *)
      | RP                      (* ")" *)
      | LB                      (* "[" *)
      | RB                      (* "]" *)
      | LCB                     (* "{" *)
      | RCB                     (* "}" *)
      | ORELSE                  (* "||" *)
      | ANDALSO                 (* "&&" *)
      | EQ                      (* "=" *)
      | EQEQ                    (* "==" *)
      | NEQ                     (* "!=" *)
      | LTEQ                    (* "<=" *)
      | LT                      (* "<" *)
      | PLUS                    (* "+" *)
      | MINUS                   (* "-" *)
      | TIMES                   (* "*" *)
      | DIV                     (* "/" *)
      | MOD                     (* "%" *)
      | COMMA                   (* "," *)
      | COLON                   (* ":" *)
      | BAR                     (* "|" *)
      | ARROW                   (* "->" *)
      | DARROW                  (* "=>" *)
      | WILD                    (* "_" *)
      | UID of Atom.atom        (* leading-upper-case identifiers *)
      | LID of Atom.atom        (* leading-lower-case identifiers *)
      | NUMBER of IntInf.int    (* integer literals *)
      | STRING of string        (* string literals *)
      | EOF

    fun toString tok = (case tok
           of KW_case => "case"
            | KW_do => "do"
            | KW_else => "else"
            | KW_end => "end"
            | KW_fun => "fun"
            | KW_if => "if"
            | KW_in => "in"
            | KW_instance => "instance"
            | KW_let => "let"
            | KW_of => "of"
            | KW_overload => "overload"
            | KW_then => "then"
            | KW_type => "type"
            | LP => "("
            | RP => ")"
            | LB => "["
            | RB => "]"
            | LCB => "{"
            | RCB => "}"
            | ORELSE => "||"
            | ANDALSO => "&&"
            | EQ => "="
            | EQEQ => "=="
            | NEQ => "!="
            | LTEQ => "<="
            | LT => "<"
            | PLUS => "+"
            | MINUS => "-"
            | TIMES => "*"
            | DIV => "/"
            | MOD => "%"
            | COMMA => ","
            | COLON => ":"
            | BAR => "|"
            | ARROW => "->"
            | DARROW => "=>"
            | WILD => "_"
            | UID _ => "UID"
            | LID _ => "LID"
            | NUMBER _ => "NUMBER"
            | STRING _ => "STRING"
            | EOF => "EOF"
          (* end case *))

  end (* OvidTokens *)
