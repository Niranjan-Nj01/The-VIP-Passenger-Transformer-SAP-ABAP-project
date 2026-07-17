The "VIP Passenger" Transformer
Concepts: Internal Tables, VALUE with FOR loop, and COND (Table Comprehension).
The Scenario: You have an internal table lt_passengers with: name, miles_flown, and membership_level.

The Task:
Without using a LOOP AT ... ENDLOOP, create a new internal table lt_vip_list using the VALUE #( FOR ... ) syntax.
Inside the loop, use COND to assign a new field reward_status:
 - If miles_flown > 50000, status is 'PLATINUM'.
 - If miles_flown > 10000, status is 'GOLD'.
 - Otherwise, status is 'SILVER'.
Filter the results during the comprehension so only passengers with more than 1,000 miles are included.


procedure 

creation of a class work all in a same class
creation of 2 different structure 
connect the structure with 2 different internal table
it_passenger to insert value and it_viplist to segregate the vip passenger.
