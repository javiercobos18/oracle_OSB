xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace log="http://itau.com.co/services/common/auditory/v2/schemas";
(:: import schema at "../../../../../common/Auditory/interfaces/schemas/Auditory.xsd" ::)

declare namespace xref="http://www.oracle.com/osb/xpath-functions/xref";
declare namespace cmm2 = "http://itau.com.co/commoncannonical/v2/schemas";

declare variable $responseDatetime as xs:string external;
declare variable $responseHeader as element() external;
declare variable $responsePayload as element() external;
declare variable $targetRouting as element() external;
declare variable $correlationID as xs:string external;
declare variable $UUID as xs:string external;
declare variable $statusCode as xs:string external;
declare variable $description as xs:string external;
declare variable $approvalCode as xs:string external;

declare function local:getCountryListLogRs($responseDatetime as xs:string, 
                                                       $responseHeader as element(), 
                                                       $responsePayload as element(), 
                                                       $targetRouting as element(), 
                                                       $correlationID as xs:string,
                                                       $UUID as xs:string,
                                                       $statusCode as xs:string,
                                                       $description as xs:string,
                                                       $approvalCode as xs:string) as element() (:: schema-element(log:AuditoryLogResponse) ::) {
    <log:AuditoryLogResponse>
        <log:MessageId>
            <log:uuid>{$UUID}</log:uuid>
            <log:correlationId>{$correlationID}</log:correlationId>
        </log:MessageId>
        <log:type>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'PROCESS_TYPE_QUERY', 'cr_value', false())}</log:type>
        <log:Status>
            {
              if($statusCode = '0' or $statusCode = '00' or $statusCode = '000')then
                <log:finalStatus>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'FINAL_STATUS_TYPE_SUCCESS', 'cr_value', false())}</log:finalStatus>
              else if ($statusCode = xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossRespCode', 'cr_key', 'OSB_FAIL_CODE', 'cr_value', false())) then
                <log:finalStatus>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'FINAL_STATUS_TYPE_ERROR', 'cr_value', false())}</log:finalStatus>
              else
                <log:finalStatus>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'FINAL_STATUS_TYPE_WARNING', 'cr_value', false())}</log:finalStatus>
            }
            <log:code>{$statusCode}</log:code>
            <log:description>{$description}</log:description>
        </log:Status>
        <log:approvalCode>{$approvalCode}</log:approvalCode>
        <log:Response>
            <log:date>{$responseDatetime}</log:date>
            {
              if($responseHeader)then
                <log:header>{$responseHeader}</log:header>
              else
              ()
            }
            <log:body>{$responsePayload}</log:body>
        </log:Response>
    </log:AuditoryLogResponse>
};

local:getCountryListLogRs($responseDatetime, $responseHeader, $responsePayload, $targetRouting, $correlationID,$UUID, $statusCode, $description,$approvalCode)