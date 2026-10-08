@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
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
@ObjectModel.semanticKey: [ 'ItemID' ]
@Search.searchable: true
define view entity ZC_UI_SupplierInvItmTP
  as projection on ZR_SupplierInvItmTP as SupplierInvItm
{
  key ItemUUID,
  ParentUUID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  ItemID,
  @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
  Quantity,
  @Semantics.unitOfMeasure: true
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_UnitOfMeasure', 
      element: 'UnitOfMeasure'
    }, 
    useForValidation: true
  } ]
  QuantityUnit,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  Amount,
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }, 
    useForValidation: true
  } ]
  CurrencyCode,
  Description,
  LocalLastChangedAt,
  _SupplierInvHdr : redirected to parent ZC_UI_SupplierInvHdrTP
}
