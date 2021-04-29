xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace cat="http://itau.com.co/services/support/cataloginsurancepolicymanager/v1/schemas";
(:: import schema at "../../../interfaces/schemas/CatalogInsurancePolicyManager.xsd" ::)
declare namespace sp="http://xmlns.oracle.com/pcbpel/adapter/db/sp/DB_PHOENIX_SP_USP_SRVOSB_TIPOIDENTIFICACION";
(:: import schema at "../../../interfaces/schemas/DB_PHOENIX_SP_USP_SRVOSB_TIPOIDENTIFICACION.xsd" ::)

declare namespace cmm2 = "http://itau.com.co/commoncannonical/v2/schemas";
declare namespace xref="http://www.oracle.com/osb/xpath-functions/xref";


declare variable $requestPayloadProxy as element() (:: schema-element(cat:getCustomerIdTypeListRq) ::) external;
declare variable $responsePayloadTarget as element() (:: schema-element(sp:OutputParameters) ::) external;

declare function local:getCustomerIdTypeListRs($requestPayloadProxy as element() (:: schema-element(cat:getCustomerIdTypeListRq) ::), 
                                               $responsePayloadTarget as element() (:: schema-element(sp:OutputParameters) ::)) 
                                               as element() (:: schema-element(cat:getCustomerIdTypeListRs) ::) {
    let $procedureSuccessCode:= xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'PROCEDURE_SUCCESS_CODE_PHOENIX', 'cr_value', false())
    let $serverStatusCode:= fn:data($responsePayloadTarget/sp:rnError)
    return
    <cat:getCustomerIdTypeListRs>
      <cat:HeaderResponse>     
        <cmm2:MessageHeader>
          <cmm2:MessageKey>
                    {
                        if ($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageKey/cmm2:integrationId)
                        then <cmm2:integrationId>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageKey/cmm2:integrationId)}</cmm2:integrationId>
                        else ()
                    }
                    {
                        if ($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageKey/cmm2:requestVersion)
                        then <cmm2:requestVersion>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageKey/cmm2:requestVersion)}</cmm2:requestVersion>
                        else ()
                    }
                    <cmm2:requestUUID>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageKey/cmm2:requestUUID)}</cmm2:requestUUID>
                </cmm2:MessageKey>
                <cmm2:MessageInfo>
                    <cmm2:dateTime>{fn:current-dateTime()}</cmm2:dateTime>
                    <cmm2:systemId>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:systemId)}</cmm2:systemId>
                    {
                        if ($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:originatorName)
                        then <cmm2:originatorName>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:originatorName)}</cmm2:originatorName>
                        else ()
                    }
                    <cmm2:originatorType>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:originatorType)}</cmm2:originatorType>
                    <cmm2:terminalId>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:terminalId)}</cmm2:terminalId>
                    {
                        if ($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:terminalType)
                        then <cmm2:terminalType>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:terminalType)}</cmm2:terminalType>
                        else ()
                    }
                    {
                        if ($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:bankIdType)
                        then <cmm2:bankIdType>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:bankIdType)}</cmm2:bankIdType>
                        else ()
                    }
                    {
                        if ($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:bankId)
                        then <cmm2:bankId>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:bankId)}</cmm2:bankId>
                        else ()
                    }
                    {
                        if ($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:trnType)
                        then <cmm2:trnType>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:trnType)}</cmm2:trnType>
                        else ()
                    }
                </cmm2:MessageInfo>
                <cmm2:TrnInfoList>
                  <cmm2:TrnInfo>
                  {
                  if (xs:string($serverStatusCode)=$procedureSuccessCode)
                  then
                    <cmm2:trnCode></cmm2:trnCode>
                  else
                    <cmm2:trnCode>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'BACKEND_ERROR_CODE', 'cr_value', false())}</cmm2:trnCode>
                  }
                  <cmm2:trnSrc>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'BACKEND_CORE_CODE', 'cr_value', false())}</cmm2:trnSrc>
              </cmm2:TrnInfo>
            </cmm2:TrnInfoList>
          </cmm2:MessageHeader>
          <cmm2:Status>
            <cmm2:statusCode>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_SUCCESS_CODE', 'cr_value', false())}</cmm2:statusCode>
            <cmm2:serverStatusCode>{fn:data($responsePayloadTarget/sp:rnError)}</cmm2:serverStatusCode>
            {
            if (xs:string($serverStatusCode)=$procedureSuccessCode)
            then
              <cmm2:severity>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_SUCCESS_DESC', 'cr_value', false())}</cmm2:severity>  
            else
              <cmm2:severity>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_WARNING_DESC', 'cr_value', false())}</cmm2:severity>
            }
            <cmm2:statusDesc>{fn:data($responsePayloadTarget/sp:rsDescError)}</cmm2:statusDesc>
          </cmm2:Status>
      </cat:HeaderResponse>
      {
        if(xs:string($serverStatusCode)=$procedureSuccessCode) then
        <cat:CustomerIdTypeList>
        {
        for $LR_CUSTOMERTYPELIST in $responsePayloadTarget/sp:RowSet0/sp:RowSet0_Row
        return
          <cat:CustomerIdTypeInfo>
              <cat:custIdType>{fn:data($LR_CUSTOMERTYPELIST/sp:tin_type_id)}</cat:custIdType>
              <cat:desc>{fn:data($LR_CUSTOMERTYPELIST/sp:description)}</cat:desc>
          </cat:CustomerIdTypeInfo>
        }
        </cat:CustomerIdTypeList>
        else
        ()
      }
    </cat:getCustomerIdTypeListRs>
};

local:getCustomerIdTypeListRs($requestPayloadProxy, $responsePayloadTarget)