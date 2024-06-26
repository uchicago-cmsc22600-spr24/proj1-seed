(* parser.sml
 *
 * COPYRIGHT (c) 2024 John Reppy (http://cs.uchicago.edu/~jhr)
 * All rights reserved.
 *
 * Sample code
 * CMSC 22600
 * Spring 2024
 * University of Chicago
 *
 * Wrapper for the ML-ULex generated scanner.
 *)

structure Parser : sig

  (* `lexer (inStrm, errStrm, outStrm)` tests the scanner by printing tokens
   * from `inStrm` to the given output stream.  Any lexer errors are reported
   * in the output stream after the input is tokenized.  Returns `true` if there
   * were errors or warnings reported, and `false` otherwise.
   *)
    val lexer : TextIO.instream * Error.err_stream * TextIO.outstream -> bool

  end = struct

    structure Tok = OvidTokens

  (* error function for lexers *)
    fun lexErr errStrm (span, msg) = Error.errorAt(errStrm, span, msg)

  (* to get ADD and DEL constructors *)
    datatype add_or_delete = datatype AntlrRepair.add_or_delete

  (* map tokens to strings *)
    fun tokToString (Tok.LID x) = "LID " ^ Atom.toString x
      | tokToString (Tok.UID x) = "UID " ^ Atom.toString x
      | tokToString (Tok.NUMBER i) = "NUMBER " ^ IntInf.toString i
      | tokToString (Tok.STRING s) = concat["STRING \"", String.toString s, "\""]
      | tokToString tok = Tok.toString tok

  (* test scanner by printing tokens from `inStrm` to the given output stream *)
    fun lexer (inStrm, errStrm, outStrm) = let
          val lex = OvidLex.lex (Error.sourceMap errStrm) (lexErr errStrm)
        (* finish up by reporting the errors (if any) *)
          fun finish () = if Error.anyWarnings errStrm orelse Error.anyErrors errStrm
                then (
                  TextIO.output(outStrm, "===== ERRORS =====\n");
                  Error.report (outStrm, errStrm);
                  true)
                else false
          fun get strm = let
                val (tok, span, strm) = lex strm
                val loc = Error.location (errStrm, span)
                in
                  TextIO.output(outStrm, concat[
                      StringCvt.padRight #" " 23 (tokToString tok), " ",
                      Error.locToString loc, "\n"
                    ]);
                  case tok
                   of Tok.EOF => finish ()
                    | _ => get strm
                  (* end case *)
                end
          in
            get (OvidLex.streamify (fn () => TextIO.input inStrm))
               handle ex => (
                ignore (finish ());
                TextIO.output(outStrm, concat["***** ", General.exnName ex, " raised\n"]);
                true)
          end

  end
