/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: test_private.h
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

#ifndef RTW_HEADER_test_private_h_
#define RTW_HEADER_test_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmSetTFinal
# define rtmSetTFinal(rtm, val)        ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               (&(rtm)->Timing.taskTime0)
#endif

extern void sfEncoder_Outputs_wrapper(int32_T *counts,
  const real_T *xD,
  const uint8_T *pinA, const int_T p_width0,
  const uint8_T *pinB, const int_T p_width1);
extern void sfEncoder_Update_wrapper(const int32_T *counts,
  real_T *xD,
  const uint8_T *pinA, const int_T p_width0,
  const uint8_T *pinB, const int_T p_width1);

#endif                                 /* RTW_HEADER_test_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
