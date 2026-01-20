CLASS zcl_16_demo_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_demo_10 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  select from z16_demo08
  fields CarrierId, ConnectionId, \_Carrier-name
  into table @data(connections).

  out->write( connections ).

  ENDMETHOD.
ENDCLASS.
