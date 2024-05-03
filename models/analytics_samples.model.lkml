connection: "bq_conn_emergyspoc"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: analytics_samples_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: analytics_samples_default_datagroup

explore: cycle_hire {
  join: cycle_data{
    sql_on: ${cycle_hire.rental_id} = ${cycle_data.rental_id} ;;
    relationship: one_to_one
  }
}
