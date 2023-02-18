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
    category: MicroOpcodeCategory.rst,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.addA,
    machineCode: "87",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.addB,
    machineCode: "80",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.addC,
    machineCode: "81",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.addD,
    machineCode: "82",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.addE,
    machineCode: "83",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.addH,
    machineCode: "84",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.addL,
    machineCode: "85",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.addM,
    machineCode: "86",
    category: MicroOpcodeCategory.add,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.adi,
    machineCode: "C6",
    category: MicroOpcodeCategory.adi,
    bytes: 2,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.subA,
    machineCode: "97",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.subB,
    machineCode: "90",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.subC,
    machineCode: "91",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.subD,
    machineCode: "92",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.subE,
    machineCode: "93",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.subH,
    machineCode: "94",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.subL,
    machineCode: "95",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),
  const MicroOpcode(
    name: MicroOpcodeName.subM,
    machineCode: "96",
    category: MicroOpcodeCategory.sub,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.sui,
    machineCode: "D6",
    category: MicroOpcodeCategory.sui,
    bytes: 2,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.lda,
    machineCode: "3A",
    category: MicroOpcodeCategory.lda,
    bytes: 3,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.ldaxB,
    machineCode: "0A",
    category: MicroOpcodeCategory.ldax,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.ldaxD,
    machineCode: "1A",
    category: MicroOpcodeCategory.ldax,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.sta,
    machineCode: "32",
    category: MicroOpcodeCategory.sta,
    bytes: 3,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.staxB,
    machineCode: "02",
    category: MicroOpcodeCategory.stax,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: MicroOpcodeName.staxD,
    machineCode: "12",
    category: MicroOpcodeCategory.stax,
    bytes: 1,
  ),

  //////////////////////////////////////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV A, A",
    machineCode: "7F",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, B",
    machineCode: "78",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, C",
    machineCode: "79",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, D",
    machineCode: "7A",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, E",
    machineCode: "7B",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, H",
    machineCode: "7C",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, L",
    machineCode: "7D",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, M",
    machineCode: "7E",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV B, A",
    machineCode: "47",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, B",
    machineCode: "40",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, C",
    machineCode: "41",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, D",
    machineCode: "42",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, E",
    machineCode: "43",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, H",
    machineCode: "44",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, L",
    machineCode: "45",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, M",
    machineCode: "46",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV C, A",
    machineCode: "4F",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, B",
    machineCode: "48",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, C",
    machineCode: "49",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, D",
    machineCode: "4A",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, E",
    machineCode: "4B",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, H",
    machineCode: "4C",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, L",
    machineCode: "4D",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, M",
    machineCode: "4E",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV D, A",
    machineCode: "57",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, B",
    machineCode: "50",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, C",
    machineCode: "51",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, D",
    machineCode: "52",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, E",
    machineCode: "53",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, H",
    machineCode: "54",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, L",
    machineCode: "55",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, M",
    machineCode: "56",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV E, A",
    machineCode: "5F",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, B",
    machineCode: "58",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, C",
    machineCode: "59",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, D",
    machineCode: "5A",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, E",
    machineCode: "5B",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, H",
    machineCode: "5C",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, L",
    machineCode: "5D",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, M",
    machineCode: "5E",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV H, A",
    machineCode: "67",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, B",
    machineCode: "60",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, C",
    machineCode: "61",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, D",
    machineCode: "62",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, E",
    machineCode: "63",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, H",
    machineCode: "64",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, L",
    machineCode: "65",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, M",
    machineCode: "66",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV L, A",
    machineCode: "6F",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, B",
    machineCode: "68",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, C",
    machineCode: "69",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, D",
    machineCode: "6A",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, E",
    machineCode: "6B",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, H",
    machineCode: "6C",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, L",
    machineCode: "6D",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, M",
    machineCode: "6E",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),

  /////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV M, A",
    machineCode: "77",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, B",
    machineCode: "70",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, C",
    machineCode: "71",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, D",
    machineCode: "72",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, E",
    machineCode: "73",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, H",
    machineCode: "74",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, L",
    machineCode: "75",
    category: MicroOpcodeCategory.mov,
    bytes: 1,
  ),
];
