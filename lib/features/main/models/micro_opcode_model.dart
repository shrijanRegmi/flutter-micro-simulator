import 'package:micro_simulator/features/main/enums/micro_opcode_category_type.dart';
import 'package:micro_simulator/utils/micro_opcode_name.dart';

class MicroOpcode {
  final String name;
  final String machineCode;
  final MicroOpcodeCategory category;
  final int bytes;

  const MicroOpcode({
    required this.name,
    required this.machineCode,
    required this.category,
    required this.bytes,
  });

  const MicroOpcode.unknown()
      : name = MicroOpcodeName.unknown,
        machineCode = 'NA',
        category = MicroOpcodeCategory.unknown,
        bytes = -1;
}

final kMicroOpcodes = [
  const MicroOpcode(
    name: MicroOpcodeName.mviA,
    machineCode: "3E",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.mviB,
    machineCode: "06",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.mviC,
    machineCode: "0E",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.mviD,
    machineCode: "16",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.mviE,
    machineCode: "1E",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.mviH,
    machineCode: "26",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.mviL,
    machineCode: "2E",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.mviM,
    machineCode: "36",
    category: MicroOpcodeCategory.mvi,
    bytes: 2,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.lxiB,
    machineCode: "01",
    category: MicroOpcodeCategory.lxi,
    bytes: 3,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.lxiD,
    machineCode: "11",
    category: MicroOpcodeCategory.lxi,
    bytes: 3,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.lxiH,
    machineCode: "21",
    category: MicroOpcodeCategory.lxi,
    bytes: 3,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.lxiSP,
    machineCode: "31",
    category: MicroOpcodeCategory.lxi,
    bytes: 3,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.inrA,
    machineCode: "3C",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inrB,
    machineCode: "04",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inrC,
    machineCode: "0C",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inrD,
    machineCode: "14",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inrE,
    machineCode: "1C",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inrH,
    machineCode: "24",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inrL,
    machineCode: "2C",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inrM,
    machineCode: "34",
    category: MicroOpcodeCategory.inr,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.inxB,
    machineCode: "03",
    category: MicroOpcodeCategory.inx,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inxD,
    machineCode: "13",
    category: MicroOpcodeCategory.inx,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inxH,
    machineCode: "23",
    category: MicroOpcodeCategory.inx,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.inxSP,
    machineCode: "33",
    category: MicroOpcodeCategory.inx,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.dcrA,
    machineCode: "3D",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcrB,
    machineCode: "05",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcrC,
    machineCode: "0D",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcrD,
    machineCode: "15",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcrE,
    machineCode: "1D",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcrH,
    machineCode: "25",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcrL,
    machineCode: "2D",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcrM,
    machineCode: "35",
    category: MicroOpcodeCategory.dcr,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.dcxB,
    machineCode: "0B",
    category: MicroOpcodeCategory.dcx,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcxD,
    machineCode: "1B",
    category: MicroOpcodeCategory.dcx,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcxH,
    machineCode: "2B",
    category: MicroOpcodeCategory.dcx,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.dcxSP,
    machineCode: "3B",
    category: MicroOpcodeCategory.dcx,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.rst5,
    machineCode: "EF",
    category: MicroOpcodeCategory.rst5,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: "ADD A",
    machineCode: "87",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD B",
    machineCode: "80",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD C",
    machineCode: "81",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD D",
    machineCode: "82",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD E",
    machineCode: "83",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD H",
    machineCode: "84",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD L",
    machineCode: "85",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD M",
    machineCode: "86",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: "ADI",
    machineCode: "C6",
    category: MicroOpcodeCategory.adi,
    bytes: 2,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV A, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, M",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV B, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, M",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV C, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, M",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV D, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, M",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV E, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, M",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV H, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, M",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV L, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, M",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV M, A",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, B",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, C",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, D",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, E",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, H",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, L",
    machineCode: "33",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
];
