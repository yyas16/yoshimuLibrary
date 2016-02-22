/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: encoder_slsp.h
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

#ifndef RTW_HEADER_encoder_slsp_h_
#define RTW_HEADER_encoder_slsp_h_
#include <float.h>
#include <string.h>
#include <stddef.h>
#ifndef encoder_slsp_COMMON_INCLUDES_
# define encoder_slsp_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "dt_info.h"
#include "ext_work.h"
#endif                                 /* encoder_slsp_COMMON_INCLUDES_ */

#include "encoder_slsp_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "MW_target_hardware_resources.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWExtModeInfo
# define rtmGetRTWExtModeInfo(rtm)     ((rtm)->extModeInfo)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

/* Block signals (auto storage) */
typedef struct {
  int16_T Encoder;                     /* '<Root>/Encoder' */
} BlockIO_encoder_slsp;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  real_T Encoder_DSTATE;               /* '<Root>/Encoder' */
  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<Root>/Scope' */
} D_Work_encoder_slsp;

/* Parameters (auto storage) */
struct Parameters_encoder_slsp_ {
  uint8_T Encoder_P1;                  /* Expression: uint8(0)
                                        * Referenced by: '<Root>/Encoder'
                                        */
  uint8_T Encoder_P2;                  /* Expression: uint8(2)
                                        * Referenced by: '<Root>/Encoder'
                                        */
  uint8_T Encoder_P3;                  /* Expression: uint8(3)
                                        * Referenced by: '<Root>/Encoder'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_encoder_slsp {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    time_T stepSize0;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (auto storage) */
extern Parameters_encoder_slsp encoder_slsp_P;

/* Block signals (auto storage) */
extern BlockIO_encoder_slsp encoder_slsp_B;

/* Block states (auto storage) */
extern D_Work_encoder_slsp encoder_slsp_DWork;

/* Model entry point functions */
extern void encoder_slsp_initialize(void);
extern void encoder_slsp_step(void);
extern void encoder_slsp_terminate(void);

/* Real-time Model object */
extern RT_MODEL_encoder_slsp *const encoder_slsp_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'encoder_slsp'
 */
#endif                                 /* RTW_HEADER_encoder_slsp_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
