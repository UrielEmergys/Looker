view: cycle_data {
  derived_table: {
    sql:
      SELECT H.rental_id,
      I.latitude AS init_x,
      I.longitude AS init_y,
      F.latitude AS fin_x,
      F.longitude AS fin_y,
      SQRT(POW(F.longitude-I.longitude,2)+POW(F.latitude-I.latitude,2)) AS distance_btwn_stn

      FROM `Bicycle_GPS_Demo.cycle_hire` H

      LEFT JOIN `Bicycle_GPS_Demo.cycle_stations` I
      ON H.start_station_id = I.id

      LEFT JOIN `Bicycle_GPS_Demo.cycle_stations` F
      ON H.end_station_id = F.id
      ;;
  }
  dimension: rental_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.rental_id ;;
  }

  dimension: init_point {
    type: location
    sql_latitude: ${TABLE}.init_x ;;
    sql_longitude: ${TABLE}.init_y ;;
  }

  dimension: end_point {
    type: location
    sql_latitude: ${TABLE}.fin_x ;;
    sql_longitude: ${TABLE}.fin_y ;;
  }

  dimension:  distance_btwn_stn {
    type: number
    sql: ${TABLE}.distance_btwn_stn ;;
  }

  measure: Avg_traveled_distance {
    type: average
    sql: ${distance_btwn_stn} ;;
  }

  measure: Sum_avg_traveled_distance{
    type: sum
    sql: ${distance_btwn_stn} ;;
  }
}
