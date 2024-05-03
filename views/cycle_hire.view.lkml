view: cycle_hire {
  sql_table_name: `Bicycle_GPS_Demo.cycle_hire` ;;

  dimension: bike_id {
    type: number
    sql: ${TABLE}.bike_id ;;
  }
  dimension: bike_model {
    type: string
    sql: ${TABLE}.bike_model ;;
  }
  dimension: duration {
    type: number
    description: "Duration of the bike trip in seconds."
    sql: ${TABLE}.duration ;;
  }
  dimension: duration_ms {
    type: number
    description: "Duration of the bike trip in milliseconds."
    sql: ${TABLE}.duration_ms ;;
  }
  dimension: duration_min {
    type:  number
    sql: ${duration}/60 ;;
  }
  dimension: duration_hrs {
    type:  number
    sql:  ${duration_min}/60 ;;
  }

  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_date ;;
  }
  dimension: end_station_id {
    type: number
    sql: ${TABLE}.end_station_id ;;
  }
  dimension: end_station_logical_terminal {
    type: number
    sql: ${TABLE}.end_station_logical_terminal ;;
  }
  dimension: end_station_name {
    type: string
    sql: ${TABLE}.end_station_name ;;
  }
  dimension: end_station_priority_id {
    type: number
    sql: ${TABLE}.end_station_priority_id ;;
  }
  dimension: rental_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.rental_id ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_date ;;
  }
  dimension: start_station_id {
    type: number
    sql: ${TABLE}.start_station_id ;;
  }
  dimension: start_station_logical_terminal {
    type: number
    sql: ${TABLE}.start_station_logical_terminal ;;
  }
  dimension: start_station_name {
    type: string
    sql: ${TABLE}.start_station_name ;;
  }
  measure: count_hired {
    type: count
    drill_fields: [start_station_name, end_station_name]
  }
  measure: average_duration_min {
    type: average
    sql:  ${duration_min} ;;
  }
}
