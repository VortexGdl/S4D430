@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: ' Demo 9: Path Expressions'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z16_Demo09 as select from Z16_DEMO08
{
  key CarrierId,
  key ConnectionId,
  AirportFromId,
  AirportToId,
  
  _Carrier.name as Name,// das nennt man Path Expression
  /* Associations */
  _Carrier, // Associations sind Joins die erst beim aufrufen geladen (verwendet) werden
  _Flights
}
