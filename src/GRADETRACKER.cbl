       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRADETRACKER.
       AUTHOR. AHYAAN-MALIK.

       ENVIRONMENT DIVISION. 

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-STUDENT-NAME  PIC X(30).
       01 WS-SCORE1        PIC 999V99.
       01 WS-SCORE2        PIC 999V99.
       01 WS-SCORE3        PIC 999V99.
       01 WS-TOTAL-SCORE   PIC 999V99.
       01 WS-AVG-SCORE     PIC 999V99.
       01 WS-AVG-DISP      PIC ZZ9.99.
       01 WS-LETTER        PIC X(2).
       01 WS-OUTPUT        PIC X(20).

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY 'Grade Tracker'
           DISPLAY '------------'
           DISPLAY 'Enter Student Name: '
           ACCEPT WS-STUDENT-NAME
           DISPLAY 'Enter Score 1 (0-100): '
           ACCEPT WS-SCORE1
           DISPLAY 'Enter Score 2 (0-100): '
           ACCEPT WS-SCORE2
           DISPLAY 'Enter Score 3 (0-100): '
           ACCEPT WS-SCORE3
           PERFORM CALCULATE-SCORE
           PERFORM DETERMINE-GRADE

           STRING WS-AVG-DISP ' (' FUNCTION TRIM(WS-LETTER) ')'
              DELIMITED BY SIZE INTO WS-OUTPUT
           
           DISPLAY 'Student: ' WS-STUDENT-NAME
           DISPLAY 'Average Score: ' WS-OUTPUT
           DISPLAY '------------'
           STOP RUN.


       CALCULATE-SCORE.
           ADD WS-SCORE1 TO WS-SCORE2 GIVING WS-TOTAL-SCORE
           ADD WS-SCORE3 TO WS-TOTAL-SCORE GIVING WS-TOTAL-SCORE
           DIVIDE WS-TOTAL-SCORE BY 3 GIVING WS-AVG-SCORE
           MOVE WS-AVG-SCORE TO WS-AVG-DISP.

       DETERMINE-GRADE.
           EVALUATE TRUE
           WHEN WS-AVG-SCORE >= 93.0
                MOVE 'A' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 90.0
                MOVE 'A-' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 87.0
                MOVE 'B+' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 83.0
                MOVE 'B' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 80.0
                MOVE 'B-' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 77.0
                MOVE 'C+' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 73.0
                MOVE 'C' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 70.0
                MOVE 'C-' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 67.0
                MOVE 'D+' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 63.0
                MOVE 'D' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 60.0
                MOVE 'D-' TO WS-LETTER
           WHEN OTHER
                MOVE 'F' TO WS-LETTER
           END-EVALUATE.
           