@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Draft query view forSupplierInvHdr'
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: false, 
  dataSources: [ 'SupplierInvHdr' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZR_SupplierInvHdr_D
  as select from ZSUPPLIERINVH00D as SupplierInvHdr
{
  key HeaderUUID as HeaderUUID,
  CompanyCode as CompanyCode,
  SupplierName as SupplierName,
  PoNumber as PoNumber,
  InvoiceNumber as InvoiceNumber,
  InvoiceDate as InvoiceDate,
  PostingDate as PostingDate,
  TotalAmount as TotalAmount,
  CurrencyCode as CurrencyCode,
  Description as Description,
  Status as Status,
  Message as Message,
  CreatedAt as CreatedAt,
  CreatedBy as CreatedBy,
  LastChangedBy as LastChangedBy,
  LastChangedAt as LastChangedAt,
  LocalLastChangedAt as LocalLastChangedAt,
  draftentitycreationdatetime as Draftentitycreationdatetime,
  draftentitylastchangedatetime as Draftentitylastchangedatetime,
  draftadministrativedatauuid as Draftadministrativedatauuid,
  draftentityoperationcode as Draftentityoperationcode,
  hasactiveentity as Hasactiveentity,
  draftfieldchanges as Draftfieldchanges
}
