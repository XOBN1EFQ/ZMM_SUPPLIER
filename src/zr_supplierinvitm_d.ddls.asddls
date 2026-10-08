@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Draft query view forSupplierInvItm'
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
define view entity ZR_SupplierInvItm_D
  as select from ZSUPPLIERINVI00D as SupplierInvItm
{
  key ItemUUID as ItemUUID,
  ParentUUID as ParentUUID,
  ItemID as ItemID,
  Quantity as Quantity,
  QuantityUnit as QuantityUnit,
  Amount as Amount,
  CurrencyCode as CurrencyCode,
  Description as Description,
  LocalLastChangedAt as LocalLastChangedAt,
  draftentitycreationdatetime as Draftentitycreationdatetime,
  draftentitylastchangedatetime as Draftentitylastchangedatetime,
  draftadministrativedatauuid as Draftadministrativedatauuid,
  draftentityoperationcode as Draftentityoperationcode,
  hasactiveentity as Hasactiveentity,
  draftfieldchanges as Draftfieldchanges
}
