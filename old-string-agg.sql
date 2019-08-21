SELECT [ChildrenCapacity],  abc = STUFF(
             (SELECT ',' + t1.[RoomNumber] 
              FROM {Room} t1
              WHERE t1.[ChildrenCapacity] = t2.[ChildrenCapacity]
              FOR XML PATH (''))
             , 1, 1, '') from {Room} t2
group by [ChildrenCapacity]; 

/*    SELECT cenas, 
           "1" + ', ' + "2" AS Product_List1,
           "1" + ', ' + "2" + ', ' + "3" AS Product_List2

    FROM (
            SELECT {Room}.[ChildrenCapacity] cenas,
                   {Room}.[RoomNumber] coiso, 
                   ROW_NUMBER() OVER (PARTITION BY {Room}.[ChildrenCapacity] ORDER BY {Room}.[RoomNumber])
            
            FROM {Room}
         )
         P ( cenas, coiso, seq )
         PIVOT ( MAX( coiso ) FOR seq IN ( "1", "2", "3") ) AS P_
    ;
*/
