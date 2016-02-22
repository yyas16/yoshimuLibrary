/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: test.c
 *
 * Code generated for Simulink model 'test'.
 *
 * Model version                  : 1.50
 * Simulink Coder version         : 8.9 (R2015b) 13-Aug-2015
 * C/C++ source code generated on : Fri Nov 27 13:57:51 2015
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "test.h"
#include "test_private.h"
#include "test_dt.h"

/* Block signals (auto storage) */
B_test_T test_B;

/* Block states (auto storage) */
DW_test_T test_DW;

/* Real-time model */
RT_MODEL_test_T test_M_;
RT_MODEL_test_T *const test_M = &test_M_;

/* Model step function */
void test_step(void)
{
  /* S-Function (sfEncoder): '<Root>/S-Function Builder1' */
  sfEncoder_Outputs_wrapper( &test_B.SFunctionBuilder1,
    &test_DW.SFunctionBuilder1_DSTATE, &test_P.SFunctionBuilder1_P1, 1,
    &test_P.SFunctionBuilder1_P2, 1);

  /* MATLAB Function: '<Root>/MATLAB Function' */
  /* MATLAB Function 'MATLAB Function': '<S1>:1' */
  /*  sampling rate */
  /*  gear ratio‚â‚S’ü”{ */
  /* '<S1>:1:8' */
  /* '<S1>:1:9' */
  test_B.y = ((real_T)test_B.SFunctionBuilder1 - (real_T)test_DW.oldPosition) *
    360.0 / 200.0 / 0.05;

  /*  y  = u; */
  /* '<S1>:1:11' */
  test_DW.oldPosition = test_B.SFunctionBuilder1;

  /* S-Function "sfEncoder_wrapper" Block: <Root>/S-Function Builder1 */
  sfEncoder_Update_wrapper( &test_B.SFunctionBuilder1,
    &test_DW.SFunctionBuilder1_DSTATE, &test_P.SFunctionBuilder1_P1, 1,
    &test_P.SFunctionBuilder1_P2, 1);

  /* External mode */
  rtExtModeUploadCheckTrigger(1);

  {                                    /* Sample time: [0.05s, 0.0s] */
    rtExtModeUpload(0, test_M->Timing.taskTime0);
  }

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.05s, 0.0s] */
    if ((rtmGetTFinal(test_M)!=-1) &&
        !((rtmGetTFinal(test_M)-test_M->Timing.taskTime0) >
          test_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(test_M, "Simulation finished");
    }

    if (rtmGetStopRequested(test_M)) {
      rtmSetErrorStatus(test_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++test_M->Timing.clockTick0)) {
    ++test_M->Timing.clockTickH0;
  }

  test_M->Timing.taskTime0 = test_M->Timing.clockTick0 *
    test_M->Timing.stepSize0 + test_M->Timing.clockTickH0 *
    test_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void test_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)test_M, 0,
                sizeof(RT_MODEL_test_T));
  rtmSetTFinal(test_M, -1);
  test_M->Timing.stepSize0 = 0.05;

  /* External mode info */
  test_M->Sizes.checksums[0] = (1634986446U);
  test_M->Sizes.checksums[1] = (3823087479U);
  test_M->Sizes.checksums[2] = (1275275361U);
  test_M->Sizes.checksums[3] = (548618283U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[2];
    test_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(test_M->extModeInfo,
      &test_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(test_M->extModeInfo, test_M->Sizes.checksums);
    rteiSetTPtr(test_M->extModeInfo, rtmGetTPtr(test_M));
  }

  /* block I/O */
  (void) memset(((void *) &test_B), 0,
                sizeof(B_test_T));

  /* states (dwork) */
  (void) memset((void *)&test_DW, 0,
                sizeof(DW_test_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    test_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }

  /* Start for DataStoreMemory: '<Root>/Data Store Memory' */
  test_DW.oldPosition = test_P.DataStoreMemory_InitialValue;

  /* S-Function Block: <Root>/S-Function Builder1 */
  {
    real_T initVector[1] = { 0 };

    {
      int_T i1;
      for (i1=0; i1 < 1; i1++) {
        test_DW.SFunctionBuilder1_DSTATE = initVector[0];
      }
    }
  }
}

/* Model terminate function */
void test_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
