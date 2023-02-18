# Micro Simulator

An 8085 microprocessor simulator app made using flutter. [Supports Android, iOS, Web, Windows, Mac and Linux] <br/> 

## Get the app
  
  <a href="https://drive.google.com/drive/folders/1054TIA7b2Mk6mnE3HjXR1fKOnmZA1KDI?usp=share_link" target="_blank">
    <img src="https://user-images.githubusercontent.com/47274622/218366912-d085f0d1-7a08-4700-9d90-8ebfb3cec8c4.png" width="50" />
  </a>
  &nbsp
  <a href="https://microsimulator.web.app/" target="_blank">
    <img src="https://user-images.githubusercontent.com/47274622/218367741-48a1c5a7-385a-4d5c-8ecf-e82bbcd96be0.png" width="50" />
  </a>

![micro_simulator](https://user-images.githubusercontent.com/47274622/218361620-4fa66d17-a2b8-4b09-83c0-42a297b6b82d.png)

<br/>

## Getting Started

> Dev branch: develop <br/>
> Prod branch: main

<br/>

> Run dev environment: flutter run --flavor dev --target lib/main_dev.dart <br/>
> Run prod environment: flutter run --flavor prod --target lib/main_prod.dart

<br/>

## Execute 8085 Instructions

Example: <br/><br/>
MVI A, 05H <br/>
MVI B, 76H <br/>
ADD B <br/>
STA 9000H <br/>
RST5 <br/>


Initiate the following steps to execute the above example:

- **Feed Opcode**

  - Press RESET
  - Press EXAM MEM
  - Enter 8000 and press NEXT
  - Enter ppcode for MVI A (3E) and press NEXT
  - Enter 05 and press NEXT
  - Enter opcode for MVI B (06) and press NEXT
  - Enter 76 and press NEXT
  - Enter opcode for ADD B (80) and press NEXT
  - Enter opcode for STA (32) and press NEXT
  - Enter 00 and press NEXT
  - Enter 90 and press NEXT
  - Enter opcode for RST5 (EF) and press NEXT
  - Press RESET
  
- **Execute Opcode**
 
  - Press RESET
  - Press GO
  - Enter 8000
  - Press EXEC
  - Press EXAM REG
  - Observe values of A and B
  - Press EXAM MEM
  - Observe value of address 9000
  - Press RESET

<br/>

## Search Opcodes

The app is packed with a complete list of opcodes which supports search functionality.

![micro_simulator_search](https://user-images.githubusercontent.com/47274622/218365945-32e34e45-19d2-4f4f-824a-346dbf2e49c0.png)

