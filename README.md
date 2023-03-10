# Windows OS Auto-Cleaner
Easy way of executing system file checker and deployment image and servicing commands with an intuitive user-interface with built-in instructions for recommended use. Works for Windows XP and higher with no other files or downloads required. 

# The Story
There was a point in my life where I was so broke that I was willing to download free software from anywhere. And I mean *anywhere*. I'm not going to delve any further into this because I imagine that there would be potentially a lot of trouble that could come from me disclosing this information, but even after honestly saving enough money to support developers, my PC was crawling with malware that hitchhiked a ride alongside the software I would download (especially those password protected .zip files eugh) and I had to learn very quickly how to protect my PC. Of course, creating stronger passwords, getting an antivirus, and reducing my digital footprint (ironic as that sounds as I hope to develop software professionally one day) in the ways that mattered was definitely a good first step. But in my apartment sits an old solid-state drive with my old OS and old system files that sits hopelessly corrupted and completely infested with malware. Each time I connect this drive to another PC to attempt to recover the data results in the introduction of malware and corruption on my new system, which eventually spirals into more bricked drives with no hope of recovery. Even the Geek Squad couldn't install a clean version of Windows because of how broken the drive was.  

Now like many of you out there (or not many of you our there, kudos to people who aren't as mistake-prone as I am) I have delved the forums, YouTube videos, etc. (from my phone naturally as my PC was in heaps of trouble) attempting to find solutions to the problem. And there were a few conclusions that I drew from the time that I've spent hitchiking through the galaxy. First thing is that guides are essentially useless as many of them are attempting to sell third-party software to help recover your system. While they might have nuggets of information here and there, the vast majority of the information that they share is fodder in order to create SEO fluff. The second thing is that YouTube videos don't feel *definitive*. I don't know how else to explain it, but they don't feel like they exhaust every possibility in terms of recovery (at least without downloading third-party software), or they only include one or two solutions to the problem. 

Well I've felt that pain, multiple times. And this project is one where the README.md is just as valuable as the software. Because in this README.md, I include the heuristic I use to solve corruption across the board without third-party software (not to say that third-party software is inherently bad, I just wanted to make a guide that did not really promote third-party software per se) that I've used to recover my own data countless times, and to save the livelihoods, sanity, and time of many others. So in essence, this is one of the few times the README file is just as valuable as the software itself, if not more. I posted this to Github just to prove the point that this is entirely not commercially supported, and I hope to get no financial gain out of sharing this information publicly. I believe this is information that should be taught to the basic Windows User (I mean you're never taught how to drive a car without knowing how to drive it safely - why not do the same for software).
# Why you should use Auto-Cleaner
Mainly for ease of use. So many people overlook frequently checking their system for corruption, especially for systems that have high computational loads (I'm looking at you gamers). I recommend running this every other month or so to ensure that everything is running safely. You could enter the commands in manually, but it's such a hassle and it's no fun. I made this just so that it is much easier to run these commands. 

## System File Checker (SFC)
The first command that is executed is system file checker (`sfc /scannow`). This command scans all protected system files and replaces corrupted files with a cached copy located in %WinDir%\System32\dllcache. For a more in-depth look at the documentation for DISM's command-line arguments [here](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/dism-operating-system-package-servicing-command-line-options?view=windows-11).

## Microsoft Windows Deployment Image Servicing and Management (DISM)
The specific command executed is `DISM -online -cleanup-image -restorehealth`. In general, DISM is a suite of services used to service and prepare Windows images. Below is an explanation of each of the flags. 

### -online
DISM can also be used to service Windows OS residing outside of the drive that executed the command. Online in this context refers to an OS which is currently running from the machine which issued the command (i.e. it tells the service that it's your machine that needs to be serviced).

### -cleanup-image
Performs cleanup or recovery operations on the image. 

### -restorehealth
Scans the image for component store corruption, and then performs repair operations automatically. This operation usually takes the longest of the three (according to documentation, "several minutes").

## Explanation on why these commands
So these are generally regarded as the commands to run (outside of chkdsk /f /r, which often requires a system restart) when dealing with system corruption, and for the general case can take care of corruption from day-to-day tasks such as incorrect system shutdowns, crashed programs, user error, etc. These are low-impact things and as a biochemist, it is important to target two systems at once to ensure redundancy - if one is too corrupted, then the other can fill its place. I recommend that if SFC detects any corruption, it is important to run the file repeatedly until SFC gives the all-clear (i.e. no integrity violations detected, all explained in the user-interface of the Auto-Cleaner).

# Use
Everything on the file should be supported by native Windows OS installation (updated for Windows 11). To use the file, simply download the .bat file and run it. Functionality is entirely self-contained and only uses functionality afforded by the built in cmd.exe program. You may run into antiviruses blocking .bat files and for good reason - executing .bat files is a fantastic way to get malware installed or get malware access onto your computer. Please allow the file to run, and if in doubt of whether or not this file is safe, go ahead and view the source code to make sure nothing fishy is going on for yourself (and I promise you there isn't).

Use of the program requires administrator-level access. Please run the file using administrator access (to make this process easier, go to file properties and under compatability select always run as administrator). The file will check whether administrator-level access has been granted before executing files. 

## Preventing/Fixing System-Wide Corruption (Without Installing 3rd Party Software)
I have a general heuristic on how to prevent corruption on Windows OS machines that I typically use, and some ideas for recovery should the dreaded day ever come. Progress through each step if the previous fails.  
  

    1. Frequently run the Auto-Cleaner file (I'd say every other month or so) to get rid of corruption that might slip through the cracks over time (especially if you frequently shut off the system incorrectly).  
      
    2. If you have the space, frequently create restore points and backups of your system just in case you ever get compromised.  
      
    3. If the file isn't fixing problems or your system is too corrupted to even run the file, go into your BIOS and starting OS in safe mode and running Auto-Cleaner in there.  
        
    4. If you still have issues, run chkdsk /f /r and typing yes to the prompt and restarting your PC (also running antivirus scans at this point would be recommended as well if you haven't already).  
      
    5. If chkdsk didn't work or if some reason you can't boot into safe mode, your options are pretty bleak and will have to move to more drastic measures.    
        a. If you have a restore point for your Windows OS, enter the windows recovery environment (3 unsuccessful boots will trigger this, you can do this manually by turning on and  
        off your pc with the power button 3 times before BIOS has a chance to load windows, or use the function keys - they are so inconsistent that for your version of Windows I recommend looking up how to access BIOS if the former idea seems too extreme for you).  
          
        b. If you don't have a restore point or a backup, you can reinstall windows using the built-in windows reinstaller. Please note if you get to this point, it's likely that this is not working. Choose whether or not you'd like to keep personal files (sometimes Windows completely ignores this and deletes them anyway), and restore your Windows installation.  
          
        c. It's game over at this point - your OS is beyond recovery. Get a recovery drive and reinstall windows (e.g. a flash drive - the entire drive needs to be empty beforehand). If you would like to bypass getting a new Windows license, then you will either have to purchase one or look up a guide on installing Windows without the license key (do this before making the recovery drive - I forget the details on the order in which things have to be done).  
          
        d. If your drive for some reason won't allow you to reinstall windows because of passwords/encryption, that drive is essentially bricked (not even the Geek Squad will be able to help you - trust me, I know). Buy a new one and take the old one to a data recovery center if you want to retrieve the contents of the drive.  