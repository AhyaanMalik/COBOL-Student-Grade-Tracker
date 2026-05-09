       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRADETRACKER.
       AUTHOR. AHYAAN-MALIK.

       ENVIRONMENT DIVISION. 

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-STUDENT      PIC X(30).
       01 WS-SCORE1       PIC 999V99.
       01 WS-SCORE2       PIC 999V99.
       01 WS-SCORE3       PIC 999V99.
       01 WS-TOTAL-SCORE  PIC 999V99.
       01 WS-AVG-SCORE    PIC 999V99.
       01 WS-AVG-DISP     PIC ZZ9.99.
       01 WS-LETTER       PIC X(2).
       01 WS-OUTPUT       PIC X(20).
       01 WS-MESSAGE      PIC X(40).
       01 WS-CONTINUE     PIC X      VALUE 'Y'.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY '========================================'
           DISPLAY '          STUDENT GRADE REPORT          '
           DISPLAY '========================================'

           PERFORM UNTIL WS-CONTINUE NOT = 'Y'
                   DISPLAY 'Enter Student Name: ' WITH NO ADVANCING
                   ACCEPT WS-STUDENT
                   DISPLAY 'Enter Score 1 (0-100): ' WITH NO ADVANCING
                   ACCEPT WS-SCORE1
                   DISPLAY 'Enter Score 2 (0-100): ' WITH NO ADVANCING
                   ACCEPT WS-SCORE2
                   DISPLAY 'Enter Score 3 (0-100): ' WITH NO ADVANCING
                   ACCEPT WS-SCORE3
                   PERFORM CALCULATE-SCORE
                   PERFORM DETERMINE-GRADE

                   STRING FUNCTION TRIM(WS-AVG-DISP)
                          ' ('
                          FUNCTION TRIM(WS-LETTER)
                          ')'
                      DELIMITED BY SIZE INTO WS-OUTPUT

                   DISPLAY ' '
                   DISPLAY 'Results for Student: ' FUNCTION TRIM
                      (WS-STUDENT)
                   DISPLAY '----------------------------------------'

                   DISPLAY 'Average Score: ' WS-OUTPUT
                   DISPLAY FUNCTION TRIM(WS-MESSAGE)
                   DISPLAY '========================================'
                   DISPLAY ' '

                   DISPLAY 'Enter another student? (Y/N): '
                      WITH NO ADVANCING
                   ACCEPT WS-CONTINUE
           END-PERFORM
           STOP RUN.


       CALCULATE-SCORE.
           ADD WS-SCORE1 TO WS-SCORE2 GIVING WS-TOTAL-SCORE
           ADD WS-SCORE3 TO WS-TOTAL-SCORE GIVING WS-TOTAL-SCORE
           DIVIDE WS-TOTAL-SCORE BY 3 GIVING WS-AVG-SCORE
           MOVE WS-AVG-SCORE TO WS-AVG-DISP.

       DETERMINE-GRADE.
           EVALUATE TRUE
           WHEN WS-AVG-SCORE >= 93.0
                MOVE 'A ' TO WS-LETTER
                MOVE 'Exceptional Mastery of Material' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 90.0
                MOVE 'A-' TO WS-LETTER
                MOVE 'Outstanding Performance' TO WS-MESSAGE 
           WHEN WS-AVG-SCORE >= 87.0
                MOVE 'B+' TO WS-LETTER
                MOVE 'Very Strong Understanding' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 83.0
                MOVE 'B ' TO WS-LETTER
                MOVE 'Solid Above Average Work' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 80.0
                MOVE 'B-' TO WS-LETTER
                MOVE 'Good Effort - Keep Pushing' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 77.0
                MOVE 'C+' TO WS-LETTER
                MOVE 'Above Average Competency' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 73.0
                MOVE 'C ' TO WS-LETTER
                MOVE 'Satisfactory Basic Completion' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 70.0
                MOVE 'C-' TO WS-LETTER
                MOVE 'Warning: Marginal Performance' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 67.0
                MOVE 'D+' TO WS-LETTER
                MOVE 'Needs Attention - Below Standard' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 63.0
                MOVE 'D ' TO WS-LETTER
                MOVE 'Poor Results - Review Required' TO WS-MESSAGE
           WHEN WS-AVG-SCORE >= 60.0
                MOVE 'D-' TO WS-LETTER
                MOVE 'Critical Status - Near Failure' TO WS-MESSAGE
           WHEN OTHER
                MOVE 'F ' TO WS-LETTER
                MOVE 'Unsatisfactory - Fail' TO WS-MESSAGE
           END-EVALUATE.
           