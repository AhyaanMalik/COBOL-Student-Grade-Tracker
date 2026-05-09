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
       01 WS-AVG-SCORE     PIC ZZ9V99.
       01 WS-AVG-DISP      PIC ZZ9.99.
       01 WS-LETTER  PIC X.

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
           DISPLAY 'Student: ' WS-STUDENT-NAME
           DISPLAY 'Average Score: ' WS-AVG-DISP ' (' WS-LETTER ')'
           DISPLAY '------------'
           STOP RUN.


       CALCULATE-SCORE.
           ADD WS-SCORE1 TO WS-SCORE2 GIVING WS-TOTAL-SCORE
           ADD WS-SCORE3 TO WS-TOTAL-SCORE GIVING WS-TOTAL-SCORE
           DIVIDE WS-TOTAL-SCORE BY 3 GIVING WS-AVG-SCORE
           MOVE WS-AVG-SCORE TO WS-AVG-DISP.

       DETERMINE-GRADE.
           EVALUATE TRUE
           WHEN WS-AVG-SCORE >= 90
                MOVE 'A' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 80
                MOVE 'B' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 70
                MOVE 'C' TO WS-LETTER
           WHEN WS-AVG-SCORE >= 60
                MOVE 'D' TO WS-LETTER
           WHEN OTHER
                MOVE 'F' TO WS-LETTER
           END-EVALUATE.
