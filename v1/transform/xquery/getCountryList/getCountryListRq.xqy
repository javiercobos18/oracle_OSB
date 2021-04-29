xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace cat="http://itau.com.co/services/support/cataloginsurancepolicymanager/v1/schemas";
(:: import schema at "../../../interfaces/schemas/CatalogInsurancePolicyManager.xsd" ::)
declare namespace sp="http://xmlns.oracle.com/pcbpel/adapter/db/sp/DB_PHOENIX_SP_USP_SRVOSB_PAISDEPTOCIUDADBAR";
(:: import schema at "../../../interfaces/schemas/DB_PHOENIX_SP_USP_SRVOSB_PAISDEPTOCIUDADBAR.xsd" ::)

declare namespace xref="http://www.oracle.com/osb/xpath-functions/xref";
declare namespace cmm2 = "http://itau.com.co/commoncannonical/v2/schemas";

declare variable $requestPayloadProxy as element() (:: schema-element(cat:getCountryListRq) ::) external;

declare function local:getCountryListRq($requestPayloadProxy as element() (:: schema-element(cat:getCountryListRq) ::)) as element() (:: schema-element(sp:InputParameters) ::) {
    <sp:InputParameters>
        {
            if ($requestPayloadProxy/cat:HeaderRequest/cmm2:User/cmm2:employeeIdentlNum)
            then <sp:pnEmpleado>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:User/cmm2:employeeIdentlNum)}</sp:pnEmpleado>
            else <sp:pnEmpleado>{xref:lookupXRef('common/CrossReference/transform/xref/TargetCrossInfo', 'cr_key', 'OSB_PHOENIX_EMPLOYEEID', 'cr_value', false())}</sp:pnEmpleado>
        }
        <sp:psUApplExterno>{fn:data($requestPayloadProxy/cat:HeaderRequest/cmm2:MessageHeader/cmm2:MessageInfo/cmm2:originatorName)}</sp:psUApplExterno>
        <sp:pnRegXPag>{fn:data($requestPayloadProxy/cat:maxRec)}</sp:pnRegXPag>
        <sp:pnPagNro>{fn:data($requestPayloadProxy/cat:seqNum)}</sp:pnPagNro>
    </sp:InputParameters>
};

local:getCountryListRq($requestPayloadProxy)