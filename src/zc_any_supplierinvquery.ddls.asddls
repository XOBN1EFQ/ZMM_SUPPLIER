@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytic Query for Supplier Invoice'
@VDM.viewType:  #CONSUMPTION
@ObjectModel: {
   usageType: {
     dataClass:      #MIXED,
     serviceQuality: #D,
     sizeCategory:   #L
   }
}
@Analytics.query:true
@ObjectModel.supportedCapabilities: 
   [ #ANALYTICAL_QUERY ]
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY

define view entity ZC_ANY_SUPPLIERINVQUERY 
    as select from ZC_ANY_SUPPLIERINVCUBE
{
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Company Code'
    key CompanyCode,

    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Supplier Name'    
    key SupplierName,

    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Invoice Number'
    key InvoiceNumber,
    
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'PO Number'
    PoNumber,
    
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Invoice Date'
    InvoiceDate,

    @AnalyticsDetails.query.axis: #ROWS
    @EndUserText.label: 'Posting Date'
    PostingDate,
    
    @AnalyticsDetails.query.axis: #FREE
    @EndUserText.label: 'Currency Code'
    CurrencyCode,

    @AnalyticsDetails.query.axis: #ROWS
    @EndUserText.label: 'Status'
    Status,
    
    // Measures with Aggregation
    @AnalyticsDetails.query.axis: #COLUMNS
    @EndUserText.label: 'Total Amount'
    @Semantics.amount.currencyCode: 'CurrencyCode'
    @DefaultAggregation: #SUM
    cast(Amount as abap.curr(15, 2)) as InvoiceAmount

    
}
