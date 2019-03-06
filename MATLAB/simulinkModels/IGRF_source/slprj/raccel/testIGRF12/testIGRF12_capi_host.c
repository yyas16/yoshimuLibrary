#include "testIGRF12_capi_host.h"
static testIGRF12_host_DataMapInfo_T root;
static int initialized = 0;
rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        testIGRF12_host_InitializeDataMapInfo(&(root), "testIGRF12");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
