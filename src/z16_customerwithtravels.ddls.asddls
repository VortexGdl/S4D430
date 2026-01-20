@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP-CDS-07'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z16_CustomerWithTravels as select from Z16_Customer as c
association [0..*] to Z16_Travel as _Travel on _Travel.CustomerId = c.CustomerId
{
  key c.CustomerId,
  c.FirstName,
  c.LastName,
  c.Title,
  c.Street,
  c.PostalCode,
  c.City,
  
  _Travel
}
where c.CountryCode = 'DE'
