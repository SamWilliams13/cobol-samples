      *****************************************************************
      * Program name:    HELLO                            
      * Original author: Dave Nicolette            
      *
      * Demonstrates:
      *
      * How to handle variable-length text values using the INSPECT
      * and STRING verbs and the REVERSE intrinsic function.
      *
      * This program prompts the user for a name via stdin (SYSIN) and
      * then writes a greeting of the form, "Hello, Your Name!" to
      * stdout (SYSOUT).
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  HELLO.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  WS-MESSAGES.
           05  WS-PROMPT             PIC X(20) 
                                     VALUE 'Please enter a name:'.
           05  WS-FRIEND             PIC X(80) VALUE " ".
           05  WS-GREETING           PIC X(07) VALUE 'Hello, '.
           05  WS-EXCLAMATION-POINT  PIC X VALUE '!'.
       PROCEDURE DIVISION.
           DISPLAY WS-PROMPT
           ACCEPT WS-FRIEND

           DISPLAY WS-GREETING WS-FRIEND WS-EXCLAMATION-POINT
           .