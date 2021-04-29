xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace log="http://itau.com.co/services/common/auditory/v2/schemas";
(:: import schema at "../../../../../common/Auditory/interfaces/schemas/Auditory.xsd" ::)
declare namespace cat="http://itau.com.co/services/support/cataloginsurancepolicymanager/v1/schemas";
(:: import schema at "../../../interfaces/schemas/CatalogInsurancePolicyManager.xsd" ::)

declare namespace xref="http://www.oracle.com/osb/xpath-functions/xref";
declare namespace cmm2 = "http://itau.com.co/commoncannonical/v2/schemas";

declare variable $requestDatetime as xs:string external;
declare variable $requestHeader as element() external;
declare variable $requestPayload as element()external;
declare variable $targetRouting as element() external;
declare variable $correlationID as xs:string external;
declare variable $requestPayloadTarget as element() external;
declare variable $countBusiness as xs:integer external;

declare function local:getIndustListLogRq($requestDatetime as xs:string, 
                                                       $requestHeader as element(), 
                                                       $requestPayload as element(), 
                                                       $targetRouting as element(), 
                                                       $correlationID as xs:string,
                                                       $requestPayloadTarget as element(),
                                                       $countBusiness as xs:integer) as element() (:: schema-element(log:AuditoryLogRequest) ::) {
    <log:AuditoryLogRequest>
        <log:MessageId>
            <log:uuid>{fn:data($requestPayload/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageKey/cmm2:requestUUID)}</log:uuid>
            <log:correlationId>{$correlationID}</log:correlationId>
        </log:MessageId>
        <log:type>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'PROCESS_TYPE_QUERY', 'cr_value', false())}</log:type>
        <log:ServiceIdentification>
              <log:domain>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'SUPPORT_DOMAIN', 'cr_value', false())}</log:domain>
            <log:code>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', ' SUPPORT_GETINDUSTLIST_IDFUNCIONALITY', 'cr_value', false())}</log:code>
            {
              if($countBusiness=0)then
                <log:name>{fn:concat($targetRouting/serviceName/text(),"/",$targetRouting/operation/text())}</log:name>
              else
                <log:name>{fn:concat(fn:substring-after($targetRouting/businessServiceList/businessServiceRecord[$countBusiness]/businessService/text(),'services/'),'/',$targetRouting/businessServiceList/businessServiceRecord[$countBusiness]/operationBusiness/text())}</log:name>
            }
        </log:ServiceIdentification>
        <log:Source>
            <log:channel>{fn:data($requestPayload/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:originatorType)}</log:channel>
            <log:system>{fn:data($requestPayload/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:originatorName)}</log:system>
            {
            if(fn:data($requestPayload/cat:CustId/cmm2:custLoginId)!="") then
              <log:userLogin>{fn:data($requestPayload/cat:CustId/cmm2:custLoginId)}</log:userLogin>
            else
              <log:userLogin>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'DEFAULT_USER_LOGIN', 'cr_value', false())}</log:userLogin>
            }
            <log:employeeCode>{fn:data($requestPayload/cat:HeaderRequest/cmm2:User/cmm2:employeeIdentlNum)}</log:employeeCode>
            <log:Location>
                <log:deviceId>{fn:data($requestPayload/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:terminalId)}</log:deviceId>
                <log:office></log:office>
            </log:Location>
        </log:Source>
        <log:Request>
            <log:date>{$requestDatetime}</log:date>
            { 
              if($requestHeader and $countBusiness=0)then
                <log:header>{$requestHeader}</log:header>
              else
              ()
            }
            {
              if($countBusiness=0)then
                <log:body>{$requestPayload}</log:body>
              else
                <log:body>{$requestPayloadTarget}</log:body>
            }
        </log:Request>
        <log:Customer>
            <log:type></log:type>
            <log:id></log:id>
        </log:Customer>
        <log:Transaction>
            <log:amount></log:amount>
            <log:cost></log:cost>
            <log:currencyType></log:currencyType>
        </log:Transaction>
        <log:SourceProduct>
            <log:productType></log:productType>
            <log:productNumber></log:productNumber>
        </log:SourceProduct>
        <log:TargetProduct>
            <log:productType></log:productType>
            <log:productNumber></log:productNumber>
        </log:TargetProduct>
    </log:AuditoryLogRequest>
};

local:getIndustListLogRq($requestDatetime, $requestHeader, $requestPayload, $targetRouting, $correlationID,$requestPayloadTarget, $countBusiness)