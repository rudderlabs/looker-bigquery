- dashboard: event_analytics
  title: Event Analytics
  layout: newspaper
  elements:
  - title: Top 50 Events by User Count
    name: Top 50 Events by User Count
    model: torpedo_bigquery
    explore: track_facts
    type: looker_pie
    fields: [track_facts.event, track_facts.count_visitors]
    sorts: [track_facts.count_visitors desc]
    limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    row: 0
    col: 11
    width: 9
    height: 8
  - title: Top 50 Events by Occurrence
    name: Top 50 Events by Occurrence
    model: torpedo_bigquery
    explore: track_facts
    type: looker_pie
    fields: [track_facts.event, tracks.count]
    sorts: [tracks.count desc]
    limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 11
    height: 8
  - title: Top 100 Users by Event Count
    name: Top 100 Users by Event Count
    model: torpedo_bigquery
    explore: track_facts
    type: looker_bar
    fields: [track_facts.looker_visitor_id, tracks.count]
    sorts: [tracks.count desc]
    limit: 100
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    row: 8
    col: 0
    width: 11
    height: 8
  - title: Top 100 Users by Session Duration
    name: Top 100 Users by Session Duration
    model: torpedo_bigquery
    explore: track_facts
    type: looker_grid
    fields: [sessions_trk.looker_visitor_id, sessions_trk.session_duration_minutes]
    sorts: [sessions_trk.session_duration_minutes desc]
    limit: 100
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 8
    col: 11
    width: 9
    height: 8