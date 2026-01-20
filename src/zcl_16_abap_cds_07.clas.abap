CLASS zcl_16_abap_cds_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_abap_cds_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM z16_customerwithtravels
      FIELDS CustomerId, \_Travel-TravelId, \_Travel-AgencyId, \_Travel-BeginDate, \_Travel-Status,
      \_Travel-Description, \_Travel-TotalPrice
      INTO TABLE @DATA(customers).

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
