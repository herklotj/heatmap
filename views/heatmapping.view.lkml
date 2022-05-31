view: heatmapping {
sql_table_name: aapricing.heatmap ;;

###################### Dimensions ######################################

  dimension: ad_rated_area {
    type:  string
    sql: ${TABLE}.ad_rated_area ;;
  }

  dimension: tp_rated_area {
    type:  string
    sql: ${TABLE}.tp_rated_area ;;
  }

  dimension: pi_rated_area {
    type:  string
    sql: ${TABLE}.pi_rated_area ;;
  }

  dimension: ot_rated_area {
    type:  string
    sql: ${TABLE}.ot_rated_area ;;
  }

  dimension: ws_rated_area {
    type:  string
    sql: ${TABLE}.ws_rated_area ;;
  }

  dimension: ad_go_live_credit_score {
    type:  string
    sql: ${TABLE}.ad_go_live_credit_score ;;
  }

  dimension: tp_go_live_credit_score {
    type:  string
    sql: ${TABLE}.tp_go_live_credit_score ;;
  }

  dimension: pi_go_live_credit_score {
    type:  string
    sql: ${TABLE}.pi_go_live_credit_score ;;
  }

###################### Measures ######################################

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

  measure: Uncapped_LR {
    type: number
    sql: sum(${TABLE}.total_incurred)/sum(${TABLE}.eprem) ;;
    value_format: "0.0%"
  }

  measure: Capped_LR_50k {
    type: number
    sql: sum(${TABLE}.total_incurred_cap_50k)/sum(${TABLE}.eprem) ;;
    value_format: "0.0%"
  }

  measure: Capped_LR_25k{
    type: number
    sql: sum(${TABLE}.total_incurred_cap_25k)/sum(${TABLE}.eprem) ;;
    value_format: "0.0%"
  }

  measure: Exposure {
    type: sum
    sql: ${TABLE}.evy ;;
  }

  measure: Freq_exc_WS{
    type: number
    sql: sum(${TABLE}.total_count_exc_ws)/sum(${TABLE}.evy) ;;
    value_format: "0.00%"
  }

}
