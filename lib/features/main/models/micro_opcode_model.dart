class MicroOpcode {
  final String name;
  final String machineCode;
  final int bytes;

  const MicroOpcode({
    required this.name,
    required this.machineCode,
    required this.bytes,
  });

  const MicroOpcode.unknown()
      : name = 'Unknown',
        machineCode = 'NA',
        bytes = -1;
}

final kMicroOpcodes = [
  const MicroOpcode(
    name: "LXI B",
    machineCode: "01",
    bytes: 3,
  ),
  const MicroOpcode(
    name: "LXI D",
    machineCode: "11",
    bytes: 3,
  ),
  const MicroOpcode(
    name: "LXI H",
    machineCode: "21",
    bytes: 3,
  ),
  const MicroOpcode(
    name: "LXI SP",
    machineCode: "31",
    bytes: 3,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "MVI A",
    machineCode: "3E",
    bytes: 2,
  ),
  const MicroOpcode(
    name: "MVI B",
    machineCode: "06",
    bytes: 2,
  ),
  const MicroOpcode(
    name: "MVI C",
    machineCode: "0E",
    bytes: 2,
  ),
  const MicroOpcode(
    name: "MVI D",
    machineCode: "16",
    bytes: 2,
  ),
  const MicroOpcode(
    name: "MVI E",
    machineCode: "1E",
    bytes: 2,
  ),
  const MicroOpcode(
    name: "MVI H",
    machineCode: "26",
    bytes: 2,
  ),
  const MicroOpcode(
    name: "MVI L",
    machineCode: "2E",
    bytes: 2,
  ),
  const MicroOpcode(
    name: "MVI M",
    machineCode: "36",
    bytes: 2,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "INR A",
    machineCode: "3C",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INR B",
    machineCode: "04",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INR C",
    machineCode: "0C",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INR D",
    machineCode: "14",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INR E",
    machineCode: "1C",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INR H",
    machineCode: "24",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INR L",
    machineCode: "2C",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INR M",
    machineCode: "34",
    bytes: 1,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "INX B",
    machineCode: "03",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INX D",
    machineCode: "13",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INX H",
    machineCode: "23",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "INX SP",
    machineCode: "33",
    bytes: 1,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "DCR A",
    machineCode: "3D",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCR B",
    machineCode: "05",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCR C",
    machineCode: "0D",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCR D",
    machineCode: "15",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCR E",
    machineCode: "1D",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCR H",
    machineCode: "25",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCR L",
    machineCode: "2D",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCR M",
    machineCode: "35",
    bytes: 1,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "DCX B",
    machineCode: "0B",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCX D",
    machineCode: "1B",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCX H",
    machineCode: "2B",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "DCX SP",
    machineCode: "3B",
    bytes: 1,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "RST 5",
    machineCode: "EF",
    bytes: 1,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "ADD A",
    machineCode: "87",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD B",
    machineCode: "80",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD C",
    machineCode: "81",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD D",
    machineCode: "82",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD E",
    machineCode: "83",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD H",
    machineCode: "84",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD L",
    machineCode: "85",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "ADD M",
    machineCode: "86",
    bytes: 1,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "ADI",
    machineCode: "C6",
    bytes: 2,
  ),

/////////////////////////////////////////////

  const MicroOpcode(
    name: "MOV A, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, L",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV A, M",
    machineCode: "33",
    bytes: 1,
  ),

///////////////

  const MicroOpcode(
    name: "MOV B, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, L",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV B, M",
    machineCode: "33",
    bytes: 1,
  ),

///////////////

  const MicroOpcode(
    name: "MOV C, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, L",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV C, M",
    machineCode: "33",
    bytes: 1,
  ),

///////////////

  const MicroOpcode(
    name: "MOV D, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, L",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV D, M",
    machineCode: "33",
    bytes: 1,
  ),

///////////////

  const MicroOpcode(
    name: "MOV E, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, L",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV E, M",
    machineCode: "33",
    bytes: 1,
  ),

///////////////

  const MicroOpcode(
    name: "MOV H, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, L",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV H, M",
    machineCode: "33",
    bytes: 1,
  ),

///////////////

  const MicroOpcode(
    name: "MOV L, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, L",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV L, M",
    machineCode: "33",
    bytes: 1,
  ),

///////////////

  const MicroOpcode(
    name: "MOV M, A",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, B",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, C",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, D",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, E",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, H",
    machineCode: "33",
    bytes: 1,
  ),
  const MicroOpcode(
    name: "MOV M, L",
    machineCode: "33",
    bytes: 1,
  ),
];
