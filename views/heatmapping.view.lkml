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

  dimension: leadtime {
    type:  number
    sql: ${TABLE}.leadtime ;;
  }

  dimension: ph_age {
    type:  number
    sql: ${TABLE}.ph_age ;;
  }

  dimension: max_age {
    type:  number
    sql: ${TABLE}.max_age ;;
  }

  dimension: min_age {
    type:  number
    sql: ${TABLE}.min_age ;;
  }

  dimension: min_ly {
    type:  number
    sql: ${TABLE}.min_ly ;;
  }

  dimension: num_not_full_uk_lic {
    type:  number
    sql: ${TABLE}.num_not_full_uk_lic ;;
  }

  dimension: ncd_years {
    type:  number
    sql: ${TABLE}.ncd_years ;;
  }

  dimension: num_unemployed {
    type:  number
    sql: ${TABLE}.num_unemployed ;;
  }

  dimension: num_drivers {
    type:  number
    sql: ${TABLE}.num_drivers ;;
  }

  dimension: num_not_res_since_birth {
    type:  number
    sql: ${TABLE}.num_not_res_since_birth ;;
  }

  dimension: breakdown_prop {
    type:  number
    sql: ${TABLE}.breakdown_prop ;;
  }

  dimension: scheme {
    type:  number
    sql: ${TABLE}.scheme ;;
  }

  dimension: driving_restriction {
    type:  string
    sql: ${TABLE}.dr ;;
  }

  dimension: business_use {
    type:  string
    sql: ${TABLE}.business_use ;;
  }

    dimension: sira {
      type:  string
      sql: ${TABLE}.sira ;;
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
    sql: (${sales}*1.00)/greatest(${quotes},1) ;;
    value_format: "0.00%"
  }

  measure: standardised_conversion {
    type: number
    sql: ((${sales}*1.00)/greatest(${quotes},1))/0.0107955180921991;;
    value_format: "0.00"
  }

  measure: Uncapped_LR {
    type: number
    sql: sum(${TABLE}.total_incurred)/greatest(sum(${TABLE}.eprem),1) ;;
    value_format: "0.0%"
  }

  measure: Capped_LR_50k {
    type: number
    sql: sum(${TABLE}.total_incurred_cap_50k)/greatest(sum(${TABLE}.eprem),1) ;;
    value_format: "0.0%"
  }

  measure: Standardised_Capped_LR_50k {
    type: number
    sql: (sum(${TABLE}.total_incurred_cap_50k)/greatest(sum(${TABLE}.eprem),1))/0.7423 ;;
    value_format: "0.00"
  }

  measure: Capped_LR_25k{
    type: number
    sql: sum(${TABLE}.total_incurred_cap_25k)/greatest(sum(${TABLE}.eprem),1) ;;
    value_format: "0.0%"
  }

  measure: Exposure {
    type: sum
    sql: ${TABLE}.evy ;;
    value_format: "0.0"
  }

  measure: Freq_exc_WS{
    type: number
    sql: sum(${TABLE}.total_count_exc_ws)/greatest(sum(${TABLE}.evy),1) ;;
    value_format: "0.00%"
  }

  measure: Heat{
    type: number
    sql: ${Standardised_Capped_LR_50k}*${standardised_conversion} ;;
    value_format: "0.00"
  }

}
