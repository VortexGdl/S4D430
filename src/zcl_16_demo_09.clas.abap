CLASS zcl_16_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_demo_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  select from z15_demo07( P_CarrierId = 'LH' )
  fields *
  into table @data(flights).

  out->write( flights ).

  ENDMETHOD.
ENDCLASS.
