CLASS LHC_SUPPLIERINVHDR DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR SupplierInvHdr
        RESULT result,
      CALCULATEINVOICENUMBER FOR DETERMINE ON SAVE
        IMPORTING
          KEYS FOR  SupplierInvHdr~CalculateInvoiceNumber .
ENDCLASS.

CLASS LHC_SUPPLIERINVHDR IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD CALCULATEINVOICENUMBER.
  READ ENTITIES OF ZR_SupplierInvHdr01TP IN LOCAL MODE
    ENTITY SupplierInvHdr
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(entities).
  DELETE entities WHERE InvoiceNumber IS NOT INITIAL.
  Check entities is not initial.
  "Dummy logic to determine object_id
  SELECT MAX( INVOICE_NUMBER ) FROM ZMM_SUP_INV_HDR INTO @DATA(max_object_id).
  "Add support for draft if used in modify
  "SELECT SINGLE FROM FROM ZSUPPLIERINVH00D FIELDS MAX( InvoiceNumber ) INTO @DATA(max_orderid_draft). "draft table
  "if max_orderid_draft > max_object_id
  " max_object_id = max_orderid_draft.
  "ENDIF.
  MODIFY ENTITIES OF ZR_SupplierInvHdr01TP IN LOCAL MODE
    ENTITY SupplierInvHdr
      UPDATE FIELDS ( InvoiceNumber )
        WITH VALUE #( FOR entity IN entities INDEX INTO i (
        %tky          = entity-%tky
        InvoiceNumber     = max_object_id + i
  ) ).
  ENDMETHOD.
ENDCLASS.
