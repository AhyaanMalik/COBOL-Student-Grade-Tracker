       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRADETRACKER.
       AUTHOR. AHYAAN-MALIK.

       ENVIRONMENT DIVISION. 

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-STUDENT-NAME PIC X(30).
       01 WS-SCORE PIC 999.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY 'Grade Tracker'
           DISPLAY '------------'
           DISPLAY 'Enter Student Name: '
           ACCEPT WS-STUDENT-NAME
           DISPLAY 'Enter Score (0-100): '
           ACCEPT WS-SCORE
           DISPLAY 'Student: ' WS-STUDENT-NAME
           DISPLAY 'Score: ' WS-SCORE 
           STOP RUN.
