# MTA-UNLUAC

MTA:SA decryption and decomplitation tools in one place

> [!WARNING]
> Only .luac files with light obfuscation can be decompiled; starting from **2 - More**, there may be issues.<br>

## Tools and usage

### Python scripts that execute the following commands **on all files in the directory**
#### **Usage:**<br>
1\. Place the resources in the "**in**" folder (create it)<br>
2\. Run **tools.bat** (_or run python scripts directly_)<br>
3\. Enjoy! All output files will appear in the "**out**" folder
______________________
### Script for decrypting .luac based on QuickBMS — allows you to remove primary protection for further decompilation<br>
_Source:_ https://zenhax.com/viewtopic.php@t=4777&start=20.html<br>
#### **Usage:**<br>
1\. Go to **tools** folder<br>
2\. Execute command **"quickbms luac_mtasa.bms <input_file>.luac <output_folder>"**<br>
> [!WARNING]
> Input file must be in the same directory as quickbms
______________________
### **unluac** Java decompiler — allows you to decompile a .luac file<br>
_Source:_ https://github.com/HansWessels/unluac
#### **Usage:**<br>
1\. Install [Java SDK](https://www.oracle.com/cis/java/technologies/downloads/) if its not installed<br>
2\. Add **java.exe** to system PATH if its not (_Default: C:\Program Files\Java\jdk-\*\*\bin\java.exe_)<br>
3\. Go to **tools** folder<br>
4\. Execute command **"java -jar unluac.jar <input_file>.luac > <input_file>.lua"**

## Example
For example, let's consider the large Russian-speaking project [Proxima-RP.ru](http://proxima-rp.ru/)<br>
_(The resource dump for 02.12.2024 is located in the folder **example/proxima-rp.ru**)_

1\. Obtain the resource dump in a way that is convenient for you _(check DHN Community)_<br>
2\. Move all resources to the "**in**" folder.<br>
3\. Decrypt and decompile the resources using **tools.bat**.<br>
4\. In the resources, Cyrillic characters are displayed as bytes; fix this using **tools.bat** as well.<br>

So, we can only see the relative source code; for example, we **cannot see some variables**.<br>
However, we can easily view the **names of server triggers**, which is sufficient.

> [!WARNING]
> On most servers, including this one, using **setElementData** automatically results in a **Serial Ban**. Keep this in mind _(and check DHN Community if you encounter this)_.