CLASS lsc_zr_supplierinvhdr01tp DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    TYPES: BEGIN OF ty_data,
             purchaseorder TYPE ebeln,
             companycode   TYPE bukrs,
             supplier      TYPE lifnr,
             taxcode       TYPE mwskz,
           END OF ty_data.
    DATA: ls_data TYPE ty_data.

    METHODS zzcheckdata FOR VALIDATE ON SAVE
       keys FOR supplierinvhdr~zzcheckdata.

    METHODS zzgetadditionaldetails FOR DETERMINE ON SAVE
      IMPORTING keys FOR supplierinvhdr~zzgetadditionaldetails.


ENDCLASS.

CLASS lsc_zr_supplierinvhdr01tp IMPLEMENTATION.

  METHOD zzgetadditionaldetails.

    READ ENTITIES OF zr_supplierinvhdr01tp IN LOCAL MODE
        ENTITY supplierinvhdr
        ALL FIELDS WITH CORRESPONDING #( keys  )
        RESULT DATA(lt_hdr).

    IF lt_hdr[] IS NOT INITIAL.

      READ TABLE lt_hdr INTO DATA(ls_hdr) INDEX 1.

      SELECT SINGLE FROM i_purchaseorderapi01
          FIELDS purchaseorder, companycode, supplier, \_purchaseorderitem-taxcode
          WHERE purchaseorder = @ls_hdr-ponumber
          INTO @DATA(ls_rec)
          PRIVILEGED ACCESS.

    ENDIF.

  ENDMETHOD.

  METHOD zzcheckdata.

    READ ENTITIES OF zr_supplierinvhdr01tp IN LOCAL MODE
        ENTITY supplierinvhdr
        ALL FIELDS WITH CORRESPONDING #( keys  )
        RESULT DATA(lt_hdr).

    IF lt_hdr[] IS NOT INITIAL.

      READ TABLE lt_hdr INTO DATA(ls_hdr) INDEX 1.

      SELECT SINGLE FROM i_purchaseorderapi01
          FIELDS purchaseorder, companycode, supplier, \_purchaseorderitem-taxcode
          WHERE purchaseorder = @ls_hdr-ponumber
          INTO @DATA(ls_rec)
          PRIVILEGED ACCESS.

      SELECT SINGLE FROM i_supplierinvoiceapi01
          FIELDS supplierinvoice
          WHERE invoicingparty = @ls_rec-supplier
          AND supplierinvoiceidbyinvcgparty = @ls_hdr-invoicenumber
          INTO @DATA(lv_invoice)
          PRIVILEGED ACCESS.

      IF sy-subrc EQ 0.

        APPEND VALUE #( %tky = ls_hdr-%tky ) TO failed-supplierinvhdr.

        APPEND VALUE #(
            %tky = ls_hdr-%tky
            %element-InvoiceNumber = if_abap_behv=>mk-on
            %state_area = 'DUPLICATE POSTING'
            %msg = new_message_with_text(
                severity = if_abap_behv_message=>severity-error
                text = |Duplicate invoice { lv_invoice } found.| )
         ) TO reported-supplierinvhdr.

      ENDIF.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
