      *****************************************************************
      * Program name:    BRAKES                            
      * Original author: Dave Nicolette            
      *
      * Demonstrates:
      *
      * How to code engineering calculations in Cobol. 
      *
      * This program solves a problem posed on the Internet to compute
      * the temperature of truck brakes after a downhill drive.
      * See https://courses.lumenlearning.com/physics/chapter/
      *     14-2-deltaT-Celsius-and-heat-capacity/.
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  BRAKES.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  GIVEN-VALUES.
      * Mass of brake material in KG
           05  m                           PIC 999 VALUE 100.
      * Specific heat of brake material in Joules per KG x Temp Celsius
           05  sh                          PIC 999 VALUE 800.
      * Weight of the truck in KG
           05  w                           PIC 9(5) VALUE 10000.
      * Vertical displacement on the downhill run in meters
           05  d                           PIC 99V9 VALUE 75.0.
      * a: 9.8 meters per second squared
           05  a                           PIC 9V9 VALUE 9.8.

       01  CALCULATED-VALUES.
      * Gravitational potential energy loss of the truck in descent
           05  Mgh                         PIC 9(6)V9(6).
      * Temperature change in Celsius from the heat exchange
           05  deltaT-Celsius              PIC 9(6)V9(6).
      * Mass of brake material times specific heat
           05  mc                          PIC 9(6)V9(6).

       PROCEDURE DIVISION.

      * Calculate Mgh (loss of potential energy of the truck) 
      * Mgh = (10,000 kg)(9.80 m/s2)(75.0 m) = 7.35 × 106 J.

           COMPUTE Mgh =  w * a * d

      * Calculate the temperature change Mgh / m * c 
      * where m is the mass of the brake material 
      * and c is the specific heat given in the problem setup.

           COMPUTE mc = m * sh     
           COMPUTE deltaT-Celsius = 
               Mgh / mc 
           END-COMPUTE     

           DISPLAY 'deltaT-Celsius: ' deltaT-Celsius
           .