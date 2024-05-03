connection: "bq_conn_emergyspoc"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: analytics_samples_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: analytics_samples_default_datagroup

explore: cycle_hire {
  join:  cycle_stations {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cycle_hire.start_station_id} = ${cycle_stations.id} OR
      ${cycle_hire.end_station_id = ${cycle_stations.id}};;
  }
}
