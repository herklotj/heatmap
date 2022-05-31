connection: "avalanche"

# include all the views
include: "/views/**/*.view"

datagroup: heatmapping_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: heatmapping_default_datagroup

explore: heatmapping {}
