xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare variable $targetRouting :=
<routing>
    <bussines>
        <target>SUPPORT</target>
        <!-- Nombre del Dominio en el que se encuentra el servicio  -->
        <serviceDomain>getCustomerIdTypeList</serviceDomain><!--Canal Portal PN-->
        <!-- Nombre del servicio que se ejecuta -->
        <serviceName>CatalogInsurancePolicyManager</serviceName>
        <!-- Operacion de negocio a consumir – UTILIZADO PARA LA BUSQUEDA -->
        <operation>getCustomerIdTypeList</operation>
        <!-- Ruta del Bussines Service a ejecutar -->  
        <businessServiceList>
          <!-- Se puede repetir segun la cantidad de llamados que se realice a Business-->
          <businessServiceRecord>
            <businessService>SUP-catalogInsurancePolicyManager/v1/services/business/DB_PHOENIX_SP_USP_SRVOSB_TIPOIDENTIFICACION_BS</businessService>
            <!-- Operacion a Consumir del Bussines Service -->
            <operationBusiness>DB_PHOENIX_SP_USP_SRVOSB_TIPOIDENTIFICACION</operationBusiness>
          </businessServiceRecord>
        </businessServiceList>
        <!-- Ruta del xquery de fault body -->                            
        <xqueryFaultBody>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCustomerIdTypeList/getCustomerIdTypeListFault</xqueryFaultBody>
        <!-- Ruta del xquery de fault Header OPCIONAL -->     
        <xqueryFaultHeader></xqueryFaultHeader>
        <!-- Ruta del xquery de log Request -->     
        <xqueryLogRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCustomerIdTypeList/getCustomerIdTypeListLogRq</xqueryLogRequest>
        <!-- Ruta del xquery de log Response -->     
        <xqueryLogResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCustomerIdTypeList/getCustomerIdTypeListLogRs</xqueryLogResponse>
        <xqueryRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCustomerIdTypeList/getCustomerIdTypeListRq</xqueryRequest>
        <xqueryResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCustomerIdTypeList/getCustomerIdTypeListRs</xqueryResponse>
        <!-- Ruta del bussines JMS para el LOG publish dinamico-->     
        <logService>common/Auditory/services/business/JMSProducerBS</logService>
    </bussines>
    <bussines>
        <target>SUPPORT</target>
        <!-- Nombre del Dominio en el que se encuentra el servicio  -->
        <serviceDomain>getCountryList</serviceDomain><!--Canal Portal PN-->
        <!-- Nombre del servicio que se ejecuta -->
        <serviceName>CatalogInsurancePolicyManager</serviceName>
        <!-- Operacion de negocio a consumir – UTILIZADO PARA LA BUSQUEDA -->
        <operation>getCountryList</operation>
        <!-- Ruta del Bussines Service a ejecutar -->  
        <businessServiceList>
          <!-- Se puede repetir segun la cantidad de llamados que se realice a Business-->
          <businessServiceRecord>
            <businessService>SUP-catalogInsurancePolicyManager/v1/services/business/DB_PHOENIX_SP_USP_SRVOSB_PAISDEPTOCIUDADBAR_BS</businessService>
            <!-- Operacion a Consumir del Bussines Service -->
            <operationBusiness>DB_PHOENIX_SP_USP_SRVOSB_PAISDEPTOCIUDADBAR</operationBusiness>
          </businessServiceRecord>
        </businessServiceList>
        <!-- Ruta del xquery de fault body -->                            
        <xqueryFaultBody>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCountryList/getCountryListFault</xqueryFaultBody>
        <!-- Ruta del xquery de fault Header OPCIONAL -->     
        <xqueryFaultHeader></xqueryFaultHeader>
        <!-- Ruta del xquery de log Request -->     
        <xqueryLogRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCountryList/getCountryListLogRq</xqueryLogRequest>
        <!-- Ruta del xquery de log Response -->     
        <xqueryLogResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCountryList/getCountryListLogRs</xqueryLogResponse>
        <xqueryRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCountryList/getCountryListRq</xqueryRequest>
        <xqueryResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getCountryList/getCountryListRs</xqueryResponse>
        <!-- Ruta del bussines JMS para el LOG publish dinamico-->     
        <logService>common/Auditory/services/business/JMSProducerBS</logService>
    </bussines>
    <bussines>
        <target>SUPPORT</target>
        <!-- Nombre del Dominio en el que se encuentra el servicio  -->
        <serviceDomain>getIndutList</serviceDomain><!--Canal Portal PN-->
        <!-- Nombre del servicio que se ejecuta -->
        <serviceName>CatalogInsurancePolicyManager</serviceName>
        <!-- Operacion de negocio a consumir – UTILIZADO PARA LA BUSQUEDA -->
        <operation>getIndutList</operation>
        <!-- Ruta del Bussines Service a ejecutar -->  
        <businessServiceList>
          <!-- Se puede repetir segun la cantidad de llamados que se realice a Business-->
          <businessServiceRecord>
            <businessService>SUP-catalogInsurancePolicyManager/v1/services/business/DB_PHOENIX_SP_USP_SRVOSB_ACTIVIDADECONOMICA_BS</businessService>
            <!-- Operacion a Consumir del Bussines Service -->
            <operationBusiness>DB_PHOENIX_SP_USP_SRVOSB_ACTIVIDADECONOMICA</operationBusiness>
          </businessServiceRecord>
        </businessServiceList>
        <!-- Ruta del xquery de fault body -->                            
        <xqueryFaultBody>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getIndustList/getIndustListFault</xqueryFaultBody>
        <!-- Ruta del xquery de fault Header OPCIONAL -->     
        <xqueryFaultHeader></xqueryFaultHeader>
        <!-- Ruta del xquery de log Request -->     
        <xqueryLogRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getIndustList/getIndustListLogRq</xqueryLogRequest>
        <!-- Ruta del xquery de log Response -->     
        <xqueryLogResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getIndustList/getIndustListLogRs</xqueryLogResponse>
        <xqueryRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getIndustList/getIndustListRq</xqueryRequest>
        <xqueryResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getIndustList/getIndustListRs</xqueryResponse>
        <!-- Ruta del bussines JMS para el LOG publish dinamico-->     
        <logService>common/Auditory/services/business/JMSProducerBS</logService>
    </bussines>
    <bussines>
        <target>SUPPORT</target>
        <!-- Nombre del Dominio en el que se encuentra el servicio  -->
        <serviceDomain>getRelationshipList</serviceDomain><!--Canal Portal PN-->
        <!-- Nombre del servicio que se ejecuta -->
        <serviceName>CatalogInsurancePolicyManager</serviceName>
        <!-- Operacion de negocio a consumir – UTILIZADO PARA LA BUSQUEDA -->
        <operation>getRelationshipList</operation>
        <!-- Ruta del Bussines Service a ejecutar -->  
        <businessServiceList>
          <!-- Se puede repetir segun la cantidad de llamados que se realice a Business-->
          <businessServiceRecord>
            <businessService>SUP-catalogInsurancePolicyManager/v1/services/business/DB_PHOENIX_SP_USP_SRVOSB_PARENTESCO_BS</businessService>
            <!-- Operacion a Consumir del Bussines Service -->
            <operationBusiness>DB_PHOENIX_SP_USP_SRVOSB_PARENTESCO</operationBusiness>
          </businessServiceRecord>
        </businessServiceList>
        <!-- Ruta del xquery de fault body -->                            
        <xqueryFaultBody>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getRelationshipList/getRelationshipListFault</xqueryFaultBody>
        <!-- Ruta del xquery de fault Header OPCIONAL -->     
        <xqueryFaultHeader></xqueryFaultHeader>
        <!-- Ruta del xquery de log Request -->     
        <xqueryLogRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getRelationshipList/getRelationshipListLogRq</xqueryLogRequest>
        <!-- Ruta del xquery de log Response -->     
        <xqueryLogResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getRelationshipList/getRelationshipListLogRs</xqueryLogResponse>
        <xqueryRequest>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getRelationshipList/getRelationshipListRq</xqueryRequest>
        <xqueryResponse>SUP-catalogInsurancePolicyManager/v1/transform/xquery/getRelationshipList/getRelationshipListRs</xqueryResponse>
        <!-- Ruta del bussines JMS para el LOG publish dinamico-->     
        <logService>common/Auditory/services/business/JMSProducerBS</logService>
    </bussines>
</routing>;

declare variable $targetName as xs:string external;
declare variable $targetOperation as xs:string external;


declare function local:getTargetAdapterRouting($targetName as xs:string, $targetOperation as xs:string) as element() {
  $targetRouting/bussines[(target/text() = $targetName) and (operation/text() = $targetOperation)]
};

local:getTargetAdapterRouting($targetName, $targetOperation)