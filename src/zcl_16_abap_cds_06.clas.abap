CLASS zcl_16_abap_cds_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_16_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM z16_customerkpis( P_City = 'Mainz' )
      FIELDS *
      Order by TotalRevenue DESCENDING
      INTO TABLE @DATA(customers).

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
