@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'ABAP-CDS-03'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z16_TravelWithCustomer
  as select from Z16_Customer                     as c

    inner join   Z16_Travel                       as t
      on c.CustomerId = t.CustomerId

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS') as s
      on s.value_low = t.Status
      and s.language = $session.system_language
{
  key t.TravelId,

      t.AgencyId,
      t.BeginDate,
      t.EndDate,

      @EndUserText.label: 'Duration'
      @EndUserText.quickInfo: 'Duration'
      dats_days_between(t.BeginDate, t.EndDate) + 1            as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'

      currency_conversion(amount             => t.BookingFee,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'SET_TO_NULL') as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'

      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'SET_TO_NULL') as TotalPrice,

      cast('EUR' as abap.cuky)                                 as CurrencyCode,
      t.Description,
      t.Status,
      s.text                                                   as StatusText,

      c.CustomerId,

      @EndUserText.label: 'Full Name'
      @EndUserText.quickInfo: 'Full Name'
      case when c.Title is initial then concat_with_space(c.FirstName, c.LastName, 1)
      else concat_with_space(concat_with_space(c.Title, c.FirstName, 1), c.LastName, 1)
      end                                                      as CustomerName,

      c.Street,
      c.PostalCode,
      c.City
}

where c.CountryCode = 'DE'
