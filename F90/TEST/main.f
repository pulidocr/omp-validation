!*******************************************************
! The main driver for the Fortran tests
!
! Two parts are automatically generated from a customized test file 
!      via a bash script preCompilation
! Part1: testdeclarations.f the integer declaration for test functions
! Part2: mainBody.f         the repetitive source code for tests
!
! Author: Chunhua Liao, University of Houston
! Date: May, 13 2005
!
! In order to test more compilers, we change character*20
! into character (LEN=20), which is standard Fortran90.
! Also we get rid of the "tab" and use "space" instead.
! Changed by Zhenying Liu on Oct. 16, 2005.
!*******************************************************

        program main

        implicit none
        integer num_tests/0/
        integer failed/0/
        integer success/0/
        integer N
        parameter (N=20)
        integer crosschecked/0/, crossfailed/0/, j/1/
        integer temp,temp1  ! used to store test results
        character (LEN=20):: logfilename,logfile2
        integer result/1/
        include 'omp_testsuite.f'

! integer part for desired tests
        include 'testdeclarations.f' 

!        write (*,*) "Enter logFilename:"
!        read  (*,*) logfilename
         logfilename="test.log"
         logfile2="failed.complilation"
        open (1, FILE = Logfilename)

        write(*,*)
     &  "######## OpenMP Validation Suite V 1.0 ######"
        write(*,*) "## Repetitions: ",N,
     &  "                       ####"
        write(*,*) "## Loop Count : ",LOOPCOUNT,
     &  "                    ####"
        write(*,*)
     &  "##############################################"


!*********************************************************
! beginning of the repeat part
        include 'mainBody.f'

! print summary information for all tests
        write(1,*)
        write(1,*)
        write(1,*) " Performed a total of ",num_tests,"tests, ",
     &  failed," failed and ",success," successful with ",
     &  crosschecked,"cross checked"
        write(1,*)
     &  "For detailled inforamtion on the tests see the logfile:",
     &  logFileName

        close(1)
        write(*,*)
        write(*,*)
        write(*,*) " Performed a total of ",num_tests,"tests, ",
     &  failed," failed and ",success," successful with ",
     &  crosschecked,"cross checked"
        write(*,*)
     &  "For detailled inforamtion on the tests see the logfile:",
     &  logFileName
        write(*,*)
     &  "Also check tests which cannot pass the compilation in:",
     &  logFile2
        end program main

