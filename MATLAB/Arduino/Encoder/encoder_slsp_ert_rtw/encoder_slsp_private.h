/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: encoder_slsp_private.h
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

#ifndef RTW_HEADER_encoder_slsp_private_h_
#define RTW_HEADER_encoder_slsp_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmSetTFinal
# define rtmSetTFinal(rtm, val)        ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               (&(rtm)->Timing.taskTime0)
#endif

extern void sfcn_encoder_Outputs_wrapper(int16_T *pos,
  const real_T *xD,
  const uint8_T *enc, const int_T p_width0,
  const uint8_T *pinA, const int_T p_width1,
  const uint8_T *pinB, const int_T p_width2);
extern void sfcn_encoder_Update_wrapper(const int16_T *pos,
  real_T *xD,
  const uint8_T *enc, const int_T p_width0,
  const uint8_T *pinA, const int_T p_width1,
  const uint8_T *pinB, const int_T p_width2);

#endif                                 /* RTW_HEADER_encoder_slsp_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
