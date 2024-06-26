      *****************************************************************
      * Program name:    STRINGIT                            
      * Original author: Dave Nicolette            
      *
      * Demonstrates:
      *
      * How to manipulate data items using STRING, UNSTRING, INSPECT,
      * and reference modification.
      *
      * This program performs various operations to manipulate text
      * values and displays the results on stdout (SYSOUT).
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  STRINGIT.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  FILLER. 
           05  WS-NAME.
               10  WS-FAMILY-NAME            PIC X(60) VALUE 'Kirk'.
               10  WS-GIVEN-NAME             PIC X(60) VALUE 'James'.
               10  WS-MIDDLE-NAME            PIC X(60) VALUE 'Tiberius'.
           05  WS-NAMES-IN-OUTPUT-ORDER.
               10  WS-GIVEN-NAME-OUT         PIC X(60).
               10  WS-MIDDLE-NAME-OUT        PIC X(60).
               10  WS-FAMILY-NAME-OUT        PIC X(60).
           05  WS-NAME-LENGTHS.
               10  WS-GIVEN-NAME-LENGTH      PIC S9(3).
               10  WS-MIDDLE-NAME-LENGTH     PIC S9(3).
               10  WS-FAMILY-NAME-LENGTH     PIC S9(3).
               10  WS-OUTPUT-LENGTH          PIC S9(3).
           05  WS-OUTPUT-AREA                PIC X(180).

       PROCEDURE DIVISION.

           DISPLAY " "
           DISPLAY 'Example 1: Formatting a persons name '
               'using MOVE statements'
           MOVE WS-GIVEN-NAME TO WS-GIVEN-NAME-OUT
           MOVE WS-MIDDLE-NAME TO WS-MIDDLE-NAME-OUT
           MOVE WS-FAMILY-NAME TO WS-FAMILY-NAME-OUT 
           DISPLAY 'Name in first-middle-last-order:'
           DISPLAY'<' WS-NAMES-IN-OUTPUT-ORDER '>'

           DISPLAY " "
           DISPLAY 'Example 3: Formatting a persons name '
               'using STRING'
           DISPLAY '<', WS-GIVEN-NAME, " ", WS-MIDDLE-NAME, " ", 
               WS-FAMILY-NAME, '>'
           .