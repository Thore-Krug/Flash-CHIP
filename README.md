# Flash-CHIP
Ready to use Flash environment for the C.H.I.P Single Board Computer

Simplyfies the Flashing Process for the C.H.I.P and PocketC.H.I.P Computer. 

## Instructions
1. Remove the C.H.I.P from its case (in case you have a Pocket C.H.I.P).
2. Connect the FEL and a GROUND pin of the C.H.I.P (for example, with a paperclip).
3. Connect the C.H.I.P its micro USB port to a USB port of your Linux machine.
4. In the Linux machine:
    - run ` git clone https://github.com/thore-krug/Flash-CHIP.git` to clone this repository.
    - `cd` into the location where you stored this repository.
    - run `sudo chmod +x Flash.sh`
    - run `./Flash.sh`
    - Select the version you want to install.
    - Wait until the installation finishes.
    - Enjoy!
  
## Troubleshooting 
### General Issues
1. Kill the Script with ctrl + C 
2. Read the output if something is not installed or Permissions are missing 
3. Just restart the Script (fixes most of the Problem with FEL and Fastboot ) 
4. If this does not help reboot, retry
5. Open an Issue on this Git Repo. 

### The script times out waiting for fel
This error is related to an insufficient amount of power provided by your USB port to the C.H.I.P.  
If you have an external `5V` power supply, you can connect it to the `CHG-IN` pin of your C.H.I.P. to provide sufficient power.    
Alternatively try a different (shorter, or higher quality) USB cable and check if your host PC has USB power saving enabled.  

If this dos not work Install sunxi-tool v1.4.1:
```bash
git clone --branch v1.4.1  https://github.com/linux-sunxi/sunxi-tools.git
cd sunxi-tool/
make install-all install-misc
cd ../
./Flash.sh
```
## Support my work by Donating 

https://www.paypal.me/a13tech
