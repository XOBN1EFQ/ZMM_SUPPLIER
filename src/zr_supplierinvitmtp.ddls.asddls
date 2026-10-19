@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forSupplierInvItm'
@ObjectModel.sapObjectNodeType.name: 'ZSupplierInvItm'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAB', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZR_SupplierInvItmTP
  as select from zmm_sup_inv_itm as SupplierInvItm
  association to parent ZR_SupplierInvHdr01TP as _SupplierInvHdr on $projection.ParentUUID = _SupplierInvHdr.HeaderUUID
{
  key item_uuid as ItemUUID,
  parent_uuid as ParentUUID,
  item_id as ItemID,
  @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
  quantity as Quantity,
  quantity_unit as QuantityUnit,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  amount as Amount,
  currency_code as CurrencyCode,
  description as Description,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  _SupplierInvHdr
}
