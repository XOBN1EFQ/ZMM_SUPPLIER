CLASS zcl_test_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_class IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(ld_cid) = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( ).
      CATCH cx_uuid_error.
    ENDTRY.

    DATA: lt_invoice TYPE TABLE FOR ACTION IMPORT i_supplierinvoicetp~create,
          ls_invoice LIKE LINE OF lt_invoice.

    SELECT SINGLE PurchaseOrder, CompanyCode, Supplier
        FROM I_PurchaseOrderAPI01
        WHERE PurchaseOrder = '4500000073'
        INTO @DATA(ls_rec).

    ls_invoice-%cid = ld_cid.
    ls_invoice-%param-supplierinvoiceiscreditmemo   = abap_false.
    ls_invoice-%param-companycode                   = ls_rec-CompanyCode.
    ls_invoice-%param-invoicingparty                = ls_rec-Supplier.
    ls_invoice-%param-postingdate                   = cl_abap_context_info=>get_system_date( ).
    ls_invoice-%param-documentdate                  = cl_abap_context_info=>get_system_date( ).
    ls_invoice-%param-documentcurrency              = 'NZD'.
    ls_invoice-%param-invoicegrossamount            = '100.00'.
    ls_invoice-%param-taxiscalculatedautomatically  = abap_true.
    ls_invoice-%param-taxdeterminationdate          = cl_abap_context_info=>get_system_date( ).
    ls_invoice-%param-supplierinvoiceidbyinvcgparty = 'INV-2026-010-1'.
    ls_invoice-%param-documentheadertext            = 'Posted via API'.
    ls_invoice-%param-supplierinvoicestatus         = cl_mmiv_rap_ext_c=>supplierinvoicestatus-held.

    APPEND VALUE #(
                    supplierinvoiceitem            = '1'
                    purchaseorder                  = ls_rec-PurchaseOrder
                    purchaseorderitem              = '10'
                    documentcurrency               = 'NZD'
                    supplierinvoiceitemamount      = '100.00'
                    purchaseorderquantityunit      = 'ST'
                    quantityinpurchaseorderunit    = '10'
                    taxcode                         = 'P0'
     ) TO ls_invoice-%param-_itemswithporeference.

    INSERT ls_invoice INTO TABLE lt_invoice.

    SELECT SINGLE supplierinvoice
        FROM i_supplierinvoiceapi01
        WHERE invoicingparty = '0069300001'
        AND supplierinvoiceidbyinvcgparty = 'INV-2026-010-1'
        INTO @DATA(lv_invoice).

    IF sy-subrc NE 0.

      MODIFY ENTITIES OF i_supplierinvoicetp
        ENTITY supplierinvoice
        EXECUTE create FROM lt_invoice
        FAILED DATA(lt_failed)
        REPORTED DATA(lt_reported)
        MAPPED DATA(lt_mapped).

      IF lt_failed IS INITIAL.
        COMMIT ENTITIES
            RESPONSE OF i_supplierinvoicetp
            FAILED DATA(lt_commit_failed)
            REPORTED DATA(lt_commit_reported).

        IF lt_commit_failed IS INITIAL.
          SELECT SINGLE supplierinvoice
              FROM i_supplierinvoiceapi01
              WHERE invoicingparty = '0069300001'
              AND supplierinvoiceidbyinvcgparty = 'INV-2026-010-1'
              INTO @lv_invoice.
          out->write( |Supplier invoice { lv_invoice } posted successfully.| ).
          LOOP AT lt_mapped-supplierinvoice ASSIGNING FIELD-SYMBOL(<fs_mapped>).
            out->write( | Posted Invoice number is: { <fs_mapped>-supplierinvoice }. | ).
          ENDLOOP.
        ELSE.
          out->write( lt_commit_reported ).
        ENDIF.

      ELSE.

*        out->write( lt_failed ).
*        out->write( lt_reported ).
        LOOP AT lt_reported-supplierinvoice ASSIGNING FIELD-SYMBOL(<fs_rep>).
          IF <fs_rep>-%msg IS BOUND.
            out->write( <fs_rep>-%msg->if_message~get_text( ) ).
          ENDIF.
        ENDLOOP.

      ENDIF.

    ELSE.
      out->write( |Invoice already posted before!| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
