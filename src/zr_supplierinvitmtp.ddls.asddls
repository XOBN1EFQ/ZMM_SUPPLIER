@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forSupplierInvItm'
@ObjectModel.sapObjectNodeType.name: 'ZSupplierInvItm'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAB', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ '_Extension' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZR_SupplierInvItmTP
  as select from ZMM_SUP_INV_ITM as SupplierInvItm
  association to parent ZR_SupplierInvHdr01TP as _SupplierInvHdr on $projection.ParentUUID = _SupplierInvHdr.HeaderUUID
  association [1] to ZE_SupplierInvItm as _Extension on $projection.ItemUUID = _Extension.ItemUUID
{
  key ITEM_UUID as ItemUUID,
  PARENT_UUID as ParentUUID,
  ITEM_ID as ItemID,
  @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
  QUANTITY as Quantity,
  QUANTITY_UNIT as QuantityUnit,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  AMOUNT as Amount,
  CURRENCY_CODE as CurrencyCode,
  DESCRIPTION as Description,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  _SupplierInvHdr,
  _Extension
}
