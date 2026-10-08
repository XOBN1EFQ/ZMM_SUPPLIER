@AccessControl.authorizationCheck: #CHECK
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
define root view entity ZI_SupplierInvHdr01TP
  provider contract TRANSACTIONAL_INTERFACE
  as projection on ZR_SupplierInvHdr01TP as SupplierInvHdr
{
  key HeaderUUID,
  CompanyCode,
  SupplierName,
  PoNumber,
  InvoiceNumber,
  InvoiceDate,
  PostingDate,
  TotalAmount,
  CurrencyCode,
  Description,
  Status,
  Message,
  CreatedAt,
  CreatedBy,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt,
  _SupplierInvItm : redirected to composition child ZI_SupplierInvItmTP
}
