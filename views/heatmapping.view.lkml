view: heatmapping {
sql_table_name: aapricing.heatmap ;;


  dimension: ad_rated_area {
    type:  string
    sql: ${TABLE}.ad_rated_area ;;
  }


#  measure: quotes {
#    type: number
#    sql: sum(${quotes}) ;;
#  }#
#
#  measure: sales {
#    type: number
#    sql: sum(${sales}) ;;
#  }

  measure: conversion {
    type: number
    sql: sum(sales)/sum(quotes) ;;
    value_format: "0.00%"
  }


}
