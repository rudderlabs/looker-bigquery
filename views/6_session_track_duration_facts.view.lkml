view: session_track_duration_facts {
  derived_table: {
    sql_trigger_value: select count(*) from ${session_trk_facts.SQL_TABLE_NAME} ;;
    sql: SELECT s1.session_id as session_id
        , s1.looker_visitor_id as looker_visitor_id
        , cast(s1.session_start_at as timestamp) as session_start_at
        , cast(s2.ended_at as timestamp) as ended_at
      FROM ${sessions_trk.SQL_TABLE_NAME} AS s1, ${session_trk_facts.SQL_TABLE_NAME} s2
      WHERE s1.session_id = s2.session_id
       ;;
  }


  dimension: session_duration_minutes {
    type: number
    #sql: timestamp_diff(timestamp(${session_trk_facts.ended_time_time}), timestamp(${start_time}), MINUTE) ;;
    sql: timestamp_diff((${TABLE}.ended_at), (${TABLE}.session_start_at), MINUTE) ;;
  }

  dimension: session_id {
    type: string
    #sql: timestamp_diff(timestamp(${session_trk_facts.ended_time_time}), timestamp(${start_time}), MINUTE) ;;
    sql: ${TABLE}.session_id ;;
  }

  dimension: looker_visitor_id {
    type: string
    #sql: timestamp_diff(timestamp(${session_trk_facts.ended_time_time}), timestamp(${start_time}), MINUTE) ;;
    sql: ${TABLE}.looker_visitor_id ;;
  }

  measure: avg_session_duration_minutes {
    type: average
    sql: ${session_duration_minutes} ;;
    value_format_name: decimal_1
  }
}
