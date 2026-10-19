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
  as select from zsupplierinvh00d as SupplierInvHdr
{
  key headeruuid as HeaderUUID,
  companycode as CompanyCode,
  suppliername as SupplierName,
  ponumber as PoNumber,
  invoicenumber as InvoiceNumber,
  invoicedate as InvoiceDate,
  postingdate as PostingDate,
  totalamount as TotalAmount,
  currencycode as CurrencyCode,
  description as Description,
  status as Status,
  message as Message,
  filename as Filename,
  link as Link,
  createdat as CreatedAt,
  createdby as CreatedBy,
  lastchangedby as LastChangedBy,
  lastchangedat as LastChangedAt,
  supplier as Supplier,
  taxcode as TaxCode,
  locallastchangedat as LocalLastChangedAt,
  draftentitycreationdatetime as Draftentitycreationdatetime,
  draftentitylastchangedatetime as Draftentitylastchangedatetime,
  draftadministrativedatauuid as Draftadministrativedatauuid,
  draftentityoperationcode as Draftentityoperationcode,
  hasactiveentity as Hasactiveentity,
  draftfieldchanges as Draftfieldchanges
}
