      *****************************************************************
      * Program name:    INVCALC                           
      * Original author: Dave Nicolette            
      *
      * Demonstrates:
      *
      * How to write typical business calculations in Cobol.
      *
      * This program calculates invoice totals for fake invoice data.
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  INVCALC.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  FILLER. 
           05  SALES-TAX-RATE           PIC SV9(5) VALUE 0.065.
           05  WORKING-INDEX            PIC S9(04).
           05  CUMULATIVE-PRICE-BEFORE-TAX PIC S9(07)V99.
           05  CUMULATIVE-PRICE-WITH-TAX   PIC S9(07)V99.
           05  CUMULATIVE-SALES-TAX     PIC S9(05)V9(03).
           05  LINE-WORKING-TOTAL       PIC S9(07)V99.
           05  LINE-WORKING-TAX         PIC S9(05)V9(03).

       01  INVOICE.
           05  INV-DATE                 PIC X(08). 
           05  INV-NUMBER               PIC X(08). 
           05  INV-TOTAL-AMOUNT         PIC S9(07)V99  .
           05  INV-TOTAL-BEFORE-TAX     PIC S9(07)V99 . 
           05  INV-TOTAL-SALES-TAX      PIC S9(05)V9(03) .
           05  INV-RETURN               PIC X.  
           05  INV-LINE-ITEM-COUNT      PIC S9(05) .
           05  INV-LINE OCCURS 100 TIMES.
               10  INV-LINE-SKU         PIC X(10). 
               10  INV-LINE-UNIT-PRICE  PIC S9(05)V99 . 
               10  INV-LINE-QUANTITY    PIC S9(05) .
               10  INV-LINE-TAXABLE     PIC X.        

       PROCEDURE DIVISION.

      *---------------------------------------------------------------
      * Example 1: Invoice total calculation 

           MOVE '20230914' TO INV-DATE  
           MOVE 'Sample 1' TO INV-NUMBER 
           MOVE 3 TO INV-LINE-ITEM-COUNT   
           
           MOVE 'PROD004411' TO INV-LINE-SKU(1)  
           MOVE 18.55 TO INV-LINE-UNIT-PRICE(1)
           MOVE 2 TO INV-LINE-QUANTITY(1)
           
           MOVE 'PROD004412' TO INV-LINE-SKU(2)  
           MOVE 6.32 TO INV-LINE-UNIT-PRICE(2)
           MOVE 4 TO INV-LINE-QUANTITY(2)
           
           MOVE 'PROD004413' TO INV-LINE-SKU(3)  
           MOVE 2.28 TO INV-LINE-UNIT-PRICE(3)
           MOVE 8 TO INV-LINE-QUANTITY(3)

           MOVE 0 TO CUMULATIVE-PRICE-BEFORE-TAX 
                        CUMULATIVE-PRICE-WITH-TAX 
                        CUMULATIVE-SALES-TAX 
                        WORKING-INDEX
                    
           PERFORM
                   VARYING WORKING-INDEX 
                   FROM 1 BY 1 
                   UNTIL WORKING-INDEX > INV-LINE-ITEM-COUNT 
                   MOVE 0 
                       TO LINE-WORKING-TOTAL 
                          LINE-WORKING-TAX
                   MULTIPLY 
                       INV-LINE-QUANTITY(WORKING-INDEX) 
                       BY INV-LINE-UNIT-PRICE(WORKING-INDEX) 
                       GIVING LINE-WORKING-TOTAL 
                   END-MULTIPLY 
                   ADD LINE-WORKING-TOTAL 
                       TO CUMULATIVE-PRICE-BEFORE-TAX
                   END-ADD    
                       MULTIPLY LINE-WORKING-TOTAL
                           BY SALES-TAX-RATE 
                           GIVING LINE-WORKING-TAX
                       END-MULTIPLY 
                       ADD LINE-WORKING-TAX 
                           TO LINE-WORKING-TOTAL    
                   ADD LINE-WORKING-TOTAL 
                       TO CUMULATIVE-PRICE-WITH-TAX
                   END-ADD     
                   ADD LINE-WORKING-TAX 
                       TO CUMULATIVE-SALES-TAX    
                   END-ADD
           END-PERFORM.   

           MOVE CUMULATIVE-SALES-TAX TO INV-TOTAL-SALES-TAX 
           MOVE CUMULATIVE-PRICE-BEFORE-TAX  TO INV-TOTAL-BEFORE-TAX 
           MOVE CUMULATIVE-PRICE-WITH-TAX TO INV-TOTAL-AMOUNT.    


       PRINT-INVOICE-DETAILS. 
           DISPLAY " " 
           DISPLAY '----------------------------------------'
           DISPLAY 'Invoice Number:   ' INV-NUMBER
           DISPLAY 'Invoice Date:     ' INV-DATE     
           DISPLAY 'Total Amount:     ' INV-TOTAL-AMOUNT  
           DISPLAY 'Total Before Tax: ' INV-TOTAL-BEFORE-TAX 
           DISPLAY 'Total Sales Tax:    ' INV-TOTAL-SALES-TAX
           DISPLAY 'Sales Tax Rate:     ' SALES-TAX-RATE  

           PERFORM 
               VARYING WORKING-INDEX
               FROM 1 BY 1
               UNTIL WORKING-INDEX > INV-LINE-ITEM-COUNT 
               DISPLAY ' ' 
               DISPLAY 'Line ' WORKING-INDEX
               DISPLAY 'SKU  ' INV-LINE-SKU(WORKING-INDEX)
               DISPLAY 'Quantity ' INV-LINE-QUANTITY(WORKING-INDEX)   
               DISPLAY 'Unit Price:  '
                   INV-LINE-UNIT-PRICE(WORKING-INDEX)
           END-PERFORM.
