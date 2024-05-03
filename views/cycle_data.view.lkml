view: cycle_data {
  derived_table: {
    sql:
      SELECT H.rental_id,
      I.latitude AS init_x,
      I.longitude AS init_y,
      F.latitude AS fin_x,
      F.longitude AS fin_y,
      SQRT(POW(F.longitude-I.longitude,2)+POW(F.latitude-I.latitude,2)) AS distance_traveled

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

  dimension: init_x {
    type: number
    sql:  ${TABLE}.init_x ;;
  }

  dimension: init_y {
    type:  number
    sql:  ${TABLE}.init_y ;;
  }

  dimension: fin_x {
    type: number
    sql: ${TABLE}.fin_x ;;
  }

  dimension:  fin_y {
    type:  number
    sql:  ${TABLE}.fin_y ;;
  }
}
