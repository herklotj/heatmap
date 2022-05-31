view: heatmap {
    sql_table_name: aapricing.heatmap ;;


  dimension: ad_rated_area {
    type:  string
    sql: ${TABLE}.ad_rated_area ;;
  }


   measure: quotes {
     type: sum
     sql: ${quotes} ;;
   }

measure: sales {
  type: sum
  sql: ${sales} ;;
}

measure: conversion {
  type: number
  sql: sum(sales)/sum(quotes) ;;
  value_format: "0.00%"
}


}
