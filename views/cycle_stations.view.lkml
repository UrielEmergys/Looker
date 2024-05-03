view: cycle_stations {
  sql_table_name: `Bicycle_GPS_Demo.cycle_stations` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: bikes_count {
    type: number
    sql: ${TABLE}.bikes_count ;;
  }
  dimension: docks_count {
    type: number
    sql: ${TABLE}.docks_count ;;
  }
  dimension_group: install {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.install_date ;;
  }
  dimension: installed {
    type: yesno
    sql: ${TABLE}.installed ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: locked {
    type: string
    sql: ${TABLE}.locked ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: nb_empty_docks {
    type: number
    sql: ${TABLE}.nbEmptyDocks ;;
  }
  dimension_group: removal {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.removal_date ;;
  }
  dimension: temporary {
    type: yesno
    sql: ${TABLE}.temporary ;;
  }
  dimension: terminal_name {
    type: string
    sql: ${TABLE}.terminal_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, terminal_name, name]
  }
}
