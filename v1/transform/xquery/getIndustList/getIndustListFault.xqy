xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace cat="http://itau.com.co/services/support/cataloginsurancepolicymanager/v1/schemas";
(:: import schema at "../../../interfaces/schemas/CatalogInsurancePolicyManager.xsd" ::)

declare namespace cmm2 = "http://itau.com.co/commoncannonical/v2/schemas";
declare namespace xref="http://www.oracle.com/osb/xpath-functions/xref";

declare variable $codeFault as xs:string external;
declare variable $descFault as xs:string external;
declare variable $requestPayloadProxy as element() (:: schema-element(cat:getIndutListRq) ::) external;

declare function local:doValidateCustomerProductRelFault($codeFault as xs:string, 
                                                       $descFault as xs:string,
                                                       $requestPayloadProxy as element() (:: schema-element(cat:getIndutListRq) ::)) as element() (:: schema-element(cat:getIndutListRs) ::) {
    <cat:getIndutListRs>
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
            </cmm2:MessageHeader>
            <cmm2:Status>
                { 
                      if(fn:data($codeFault)='OSB-382505')
                      then
                        <cmm2:statusCode>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_FAIL_VALIDATE_CODE', 'cr_value', false())}</cmm2:statusCode>
                      else
                        <cmm2:statusCode>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_FAIL_GENERAL_CODE', 'cr_value', false())}</cmm2:statusCode>
                      }
                        <cmm2:serverStatusCode></cmm2:serverStatusCode>
                        <cmm2:severity>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_FAIL_DESC', 'cr_value', false())}</cmm2:severity>
                      {
                      if(fn:data($codeFault)='OSB-382505')
                      then
                        <cmm2:statusDesc>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_FAIL_VALIDATE_CODE', 'cr_desc', false())}</cmm2:statusDesc>
                      else
                        <cmm2:statusDesc>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_FAIL_GENERAL_CODE', 'cr_desc', false())}</cmm2:statusDesc>
                      }
                      <cmm2:AdditionalStatus>
                      {
                      if(fn:contains(fn:data($codeFault),'-'))
                      then
                        <cmm2:statusCode>{fn:substring-after(fn:data($codeFault), '-')}</cmm2:statusCode>
                      else
                        <cmm2:statusCode>{fn:data($codeFault)}</cmm2:statusCode>
                      }
                    <cmm2:serverStatusCode></cmm2:serverStatusCode>
                    <cmm2:severity>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_FAIL_DESC', 'cr_value', false())}</cmm2:severity>
                    <cmm2:statusDesc>{fn:data($descFault)}</cmm2:statusDesc>
                    </cmm2:AdditionalStatus>
            </cmm2:Status>
        </cat:HeaderResponse>
      <cat:count>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'GENERIC_NUMBER_ZERO', 'cr_value', false())}</cat:count>
    </cat:getIndutListRs>
};

local:doValidateCustomerProductRelFault($codeFault, $descFault, $requestPayloadProxy)