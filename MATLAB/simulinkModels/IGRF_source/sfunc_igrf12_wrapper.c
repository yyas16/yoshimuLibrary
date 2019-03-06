
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
#include <math.h>          /* maths functions */
#include "igrfsyn12.h"
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 1
#define y_width 1

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output function
 *
 */
void sfunc_igrf12_Outputs_wrapper(const real_T *fyear,
			const real_T *elon,
			const real_T *nlat,
			const real_T *alt,
			real_T *b_out)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* このサンプルは、出力を入力と等しくなるように設定します
      y0[0] = u0[0]; 
 複素数信号の場合は、次を使用します: y0[0].re = u0[0].re; 
      y0[0].im = u0[0].im;
      y1[0].re = u1[0].re;
      y1[0].im = u1[0].im;
*/
double b[3] = {0,0,0};

	igrf12syn(fyear[0], alt[0], nlat[0], elon[0], b);
 
b_out[0] = b[0];
b_out[1] = b[1];
b_out[2] = b[2];
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}


