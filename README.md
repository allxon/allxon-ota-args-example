# Allxon OTA Artifact with Command-line Arguments Example
This example helps you understand how you can process the command-line arguments being passed from the portal during OTA artifact deplyment. And also, you are able to learn how to use the allxon-cli to testify your own generated artifacts with passing arguments.

# Design Logic Explaination
The arguments being passed down are Name and Value paired, so that they could be parsed easier in the script.

<img width="500" alt="image" src="https://github.com/user-attachments/assets/e7079449-cf15-4810-811b-b8cc60981953">

# _ota_deploy.sh_ Example Code Explanation 
In this example, the script only recognizes and parses an argument named "arg1", and will generate a file contains the paired _**Value**_ being put in the blank.

<img width="600" alt="image" src="https://github.com/user-attachments/assets/139e57c9-7aaf-4969-a88e-3dc85328d81c">

# Generate and Verify OTA Artifact Using Allxon CLI 
Since you are supposed to verify the OTA activity before doing mass deployment, the artifact generation and related testifying operations shown in below need to be done on your at least one **edge device** firstly. 

1. Make sure you have put everything (docker image, firmware, BSP image, application file, software, script, image, video, etc.) you are going to deploy onto your devices into the a directory. 
2. Edit `ota_deploy.sh` to suit your needs. (e.g. calling an executable file to execute an action or run an application update).
3. Run `$allxon-cli ota make –d {path of the folder contains ota_deploy.sh}` to generate an OTA artifact. 
4. **Run `$sudo allxon-cli ota test -f {file name of the artifact} --args arg1 "Hello World"`** to test the Allxon OTA artifact you just generated. This action will simulate OTA deployment by asking the Allxon Agent to execute `ota_deploy.sh`, so please do mind that all the commands in the script are going to be executed on the edge. 
5. Verify if the deployment operation is executed as expected as specified in `ota_deploy.sh`. And in this example, it should generate an _allxonOTA.args_ file with_ Hello World_ string inside, on the device's Desktop.

> [!NOTE]
> The OTA artifact is architecture-sensitive for execution, and by default, the artiface owns the same architecture of the platform who generates it. (e.g. `x86_64` or `aarch64`).
> But in the meanwhile, Allxon CLI also offer cross-platform artifact creation, such as generating aarch64 artifacts on an x86 platform for development purposes.
> More details are available in [here](https://github.com/allxon/allxon-cli/blob/master/ota.md).
   
   
# What is Next
Once you have generated your Allxon Artifact, head over to [Allxon Portal](https://dms.allxon.com/) to start performing OTA updates from the cloud portal to fleets of edge devices! 

Follow the instrustions to [deploy Allxon OTA artifact](https://www.allxon.com/knowledge/deploy-ota-artifact).
