/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: encoder_slsp.c
 *
 * Code generated for Simulink model 'encoder_slsp'.
 *
 * Model version                  : 1.119
 * Simulink Coder version         : 8.9 (R2015b) 13-Aug-2015
 * C/C++ source code generated on : Fri Nov 27 10:57:13 2015
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "encoder_slsp.h"
#include "encoder_slsp_private.h"
#include "encoder_slsp_dt.h"

/* Block signals (auto storage) */
BlockIO_encoder_slsp encoder_slsp_B;

/* Block states (auto storage) */
D_Work_encoder_slsp encoder_slsp_DWork;

/* Real-time model */
RT_MODEL_encoder_slsp encoder_slsp_M_;
RT_MODEL_encoder_slsp *const encoder_slsp_M = &encoder_slsp_M_;

/* Model step function */
void encoder_slsp_step(void)
{
  /* S-Function (sfcn_encoder): '<Root>/Encoder' */
  sfcn_encoder_Outputs_wrapper( &encoder_slsp_B.Encoder,
    &encoder_slsp_DWork.Encoder_DSTATE, &encoder_slsp_P.Encoder_P1, 1,
    &encoder_slsp_P.Encoder_P2, 1, &encoder_slsp_P.Encoder_P3, 1);

  /* S-Function "sfcn_encoder_wrapper" Block: <Root>/Encoder */
  sfcn_encoder_Update_wrapper( &encoder_slsp_B.Encoder,
    &encoder_slsp_DWork.Encoder_DSTATE, &encoder_slsp_P.Encoder_P1, 1,
    &encoder_slsp_P.Encoder_P2, 1, &encoder_slsp_P.Encoder_P3, 1);

  /* External mode */
  rtExtModeUploadCheckTrigger(1);

  {                                    /* Sample time: [0.05s, 0.0s] */
    rtExtModeUpload(0, encoder_slsp_M->Timing.taskTime0);
  }

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.05s, 0.0s] */
    if ((rtmGetTFinal(encoder_slsp_M)!=-1) &&
        !((rtmGetTFinal(encoder_slsp_M)-encoder_slsp_M->Timing.taskTime0) >
          encoder_slsp_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(encoder_slsp_M, "Simulation finished");
    }

    if (rtmGetStopRequested(encoder_slsp_M)) {
      rtmSetErrorStatus(encoder_slsp_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   */
  encoder_slsp_M->Timing.taskTime0 =
    (++encoder_slsp_M->Timing.clockTick0) * encoder_slsp_M->Timing.stepSize0;
}

/* Model initialize function */
void encoder_slsp_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)encoder_slsp_M, 0,
                sizeof(RT_MODEL_encoder_slsp));
  rtmSetTFinal(encoder_slsp_M, -1);
  encoder_slsp_M->Timing.stepSize0 = 0.05;

  /* External mode info */
  encoder_slsp_M->Sizes.checksums[0] = (975739535U);
  encoder_slsp_M->Sizes.checksums[1] = (1839061031U);
  encoder_slsp_M->Sizes.checksums[2] = (2919979767U);
  encoder_slsp_M->Sizes.checksums[3] = (757130173U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    encoder_slsp_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(encoder_slsp_M->extModeInfo,
      &encoder_slsp_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(encoder_slsp_M->extModeInfo,
                        encoder_slsp_M->Sizes.checksums);
    rteiSetTPtr(encoder_slsp_M->extModeInfo, rtmGetTPtr(encoder_slsp_M));
  }

  /* block I/O */
  (void) memset(((void *) &encoder_slsp_B), 0,
                sizeof(BlockIO_encoder_slsp));

  /* states (dwork) */
  (void) memset((void *)&encoder_slsp_DWork, 0,
                sizeof(D_Work_encoder_slsp));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    encoder_slsp_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }

  /* S-Function Block: <Root>/Encoder */
  {
    real_T initVector[1] = { 0 };

    {
      int_T i1;
      for (i1=0; i1 < 1; i1++) {
        encoder_slsp_DWork.Encoder_DSTATE = initVector[0];
      }
    }
  }
}

/* Model terminate function */
void encoder_slsp_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
