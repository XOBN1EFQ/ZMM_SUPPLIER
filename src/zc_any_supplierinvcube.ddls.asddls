@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytic Cube for Supplier Invoice'
@Analytics.dataCategory: #CUBE
@VDM.viewType: #COMPOSITE
@ObjectModel: {
   usageType: {
     dataClass:      #MIXED,
     serviceQuality: #D,
     sizeCategory:   #L
   }
}
@ObjectModel.supportedCapabilities:
   [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE ]
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE


define view entity ZC_ANY_SUPPLIERINVCUBE 
    as select from ZR_SupplierInvHdr01TP
{
    // Dimensions
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Company Code'
    key CompanyCode,

    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Supplier Name'    
    key SupplierName,

    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Invoice Number'
    key InvoiceNumber,
    
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'PO Number'
    PoNumber,
    
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Invoice Date'
    InvoiceDate,

    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Posting Date'
    PostingDate,
    
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Currency Code'
    CurrencyCode,

    @AnalyticsDetails.query.axis: #ROWS
    @EndUserText.label: 'Status'
    case Status
        when '1' then 'Error'
        when '2' then 'Pending'
        else 'Success' end as Status,
    
    // Measures with Aggregation
    @AnalyticsDetails.query.axis: #COLUMNS
    @EndUserText.label: 'Total Amount'
    @Semantics.amount.currencyCode: 'CurrencyCode'
    @DefaultAggregation: #SUM
    cast(TotalAmount as abap.curr(15, 2)) as Amount

    
}
