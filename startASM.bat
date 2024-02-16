@echo off
color 71
title ASM 2.0.1
goto asm.mn-menumain
cls

:asm.mn-menumain
cls

echo %time%
type version.txt
echo Logged in as %whoami%
echo -----------------------
echo 1. AD tools
echo.
echo -----------------------
echo.

    set /p asm.mn-menumain-input= Select an option from the list above:
        if %asm.mn-menumain-input% == 1 goto asm.adtools-menumain

    :asm.adtools-menumain
    cls

    echo %time%
    type version.txt
    echo Logged in as %whoami%
    echo -----------------------
    echo 1. Security Group settings
    echo.
    echo -----------------------

    set /p asm.adtools-menumain-inp=
        if %asm.adtools-menumain-inp% == 1 goto asm.adtools-sgaddauto

        :asm.adtools-sgaddauto
cls

            :asm.adtools-sgaddauto-a
            
            echo %time%
            type version.txt
            echo Logged in as %whoami%
            echo -----------------------
            echo 1. Continuous add (Add multiple users to the same SG - Goes in a loop - will have to close app to reset)
            echo 2. Single add (Add one user to one SG - returns to the main menu)
            echo 3. CSV Add (not implemented yet)
            echo.
            echo X - Exit
            echo -----------------------
            
            set /p input= Please select an option:
               if %input% == 1 goto sgaddauto-ca-add
               if %input% == 2 goto sa-add
               if %input% == 3 goto csv-add
               if %input% == x exit
               if %input% == X exit
               
               :sa-add
cls
                   set /p sa-add-sg= Please enter the name of the security group (example: sg_headoffice)
                   set /p sa-add-un= Please enter the user name to be added to this SG:
            powershell Add-ADGroupMember -Identity %sa-add-sg% -Members %sa-add-un%
cls

        echo User %sa-add-un% added to security group %sa-add-sg%. Please press any key to return to the menu.
        pause
goto asm.adtools-sgaddauto-a

 

 

 

 

                :sgaddauto-ca-add
                    set /p ca-add-sg= Please enter the name of the security group (example: sg_headoffice):
cls

                goto ca-add-s1

                    :ca-add-s1
                        set /p ca-add-un= Please enter the user name to be added to this SG:

                            powershell Add-ADGroupMember -Identity %ca-add-sg% -Members %ca-add-un%
cls
                        echo.
                        echo User %ca-add-un% added to SG %ca-add-sg%. Please continue.

                goto ca-add-s1

:csv-add
cls

    echo No.
pause

goto asm.adtools-sgaddauto-a



