@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP-CDS-03'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z16_TravelWithCustomer 
  as select from Z16_Customer as c

    inner join   Z16_Travel    as t
      on c.CustomerId = t.CustomerId
{

key t.TravelId,
t.AgencyId,
t.BeginDate,
t.EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
t.BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
t.TotalPrice,
t.CurrencyCode,
t.Description,
t.Status,
c.CustomerId,
c.FirstName,
c.LastName,
c.Title,
c.Street,
c.PostalCode,
c.City
}
