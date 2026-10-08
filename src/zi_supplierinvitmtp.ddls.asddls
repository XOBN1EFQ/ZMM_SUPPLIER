@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forSupplierInvItm'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAB', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'SupplierInvItm' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZI_SupplierInvItmTP
  as projection on ZR_SupplierInvItmTP as SupplierInvItm
{
  key ItemUUID,
  ParentUUID,
  ItemID,
  Quantity,
  QuantityUnit,
  Amount,
  CurrencyCode,
  Description,
  LocalLastChangedAt,
  _SupplierInvHdr : redirected to parent ZI_SupplierInvHdr01TP
}
