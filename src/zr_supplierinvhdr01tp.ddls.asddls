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
  as select from zmm_sup_inv_hdr as SupplierInvHdr
  association [1] to ZE_SupplierInvHdr as _Extension on $projection.HeaderUUID = _Extension.HeaderUUID
  composition [0..*] of ZR_SupplierInvItmTP as _SupplierInvItm
{
  key header_uuid as HeaderUUID,
  company_code as CompanyCode,
  supplier_name as SupplierName,
  po_number as PoNumber,
  invoice_number as InvoiceNumber,
  invoice_date as InvoiceDate,
  posting_date as PostingDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  total_amount as TotalAmount,
  currency_code as CurrencyCode,
  description as Description,
  status as Status,
  filename as Filename,
  message as Message,
  link as Link,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  _SupplierInvItm,
  _Extension
}
