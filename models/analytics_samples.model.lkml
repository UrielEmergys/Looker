connection: "bq_conn_emergyspoc"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: analytics_samples_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: analytics_samples_default_datagroup

explore: cycle_hire {}

explore: cycle_stations {}

