# Micro Simulator

An 8085 microprocessor simulator app made using flutter.

![micro_simulator](https://user-images.githubusercontent.com/47274622/218361620-4fa66d17-a2b8-4b09-83c0-42a297b6b82d.png)

<br/>

## Getting Started

> Dev environment: flutter run --flavor dev --target lib/main_dev.dart <br/>
> Prod environment: flutter run --flavor prod --target lib/main_prod.dart

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
