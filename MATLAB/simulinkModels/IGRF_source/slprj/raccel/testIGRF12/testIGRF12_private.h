#include "__cf_testIGRF12.h"
#ifndef RTW_HEADER_testIGRF12_private_h_
#define RTW_HEADER_testIGRF12_private_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#if !defined(rt_VALIDATE_MEMORY)
#define rt_VALIDATE_MEMORY(S, ptr)   if(!(ptr)) {\
  ssSetErrorStatus(rtS, RT_MEMORY_ALLOCATION_ERROR);\
  }
#endif
#if !defined(rt_FREE)
#if !defined(_WIN32)
#define rt_FREE(ptr)   if((ptr) != (NULL)) {\
  free((ptr));\
  (ptr) = (NULL);\
  }
#else
#define rt_FREE(ptr)   if((ptr) != (NULL)) {\
  free((void *)(ptr));\
  (ptr) = (NULL);\
  }
#endif
#endif
#ifdef __cplusplus
extern "C" {
#endif
extern void sfunc_igrf12_Start_wrapper ( void ) ; extern void
sfunc_igrf12_Outputs_wrapper ( const real_T * fyear , const real_T * elon ,
const real_T * nlat , const real_T * alt , real_T * b_out ) ; extern void
sfunc_igrf12_Terminate_wrapper ( void ) ;
#ifdef __cplusplus
}
#endif
#if defined(MULTITASKING)
#error Models using the variable step solvers cannot define MULTITASKING
#endif
#endif
