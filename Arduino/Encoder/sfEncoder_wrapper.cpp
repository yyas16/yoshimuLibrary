

/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>

#ifndef MATLAB_MEX_FILE 
#define ARDUINO 100 
#include <Arduino.h> 
#include "Encoder.h" 
#include "Encoder.cpp"
Encoder myEnc(2, 3); 
#endif
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define y_width 1
/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
extern "C" void sfEncoder_Outputs_wrapper(int32_T *counts,
			const real_T *xD,
			const uint8_T  *pinA, const int_T  p_width0,
			const uint8_T  *pinB, const int_T  p_width1)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* このサンプルは、出力を入力と等しくなるように設定します
      y0[0] = u0[0]; 
 複素数信号の場合は、次を使用します: y0[0].re = u0[0].re; 
      y0[0].im = u0[0].im;
      y1[0].re = u1[0].re;
      y1[0].im = u1[0].im;
*/

if(xD[0] == 1)
{
#ifndef MATLAB_MEX_FILE
// read counts.
counts[0] = myEnc.read();
#endif
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
  * Updates function
  *
  */
extern "C" void sfEncoder_Update_wrapper(const int32_T *counts,
			real_T *xD,
			const uint8_T  *pinA,  const int_T  p_width0,
			const uint8_T  *pinB,  const int_T  p_width1)
{
  /* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] != 1){
 
    xD[0] = 1;
    
            
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
