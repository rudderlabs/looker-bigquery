view: tracks_flow {
  derived_table: {
    sql: with derived_table as (
          select
            event_id,
            session_id,
            track_sequence_number,
            first_value(event IGNORE NULLS) over(partition by session_id order by track_sequence_number asc) as event,
            looker_visitor_id,
            timestamp,
            nth_value(event,2 IGNORE NULLS) over(partition by session_id order by track_sequence_number asc) as second_event,
            nth_value(event,3 IGNORE NULLS) over(partition by session_id order by track_sequence_number asc) as third_event,
            nth_value(event,4 IGNORE NULLS) over(partition by session_id order by track_sequence_number asc) as fourth_event,
            nth_value(event,5 IGNORE NULLS) over(partition by session_id order by track_sequence_number asc) as fifth_event,
            from ${track_facts.SQL_TABLE_NAME}
        )

          select event_id
            , session_id
            , track_sequence_number
            , event
            , looker_visitor_id
            , cast(timestamp as timestamp) as timestamp
            , second_event as event_2
            , third_event as event_3
            , fourth_event as event_4
            , fifth_event as event_5
      from derived_table a

       ;;
    sql_trigger_value: select count(*) from ${sessions_trk.SQL_TABLE_NAME} ;;
  }

  dimension: event_id {
    primary_key: yes
    sql: ${TABLE}.event_id ;;
    hidden: yes
  }

  dimension: session_id {
    hidden: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension: track_sequence_number {
    type: number
    hidden: yes
    sql: ${TABLE}.track_sequence_number ;;
  }

  dimension: event {
    #     hidden: true
    sql: ${TABLE}.event ;;
  }

  dimension: user_id {
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: timestamp {
    type: time
    datatype: datetime
    timeframes: [date, week, month, year]
    sql: cast(${TABLE}.timestamp as timestamp) ;;
  }

  dimension: event_2 {
    label: "2nd Event"
    sql: ${TABLE}.event_2 ;;
  }

  measure: event_1_count {
    type: count
  }

  measure: event_2_drop_off {
    label: "2nd Event Remaining Count"
    type: count

    filters: {
      field: event_2
      value: "-NULL"
    }
  }

  measure: event_2_3_dropoff_percent {
    value_format_name: percent_0
    type: number
    sql: cast(${event_3_drop_off} as float64)/cast(${event_2_drop_off} as float64) ;;
  }

  measure: event_3_4_dropoff_percent {
    value_format_name: percent_0
    type: number
    sql: ${event_4_drop_off}/${event_3_drop_off} ;;
  }

  dimension: event_3 {
    label: "3rd Event"
    sql: ${TABLE}.event_3 ;;
  }

  measure: event_3_drop_off {
    label: "3rd Event Remaining Count"
    type: count

    filters: {
      field: event_3
      value: "-NULL"
    }
  }

  dimension: event_4 {
    label: "4th Event"
    sql: ${TABLE}.event_4 ;;
  }

  measure: event_4_drop_off {
    label: "4th Event Remaining Count"
    type: count

    filters: {
      field: event_4
      value: "-NULL"
    }
  }

  dimension: event_5 {
    label: "5th Event"
    sql: ${TABLE}.event_5 ;;
  }

  measure: event_5_drop_off {
    label: "5th Event Remaining Count"
    type: count

    filters: {
      field: event_5
      value: "-NULL"
    }
  }

  set: detail {
    fields: [
      event_id,
      session_id,
      track_sequence_number,
      event,
      user_id,
      event_2,
      event_3,
      event_4,
      event_5
    ]
  }
}
