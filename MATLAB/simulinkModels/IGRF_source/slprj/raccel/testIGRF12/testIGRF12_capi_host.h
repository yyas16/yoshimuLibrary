#include "__cf_testIGRF12.h"
#ifndef RTW_HEADER_testIGRF12_cap_host_h_
#define RTW_HEADER_testIGRF12_cap_host_h_
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
testIGRF12_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void testIGRF12_host_InitializeDataMapInfo ( testIGRF12_host_DataMapInfo_T *
dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif
