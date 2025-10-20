#ifndef EECE571Asn1_Qn1_acc_h_
#define EECE571Asn1_Qn1_acc_h_
#ifndef EECE571Asn1_Qn1_acc_COMMON_INCLUDES_
#define EECE571Asn1_Qn1_acc_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME simulink_only_sfcn
#define S_FUNCTION_LEVEL 2
#ifndef RTW_GENERATED_S_FUNCTION
#define RTW_GENERATED_S_FUNCTION
#endif
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "rt_nonfinite.h"
#include "math.h"
#endif
#include "EECE571Asn1_Qn1_acc_types.h"
#include "rt_defines.h"
#include <stddef.h>
typedef struct { real_T B_3_132_1016 ; real_T B_3_133_1024 ; }
B_Subsystempi2delay_EECE571Asn1_Qn1_T ; typedef struct { int32_T
Subsystempi2delay_sysIdxToRun ; int8_T Subsystempi2delay_SubsysRanBC ;
boolean_T Subsystempi2delay_MODE ; char_T pad_Subsystempi2delay_MODE [ 2 ] ;
} DW_Subsystempi2delay_EECE571Asn1_Qn1_T ; typedef struct { real_T
B_4_130_1000 ; real_T B_4_131_1008 ; } B_Subsystem1_EECE571Asn1_Qn1_T ;
typedef struct { int32_T Subsystem1_sysIdxToRun ; int8_T
Subsystem1_SubsysRanBC ; boolean_T Subsystem1_MODE ; char_T
pad_Subsystem1_MODE [ 2 ] ; } DW_Subsystem1_EECE571Asn1_Qn1_T ; typedef
struct { real_T B_9_0_0 ; real_T B_9_1_8 ; real_T B_9_2_16 ; real_T B_9_3_24
[ 6 ] ; real_T B_9_9_72 [ 12 ] ; real_T B_9_21_168 ; real_T B_9_22_176 ;
real_T B_9_23_184 ; real_T B_9_24_192 [ 3 ] ; real_T B_9_27_216 [ 3 ] ;
real_T B_9_30_240 [ 3 ] ; real_T B_9_33_264 ; real_T B_9_34_272 ; real_T
B_9_35_280 [ 2 ] ; real_T B_9_37_296 ; real_T B_9_38_304 ; real_T B_9_39_312
; real_T B_9_40_320 ; real_T B_9_41_328 [ 3 ] ; real_T B_9_44_352 [ 3 ] ;
real_T B_9_47_376 [ 3 ] ; real_T B_9_50_400 [ 2 ] ; real_T B_9_52_416 ;
real_T B_9_53_424 [ 2 ] ; real_T B_9_55_440 [ 2 ] ; real_T B_9_57_456 [ 2 ] ;
real_T B_9_59_472 [ 2 ] ; real_T B_9_61_488 [ 2 ] ; real_T B_9_63_504 [ 2 ] ;
real_T B_9_65_520 ; real_T B_9_66_528 ; real_T B_9_67_536 ; real_T B_9_68_544
; real_T B_9_69_552 ; real_T B_9_70_560 ; real_T B_9_71_568 [ 3 ] ; real_T
B_9_74_592 ; real_T B_9_75_600 ; real_T B_9_76_608 ; real_T B_9_77_616 ;
real_T B_9_78_624 ; real_T B_9_79_632 ; real_T B_9_80_640 ; real_T B_9_81_648
; real_T B_9_82_656 ; real_T B_9_83_664 ; real_T B_9_84_672 ; real_T
B_9_85_680 ; real_T B_9_86_688 ; real_T B_9_87_696 ; real_T B_9_88_704 ;
real_T B_9_89_712 ; real_T B_9_90_720 ; real_T B_9_91_728 [ 2 ] ; real_T
B_9_93_744 [ 2 ] ; real_T B_9_95_760 [ 2 ] ; real_T B_9_97_776 [ 2 ] ; real_T
B_9_99_792 [ 2 ] ; real_T B_9_101_808 [ 2 ] ; real_T B_9_103_824 ; real_T
B_9_104_832 ; real_T B_9_105_840 ; real_T B_9_106_848 ; real_T B_9_107_856 ;
real_T B_9_108_864 ; real_T B_9_109_872 ; real_T B_9_110_880 ; real_T
B_9_111_888 ; real_T B_9_112_896 ; real_T B_9_113_904 ; real_T B_9_114_912 ;
real_T B_9_115_920 ; real_T B_8_116_928 ; real_T B_8_117_936 ; real_T
B_7_118_944 ; real_T B_7_119_952 ; uint8_T B_9_120_960 ; uint8_T B_9_121_961
; uint8_T B_9_122_962 ; uint8_T B_9_123_963 ; uint8_T B_9_124_964 ; uint8_T
B_9_125_965 ; char_T pad_B_9_125_965 [ 2 ] ; B_Subsystem1_EECE571Asn1_Qn1_T
Subsystem1_p ; B_Subsystempi2delay_EECE571Asn1_Qn1_T Subsystempi2delay_e ;
B_Subsystem1_EECE571Asn1_Qn1_T Subsystem1 ;
B_Subsystempi2delay_EECE571Asn1_Qn1_T Subsystempi2delay ; }
B_EECE571Asn1_Qn1_T ; typedef struct { real_T UnitDelay_DSTATE ; real_T
StateSpace_RWORK [ 2 ] ; struct { real_T modelTStart ; } TransportDelay_RWORK
; struct { real_T modelTStart ; } TransportDelay_RWORK_e ; struct { real_T
modelTStart ; } TransportDelay_RWORK_c ; struct { real_T modelTStart ; }
TransportDelay_RWORK_j ; struct { real_T modelTStart ; }
TransportDelay_RWORK_jm ; struct { real_T modelTStart ; }
TransportDelay_RWORK_a ; void * StateSpace_PWORK [ 22 ] ; void *
I_dandI_dref_PWORK [ 2 ] ; void * I_dqo_PWORK ; void * I_qandI_qref1_PWORK [
2 ] ; void * I_sabc_PWORK ; struct { void * TUbufferPtrs [ 4 ] ; }
TransportDelay_PWORK ; struct { void * TUbufferPtrs [ 4 ] ; }
TransportDelay_PWORK_i ; struct { void * TUbufferPtrs [ 4 ] ; }
TransportDelay_PWORK_n ; struct { void * TUbufferPtrs [ 4 ] ; }
TransportDelay_PWORK_l ; struct { void * TUbufferPtrs [ 4 ] ; }
TransportDelay_PWORK_a ; struct { void * TUbufferPtrs [ 4 ] ; }
TransportDelay_PWORK_e ; void * PandQ_PWORK [ 2 ] ; void * V_sabc_PWORK ;
void * rho_PWORK ; int32_T Subsystem1_sysIdxToRun ; int32_T
Subsystempi2delay_sysIdxToRun ; int32_T
TmpAtomicSubsysAtMultiportSwitchInport4_sysIdxToRun ; int32_T
TmpAtomicSubsysAtMultiportSwitchInport3_sysIdxToRun ; int32_T
TmpAtomicSubsysAtMultiportSwitchInport2_sysIdxToRun ; uint32_T m_bpIndex ;
int_T StateSpace_IWORK [ 23 ] ; struct { int_T Tail [ 2 ] ; int_T Head [ 2 ]
; int_T Last [ 2 ] ; int_T CircularBufSize [ 2 ] ; int_T MaxNewBufSize ; }
TransportDelay_IWORK ; struct { int_T Tail [ 2 ] ; int_T Head [ 2 ] ; int_T
Last [ 2 ] ; int_T CircularBufSize [ 2 ] ; int_T MaxNewBufSize ; }
TransportDelay_IWORK_f ; struct { int_T Tail [ 2 ] ; int_T Head [ 2 ] ; int_T
Last [ 2 ] ; int_T CircularBufSize [ 2 ] ; int_T MaxNewBufSize ; }
TransportDelay_IWORK_fh ; struct { int_T Tail [ 2 ] ; int_T Head [ 2 ] ;
int_T Last [ 2 ] ; int_T CircularBufSize [ 2 ] ; int_T MaxNewBufSize ; }
TransportDelay_IWORK_j ; struct { int_T Tail [ 2 ] ; int_T Head [ 2 ] ; int_T
Last [ 2 ] ; int_T CircularBufSize [ 2 ] ; int_T MaxNewBufSize ; }
TransportDelay_IWORK_jn ; struct { int_T Tail [ 2 ] ; int_T Head [ 2 ] ;
int_T Last [ 2 ] ; int_T CircularBufSize [ 2 ] ; int_T MaxNewBufSize ; }
TransportDelay_IWORK_e ; char StateSpace_MODE [ 28 ] ; int8_T
Subsystem1_SubsysRanBC ; int8_T Subsystempi2delay_SubsysRanBC ; boolean_T
RelationalOperator_Mode ; boolean_T RelationalOperator1_Mode ; boolean_T
RelationalOperator2_Mode ; boolean_T Subsystem1_MODE ; boolean_T
Subsystempi2delay_MODE ; char_T pad_Subsystempi2delay_MODE [ 1 ] ;
DW_Subsystem1_EECE571Asn1_Qn1_T Subsystem1_p ;
DW_Subsystempi2delay_EECE571Asn1_Qn1_T Subsystempi2delay_e ;
DW_Subsystem1_EECE571Asn1_Qn1_T Subsystem1 ;
DW_Subsystempi2delay_EECE571Asn1_Qn1_T Subsystempi2delay ; }
DW_EECE571Asn1_Qn1_T ; typedef struct { real_T StateSpace_CSTATE [ 3 ] ;
real_T Integrator_CSTATE ; real_T Integrator_CSTATE_a [ 2 ] ; real_T
Integrator_CSTATE_aw [ 2 ] ; real_T Integrator_CSTATE_j [ 2 ] ; real_T
Integrator_CSTATE_g [ 2 ] ; real_T Integrator_CSTATE_o [ 2 ] ; real_T
Integrator_CSTATE_m [ 2 ] ; real_T Integrator_CSTATE_l ; real_T
Integrator_CSTATE_h ; real_T Integrator_CSTATE_f ; real_T
Integrator_CSTATE_fy ; } X_EECE571Asn1_Qn1_T ; typedef int_T
PeriodicIndX_EECE571Asn1_Qn1_T [ 1 ] ; typedef real_T
PeriodicRngX_EECE571Asn1_Qn1_T [ 2 ] ; typedef struct { real_T
StateSpace_CSTATE [ 3 ] ; real_T Integrator_CSTATE ; real_T
Integrator_CSTATE_a [ 2 ] ; real_T Integrator_CSTATE_aw [ 2 ] ; real_T
Integrator_CSTATE_j [ 2 ] ; real_T Integrator_CSTATE_g [ 2 ] ; real_T
Integrator_CSTATE_o [ 2 ] ; real_T Integrator_CSTATE_m [ 2 ] ; real_T
Integrator_CSTATE_l ; real_T Integrator_CSTATE_h ; real_T Integrator_CSTATE_f
; real_T Integrator_CSTATE_fy ; } XDot_EECE571Asn1_Qn1_T ; typedef struct {
boolean_T StateSpace_CSTATE [ 3 ] ; boolean_T Integrator_CSTATE ; boolean_T
Integrator_CSTATE_a [ 2 ] ; boolean_T Integrator_CSTATE_aw [ 2 ] ; boolean_T
Integrator_CSTATE_j [ 2 ] ; boolean_T Integrator_CSTATE_g [ 2 ] ; boolean_T
Integrator_CSTATE_o [ 2 ] ; boolean_T Integrator_CSTATE_m [ 2 ] ; boolean_T
Integrator_CSTATE_l ; boolean_T Integrator_CSTATE_h ; boolean_T
Integrator_CSTATE_f ; boolean_T Integrator_CSTATE_fy ; }
XDis_EECE571Asn1_Qn1_T ; typedef struct { real_T StateSpace_CSTATE [ 3 ] ;
real_T Integrator_CSTATE ; real_T Integrator_CSTATE_a [ 2 ] ; real_T
Integrator_CSTATE_aw [ 2 ] ; real_T Integrator_CSTATE_j [ 2 ] ; real_T
Integrator_CSTATE_g [ 2 ] ; real_T Integrator_CSTATE_o [ 2 ] ; real_T
Integrator_CSTATE_m [ 2 ] ; real_T Integrator_CSTATE_l ; real_T
Integrator_CSTATE_h ; real_T Integrator_CSTATE_f ; real_T
Integrator_CSTATE_fy ; } CStateAbsTol_EECE571Asn1_Qn1_T ; typedef struct {
real_T StateSpace_CSTATE [ 3 ] ; real_T Integrator_CSTATE ; real_T
Integrator_CSTATE_a [ 2 ] ; real_T Integrator_CSTATE_aw [ 2 ] ; real_T
Integrator_CSTATE_j [ 2 ] ; real_T Integrator_CSTATE_g [ 2 ] ; real_T
Integrator_CSTATE_o [ 2 ] ; real_T Integrator_CSTATE_m [ 2 ] ; real_T
Integrator_CSTATE_l ; real_T Integrator_CSTATE_h ; real_T Integrator_CSTATE_f
; real_T Integrator_CSTATE_fy ; } CXPtMin_EECE571Asn1_Qn1_T ; typedef struct
{ real_T StateSpace_CSTATE [ 3 ] ; real_T Integrator_CSTATE ; real_T
Integrator_CSTATE_a [ 2 ] ; real_T Integrator_CSTATE_aw [ 2 ] ; real_T
Integrator_CSTATE_j [ 2 ] ; real_T Integrator_CSTATE_g [ 2 ] ; real_T
Integrator_CSTATE_o [ 2 ] ; real_T Integrator_CSTATE_m [ 2 ] ; real_T
Integrator_CSTATE_l ; real_T Integrator_CSTATE_h ; real_T Integrator_CSTATE_f
; real_T Integrator_CSTATE_fy ; } CXPtMax_EECE571Asn1_Qn1_T ; typedef struct
{ real_T StateSpace_Sf0_ZC [ 7 ] ; real_T RelationalOperator_RelopInput_ZC ;
real_T RelationalOperator1_RelopInput_ZC ; real_T
RelationalOperator2_RelopInput_ZC ; } ZCV_EECE571Asn1_Qn1_T ; typedef struct
{ ZCSigState StateSpace_Sf0_ZCE [ 7 ] ; ZCSigState
RelationalOperator_RelopInput_ZCE ; ZCSigState
RelationalOperator1_RelopInput_ZCE ; ZCSigState
RelationalOperator2_RelopInput_ZCE ; } PrevZCX_EECE571Asn1_Qn1_T ; struct
P_Subsystempi2delay_EECE571Asn1_Qn1_T_ { real_T P_0 [ 2 ] ; } ; struct
P_Subsystem1_EECE571Asn1_Qn1_T_ { real_T P_0 [ 2 ] ; } ; struct
P_EECE571Asn1_Qn1_T_ { real_T P_0 ; real_T P_1 ; real_T P_2 ; real_T P_3 ;
real_T P_4 ; real_T P_5 ; real_T P_6 ; real_T P_7 ; real_T P_8 ; real_T P_9 [
2 ] ; real_T P_10 [ 2 ] ; real_T P_11 ; real_T P_12 ; real_T P_13 ; real_T
P_14 ; real_T P_15 ; real_T P_16 ; real_T P_17 ; real_T P_18 ; real_T P_19 ;
real_T P_20 ; real_T P_21 ; real_T P_22 ; real_T P_23 [ 2 ] ; real_T P_24 [
465 ] ; real_T P_25 [ 2 ] ; real_T P_26 [ 4 ] ; real_T P_27 [ 2 ] ; real_T
P_28 [ 3 ] ; real_T P_29 [ 2 ] ; real_T P_30 [ 1302 ] ; real_T P_31 [ 2 ] ;
real_T P_32 [ 12 ] ; real_T P_33 [ 2 ] ; real_T P_34 [ 6 ] ; real_T P_35 [ 2
] ; real_T P_36 [ 6 ] ; real_T P_37 [ 2 ] ; real_T P_38 [ 6 ] ; real_T P_39 [
2 ] ; real_T P_40 ; real_T P_41 [ 2 ] ; real_T P_42 ; real_T P_43 ; real_T
P_44 ; real_T P_45 ; real_T P_46 ; real_T P_47 [ 9 ] ; real_T P_48 ; real_T
P_49 ; real_T P_50 ; real_T P_51 ; real_T P_52 ; real_T P_53 ; real_T P_54 ;
real_T P_55 ; real_T P_56 ; real_T P_57 [ 9 ] ; real_T P_58 ; real_T P_59 ;
real_T P_60 ; real_T P_61 ; real_T P_62 ; real_T P_63 ; real_T P_64 ; real_T
P_65 ; real_T P_66 ; real_T P_67 ; real_T P_68 ; real_T P_69 ; real_T P_70 ;
real_T P_71 ; real_T P_72 ; real_T P_73 ; real_T P_74 ; real_T P_75 ; real_T
P_76 ; real_T P_77 ; real_T P_78 ; real_T P_79 ; real_T P_80 ; real_T P_81 ;
real_T P_82 ; real_T P_83 ; real_T P_84 ; real_T P_85 ; real_T P_86 ; real_T
P_87 [ 9 ] ; real_T P_88 ; real_T P_89 ; real_T P_90 ; real_T P_91 [ 3 ] ;
real_T P_92 [ 3 ] ; real_T P_93 ; real_T P_94 ; real_T P_95 ; real_T P_96 ;
real_T P_97 ; real_T P_98 ; real_T P_99 ; real_T P_100 ; real_T P_101 ;
real_T P_102 ; real_T P_103 ; real_T P_104 ; real_T P_105 ; real_T P_106 ;
real_T P_107 ; real_T P_108 ; real_T P_109 ; real_T P_110 ; real_T P_111 ;
real_T P_112 ; real_T P_113 ; real_T P_114 ; real_T P_115 ; real_T P_116 ;
real_T P_117 ; real_T P_118 ; real_T P_119 ; real_T P_120 ; creal_T P_121 ;
creal_T P_122 ; creal_T P_123 ; creal_T P_124 ; creal_T P_125 ; creal_T P_126
; creal_T P_127 ; creal_T P_128 ; P_Subsystem1_EECE571Asn1_Qn1_T Subsystem1_p
; P_Subsystempi2delay_EECE571Asn1_Qn1_T Subsystempi2delay_e ;
P_Subsystem1_EECE571Asn1_Qn1_T Subsystem1 ;
P_Subsystempi2delay_EECE571Asn1_Qn1_T Subsystempi2delay ; } ; extern
P_EECE571Asn1_Qn1_T EECE571Asn1_Qn1_rtDefaultP ;
#endif
