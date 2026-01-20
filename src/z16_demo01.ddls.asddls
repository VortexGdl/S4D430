@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 1: Projections'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z16_Demo01 //Name der CDS View Entity (max. 30 zeichen)
  as select from /dmo/connection //Mehr Java ähnliuch daher somit // als Kommentar beginn

{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,

      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit
}
