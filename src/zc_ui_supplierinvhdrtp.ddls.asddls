@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forSupplierInvHdr'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'SupplierInvHdr' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
@ObjectModel.semanticKey: [ 'InvoiceNumber' ]
@Search.searchable: true
define root view entity ZC_UI_SupplierInvHdrTP
  provider contract transactional_query
  as projection on ZR_SupplierInvHdr01TP as SupplierInvHdr
{
  key HeaderUUID,
  CompanyCode,
  SupplierName,
  PoNumber,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  InvoiceNumber,
  InvoiceDate,
  PostingDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TotalAmount,
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }, 
    useForValidation: true
  } ]
  CurrencyCode,
  Description,
  Status,
  Message,
  CreatedAt,
  CreatedBy,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt,
  _SupplierInvItm : redirected to composition child ZC_UI_SupplierInvItmTP
}
