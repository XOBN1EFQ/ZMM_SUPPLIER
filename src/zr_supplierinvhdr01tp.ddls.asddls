@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forSupplierInvHdr'
@ObjectModel.sapObjectNodeType.name: 'ZSupplierInvHdr'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ '_Extension' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity ZR_SupplierInvHdr01TP
  as select from ZMM_SUP_INV_HDR as SupplierInvHdr
  association [1] to ZE_SupplierInvHdr as _Extension on $projection.HeaderUUID = _Extension.HeaderUUID
  composition [0..*] of ZR_SupplierInvItmTP as _SupplierInvItm
{
  key HEADER_UUID as HeaderUUID,
  COMPANY_CODE as CompanyCode,
  SUPPLIER_NAME as SupplierName,
  PO_NUMBER as PoNumber,
  INVOICE_NUMBER as InvoiceNumber,
  INVOICE_DATE as InvoiceDate,
  POSTING_DATE as PostingDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TOTAL_AMOUNT as TotalAmount,
  CURRENCY_CODE as CurrencyCode,
  DESCRIPTION as Description,
  STATUS as Status,
  MESSAGE as Message,
  @Semantics.systemDateTime.createdAt: true
  CREATED_AT as CreatedAt,
  @Semantics.user.createdBy: true
  CREATED_BY as CreatedBy,
  @Semantics.user.lastChangedBy: true
  LAST_CHANGED_BY as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  _SupplierInvItm,
  _Extension
}
