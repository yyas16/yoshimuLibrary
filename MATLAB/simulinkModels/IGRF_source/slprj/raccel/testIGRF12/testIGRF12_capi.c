#include "__cf_testIGRF12.h"
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "testIGRF12_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "testIGRF12.h"
#include "testIGRF12_capi.h"
#include "testIGRF12_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"testIGRF12/S-Function" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 1
, 0 , TARGET_STRING ( "testIGRF12/test_igrf12" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ;
static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 2 ,
TARGET_STRING ( "testIGRF12/Constant" ) , TARGET_STRING ( "Value" ) , 0 , 1 ,
0 } , { 3 , TARGET_STRING ( "testIGRF12/Constant1" ) , TARGET_STRING (
"Value" ) , 0 , 1 , 0 } , { 4 , TARGET_STRING ( "testIGRF12/Constant2" ) ,
TARGET_STRING ( "Value" ) , 0 , 1 , 0 } , { 5 , TARGET_STRING (
"testIGRF12/Constant3" ) , TARGET_STRING ( "Value" ) , 0 , 1 , 0 } , { 0 , (
NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static const rtwCAPI_ModelParameters
rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . lntw1t3wio [ 0 ] , & rtB .
aun4gqhlc5 [ 0 ] , & rtP . Constant_Value , & rtP . Constant1_Value , & rtP .
Constant2_Value , & rtP . Constant3_Value , } ; static int32_T *
rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_MATRIX_COL_MAJOR , 0 , 2 , 0 } , { rtwCAPI_SCALAR , 2 , 2 , 0 } } ;
static const uint_T rtDimensionArray [ ] = { 3 , 1 , 1 , 1 } ; static const
rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( NULL ) , ( NULL ) , 1 , 0 } } ; static
rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 2 , ( NULL )
, 0 , ( NULL ) , 0 } , { rtBlockParameters , 4 , rtModelParameters , 0 } , {
( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap
, rtSampleTimeMap , rtDimensionArray } , "float" , { 2013793848U ,
2568148352U , 1217162368U , 3041486126U } , ( NULL ) , 0 , 0 } ; const
rtwCAPI_ModelMappingStaticInfo * testIGRF12_GetCAPIStaticMap ( void ) {
return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void testIGRF12_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void testIGRF12_host_InitializeDataMapInfo ( testIGRF12_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
