@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extension include view forSupplierInvItm'
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAB', 
  allowNewDatasources: false, 
  allowNewCompositions: false, 
  dataSources: [ 'SupplierInvItm' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZE_SupplierInvItm
  as select from ZMM_SUP_INV_ITM as SupplierInvItm
{
  key ITEM_UUID as ItemUUID
}
