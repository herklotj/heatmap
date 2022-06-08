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
    sql: round(${TABLE}.breakdown_prop,2) ;;
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

  dimension: ws_claims {
    type:  number
    sql: coalesce(${TABLE}.ws_claims,0) ;;
  }

  dimension: nonfault_claims {
    type:  number
    sql: case when coalesce(${TABLE}.nonfault_claims,0) > 5 then 5 else coalesce(${TABLE}.nonfault_claims,0) end ;;
  }

  dimension: fault_claims {
    type:  number
    sql: coalesce(${TABLE}.fault_claims,0) ;;
  }

  dimension: all_claims {
    type:  number
    sql: case when coalesce(${TABLE}.all_claims,0) > 5 then 5 else coalesce(${TABLE}.all_claims,0) end ;;
  }

  dimension: convictions {
    type:  number
    sql: coalesce(${TABLE}.convictions,0) ;;
  }

  dimension: purchased_years_ago {
    type:  number
    sql: case when ${TABLE}.pya>15 then 15 else ${TABLE}.pya end ;;
  }

  dimension: manufactured_years_ago {
    type:  number
    sql: case when ${TABLE}.mya > 20 then 20 else ${TABLE}.mya end ;;
  }

  dimension: value {
    type:  string
    sql: ${TABLE}.value ;;
  }

  dimension: annual_mileage {
    type:  string
    sql: ${TABLE}.annual_mileage ;;
  }

  dimension: owner {
    type:  string
    sql: ${TABLE}.owner ;;
  }

  dimension: registered_keeper {
    type:  string
    sql: ${TABLE}.registered_keeper ;;
  }

  dimension: manufacturer {
    type:  string
    sql: case when ${TABLE}.manufacturer = 'CHEVROLET GMC' THEN 'CHEVROLET'
              WHEN ${TABLE}.manufacturer = '' THEN NULL
              WHEN ${TABLE}.manufacturer = 'LAND ROVER' THEN 'LANDROVER'
              WHEN ${TABLE}.manufacturer = 'LAND/RANGE ROVER' THEN 'LANDROVER'
              WHEN ${TABLE}.manufacturer = 'MERCEDES' THEN 'MERCEDES-BENZ'
              WHEN ${TABLE}.manufacturer = 'MERCEDES BENZ' THEN 'MERCEDES-BENZ'
              WHEN ${TABLE}.manufacturer = 'MG' THEN 'MG MOTOR UK'
              WHEN ${TABLE}.manufacturer = 'MG-MOTOR UK' THEN 'MG MOTOR UK'
              WHEN ${TABLE}.manufacturer = 'OTHERS' THEN NULL
              WHEN ${TABLE}.manufacturer = 'NISSAN / DATSUN' THEN 'NISSAN'
              WHEN ${TABLE}.manufacturer = 'SUBARU FORRESTER S' THEN 'SUBARU'
              WHEN ${TABLE}.manufacturer = 'TOYOTA YARIS 1.3' THEN 'TOYOTA'
              ELSE ${TABLE}.manufacturer END
              ;;
  }

  dimension: engine_size {
    type:  string
    sql: ${TABLE}.engine_size ;;
  }

  dimension: fuel_type {
    type:  string
    sql: ${TABLE}.fuel_type ;;
  }

  dimension: transmission {
    type:  string
    sql: ${TABLE}.transmission ;;
  }

  dimension: body_style {
    type:  string
    sql: ${TABLE}.body_style ;;
  }

  dimension: power_bhp {
    type:  string
    sql: ${TABLE}.power_bhp ;;
  }

  dimension: bhp_area_ratio {
    type:  number
    sql: ${TABLE}.bhp_area_ratio ;;
  }

  dimension: postal_region {
    type:  string
    sql: ${TABLE}.postal_region ;;
  }

  dimension: postal_area {
    type:  string
    sql: ${TABLE}.postal_area ;;
  }

  dimension: ecos1_s1_pi1_e1a011 {
    type:  number
    sql: ${TABLE}.ecos1_s1_pi1_e1a011 ;;
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
