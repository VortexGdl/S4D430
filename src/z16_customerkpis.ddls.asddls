@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP-CDS-05'
define view entity Z16_CustomerKPIs with parameters p_city : abap.char(40)
as select from Z16_TravelWithCustomer
{
  key CustomerId,
   CustomerName,
   Street,
   PostalCode,
   City,
  sum( cast(TotalPrice as abap.dec(15, 2) ) ) + sum( cast(BookingFee as abap.dec(15,2))) as TotalRevenue,
  CurrencyCode,
  avg( cast( Duration as abap.int4 ) as abap.dec(15,2) ) as AverageDuration,
  count(distinct AgencyId) as NumberOfDifferentAgencys
 

}
where City = $parameters.p_city
group by 
CustomerId,
CustomerName,
Street,
PostalCode,
City,
CurrencyCode
having sum(TotalPrice) > 5000
