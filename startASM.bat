@echo off
color 71
title ASM 2
goto asm.mn-menumain
cls

:asm.mn-menumain
    cls

    echo %time%
    type version.txt
    echo Logged in as %whoami%
    echo -----------------------
    echo 1. AD tools
    echo 2. Networking tools
    echo 3. View computer info
    echo.
    echo X. Exit
    echo -----------------------
    echo.

        set /p asm.mn-menumain-input= Select an option from the list above:

    start noinp.vbs
    goto asm.mn-menumain
    REM:: Handles no input detection then returns to menu, implemented to other sections

            if %asm.mn-menumain-input% == 1 goto asm.adtools-menumain
            if %asm.mn-menumain-input% == 2 goto asm.nettools-menumain
            if %asm.mn-menumain-input% == 3 goto asm.sysinf
            if %asm.mn-menumain-input% == x exit
            if %asm.mn-menumain-input% == X exit
    
:asm.sysinf
    cls

    echo %time%
    type version.txt
    echo Logged in as %whoami%
    echo -----------------------
    systeminfo
    echo.
    echo Logged in as: %whoami%
    echo.
        pause
    goto asm.mn-menumain    

:asm.nettools-menumain
    cls
        echo %time%
        type version.txt
        echo Logged in as %whoami%
        echo -----------------------
        echo 1. Ping
        echo 2. View host IP config
        echo.
        echo X. Return to menu
        echo -----------------------
        
                set /p asm.nettools-inp=

            start noinp.vbs
            goto asm.nettools-menumain

                    if %asm.nettools-inp% == 1 goto asm.nettools-ping
                    if %asm.nettools-inp% == 2 goto asm.nettools-ipconfig
                    if %asm.nettools-inp% == x goto asm.mn-menumain
                    if %asm.nettools-inp% == X goto asm.mn-menumain
                
                :asm.nettools-ping
                cls

                echo %time%
                type version.txt
                echo Logged in as %whoami%
                echo -----------------------
                    set /p asm.nettools-ping-inp= Enter a host name or IP address to ping

                start noinp.vbs
                goto asm.nettools-ping

                    ping %asm.nettools-ping-inp%

                    pause
                goto asm.nettools-menumain

                :asm.nettools-ipconfig
                cls

                echo %time%
                type version.txt
                echo Logged in as %whoami%
                echo -----------------------
                    ipconfig
                echo.
                    pause
                goto asm.nettools-menumain

:asm.adtools-menumain

    cls

    echo %time%
    type version.txt
    echo Logged in as %whoami%
    echo -----------------------
    echo 1. Security Group settings
    echo 2. User account settings
    echo.
    echo -----------------------

    set /p asm.adtools-menumain-inp=

    start noinp.vbs
    goto asm.adtools-menumain


        if %asm.adtools-menumain-inp% == 1 goto asm.adtools-sgaddauto
        if %asm.adtools-menumain-inp% == 2 goto asm.adtools-uadas

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

            start noinp.vbs
            goto asm.adtools-sgaddauto-a

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
                        echo Type 'Exit' to return to the main menu
                        echo.
                        set /p ca-add-un= Please enter the user name to be added to this SG:

                        start noinp.vbs
                        goto ca-add-s1

                                    if %ca-add-un% == exit goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == Exit goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == EXit goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == EXIt goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == EXIT goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == eXIT goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == exIT goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == exiT goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == ExiT goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == eXIt goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == eXiT goto asm.adtools-sgaddauto-a
                                    if %ca-add-un% == ExIt goto asm.adtools-sgaddauto-a
                                    REM:: The presense of multiple lines of the same command ensures that the function works no matter how its typed once it is spelt correctly

                            powershell Add-ADGroupMember -Identity %ca-add-sg% -Members %ca-add-un%
    cls
                        echo.
                        echo User %ca-add-un% added to SG %ca-add-sg%. Please continue.

                goto ca-add-s1

    :csv-add
    cls

    echo Application not yet available.
    pause

    goto asm.adtools-sgaddauto-a



