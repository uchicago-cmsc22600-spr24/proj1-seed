(* ovid.lex
 *
 * COPYRIGHT (c) 2024 John Reppy (http://cs.uchicago.edu/~jhr)
 * All rights reserved.
 *
 * Sample code
 * CMSC 22600
 * Spring 2024
 * University of Chicago
 *
 * ML-Ulex specification for Ovid.
 *)

%name OvidLex;

%arg (lexErr);

%defs(

    structure T = OvidTokens

  (* some type lex_result is necessitated by ml-ulex *)
    type lex_result = T.token

(* MORE DEFINITIONS HERE *)

);

(* Minimal lexer that rejects all input *)
<INITIAL>.              => (lexErr(
                              (yypos, yypos),
                              ["bad character `", String.toString yytext, "'"]);
                            continue());
<INITIAL> <<EOF>>       => (T.EOF);
