view: heatmapping {
sql_table_name: aapricing.heatmap ;;


  dimension: ad_rated_area {
    type:  string
    sql: ${TABLE}.ad_rated_area ;;
  }


  measure: quotes {
    type: sum
    sql: ${TABLE}.quotes ;;
  }

  measure: sales {
    type: sum
    sql: ${TABLE}.sales ;;
  }

  measure: conversion {
    type: number
    sql: sum(${TABLE}.sales)/sum(${TABLE}.quotes) ;;
    value_format: "0.00%"
  }


}
