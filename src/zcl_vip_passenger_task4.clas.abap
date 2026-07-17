CLASS zcl_vip_passenger_task4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vip_passenger_task4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TYPES :BEGIN OF ty_passenger,
         name type string,
         miles_flown TYPE i,
         membership_level type string,
         END OF ty_passenger.

    TYPES : BEGIN OF ty_vip,
         name             TYPE string,
         miles_flown      TYPE i,
         membership_level TYPE string,
         reward_status    TYPE string,
       END OF ty_vip.

       DATA : it_passenger TYPE TABLE of ty_passenger,
              it_viplist     TYPE TABLE of ty_vip.

        it_passenger = VALUE #(
 ( name = 'John' miles_flown = 70000 membership_level = 'Premium' )
 ( name = 'Sam'  miles_flown = 15000 membership_level = 'Gold' )
 ( name = 'Raj'  miles_flown = 5000  membership_level = 'Silver' )
 ( name = 'Tom'  miles_flown = 800   membership_level = 'Basic' )
).

out->write( 'value inserted successfullyy' ).

        it_viplist = value #(
        for ls_passenger in it_passenger
        where ( miles_flown > 1000 )
        ( name             = ls_passenger-name
   miles_flown      = ls_passenger-miles_flown
   membership_level = ls_passenger-membership_level
   reward_status =
     COND string(
       WHEN ls_passenger-miles_flown > 50000 THEN 'PLATINUM'
       WHEN ls_passenger-miles_flown > 10000 THEN 'GOLD'
       ELSE 'SILVER'
     )
      )
          ).

    " Display Output

    out->write( 'Test Output' ).

LOOP AT it_viplist INTO DATA(ls_vip).

out->write( |Records in VIP List: { lines( it_viplist ) }| ).

  out->write(
    |Name: { ls_vip-name } Miles: { ls_vip-miles_flown } Membership: { ls_vip-membership_level } Status: { ls_vip-reward_status }|
  ).

ENDLOOP.

ENDMETHOD.
ENDCLASS.
