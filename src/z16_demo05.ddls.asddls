@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 5: Aggregatsfunktionen'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z16_Demo05
  as select from /dmo/flight

{
  key carrier_id,

      count(*)                                            as NumberOfFlights,
      count(distinct plane_type_id)                       as NumberOfPlainTypes,
      max(seats_occupied)                                 as MaxSeatsOccupied,
      min(seats_occupied)                                 as MinSeatsOccupied,
      sum(seats_occupied)                                 as SumSeatsOccupied,

      sum(case
          when seats_occupied / seats_max > 0.7 then 1
           else 0 end)                                    as NumberOfMostlyBookedUpFlights,

      sum(case when seats_occupied = 0 then 1 else 0 end) as NumberOfEmptyFlights,
      avg(seats_occupied as abap.dec(12,1))               as AverageOccupiedSeats,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      avg(price as abap.curr(16,2)) as AveragePrice ,
      currency_code as CurrencyCode
}
// where bezieht sich auf die ursprüngliche Tabelle und Having auf dei erstellte tabelle
group by 
carrier_id,
currency_code
having avg(price as abap.curr(16,2)) < 5000
// die linke seite bezieht sich immer auf die datenquelle
