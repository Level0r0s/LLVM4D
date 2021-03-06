unit LLVM.Imports.TargetMachine;

interface

//based on TargetMachine.h

uses
  LLVM.Imports,
  LLVM.Imports.Target,
  LLVM.Imports.Types;

type
  TLLVMTargetMachineRef = type TLLVMRef;

  TLLVMTargetRef = type TLLVMRef;

{$MINENUMSIZE 4}
  TLLVMCodeGenOptLevel = (
    LLVMCodeGenLevelNone,
    LLVMCodeGenLevelLess,
    LLVMCodeGenLevelDefault,
      LLVMCodeGenLevelAggressive
  );

  TLLVMRelocMode = (
    LLVMRelocDefault,
    LLVMRelocStatic,
    LLVMRelocPIC,
    LLVMRelocDynamicNoPic
  );

  TLLVMCodeModel = (
    LLVMCodeModelDefault,
    LLVMCodeModelJITDefault,
    LLVMCodeModelSmall,
    LLVMCodeModelKernel,
    LLVMCodeModelMedium,
    LLVMCodeModelLarge
  );

  TLLVMCodeGenFileType = (
    LLVMAssemblyFile,
    LLVMObjectFile
  );

function LLVMGetFirstTarget: TLLVMTargetRef; cdecl; external CLLVMLibrary;
function LLVMGetNextTarget(T: TLLVMTargetRef): TLLVMTargetRef; cdecl; external CLLVMLibrary;

function LLVMGetTargetFromName(const Name: PLLVMChar): TLLVMTargetRef; cdecl; external CLLVMLibrary;

function LLVMGetTargetFromTriple(const Triple: PLLVMChar; out T: TLLVMTargetRef; out ErrorMessage: PLLVMChar): LongBool; cdecl; external CLLVMLibrary;

function LLVMGetTargetName(T: TLLVMTargetRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetTargetDescription(T: TLLVMTargetRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMTargetHasJIT(T: TLLVMTargetRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMTargetHasTargetMachine(T: TLLVMTargetRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMTargetHasAsmBackend(T: TLLVMTargetRef): LongBool; cdecl; external CLLVMLibrary;

function LLVMCreateTargetMachine(T: TLLVMTargetRef; const Triple: PLLVMChar; const CPU: PLLVMChar; const Features: PLLVMChar; Level: TLLVMCodeGenOptLevel; Reloc: TLLVMRelocMode; CodeModel: TLLVMCodeModel): TLLVMTargetMachineRef; cdecl; external CLLVMLibrary;

procedure LLVMDisposeTargetMachine(T: TLLVMTargetMachineRef); cdecl; external CLLVMLibrary;

function LLVMGetTargetMachineTarget(T: TLLVMTargetMachineRef): TLLVMTargetRef; cdecl; external CLLVMLibrary;

function LLVMGetTargetMachineTriple(T: TLLVMTargetMachineRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetTargetMachineCPU(T: TLLVMTargetMachineRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMGetTargetMachineFeatureString(T: TLLVMTargetMachineRef): PLLVMChar; cdecl; external CLLVMLibrary;

function LLVMCreateTargetDataLayout(T: TLLVMTargetMachineRef): TLLVMTargetDataRef; cdecl; external CLLVMLibrary;

procedure LLVMSetTargetMachineAsmVerbosity(T: TLLVMTargetMachineRef; VerboseAsm: LongBool); cdecl; external CLLVMLibrary;

function LLVMTargetMachineEmitToFile(T: TLLVMTargetMachineRef; M: TLLVMModuleRef; Filename: PLLVMChar; codegen: TLLVMCodeGenFileType; out ErrorMessage: PLLVMChar): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMTargetMachineEmitToMemoryBuffer(T: TLLVMTargetMachineRef; M: TLLVMModuleRef; codegen: TLLVMCodeGenFileType; out ErrorMessage: PLLVMChar; out OutMemBuf: TLLVMMemoryBufferRef): TLLVMBool; cdecl; external CLLVMLibrary;

function LLVMGetDefaultTargetTriple: PLLVMChar; cdecl; external CLLVMLibrary;

procedure LLVMAddAnalysisPasses(T: TLLVMTargetMachineRef; PM: TLLVMPassManagerRef); cdecl; external CLLVMLibrary;

implementation

end.
