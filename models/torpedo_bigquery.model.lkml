connection: "torpedo_bigquery"

# include all the views
include: "/views/**/*.view"

include: "/dashboards/**/*.dashboard"

datagroup: torpedo_bigquery_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: torpedo_bigquery_default_datagroup

explore: tracks {}

explore: aliases_mapping {}

explore: mapped_tracks {}

explore: user_session_facts {}

explore: tracks_flow {}

explore: sessions_trk {
  join: session_trk_facts {
    view_label: "sessions"
    sql_on: ${sessions_trk.session_id} = ${session_trk_facts.session_id} ;;
    relationship: one_to_one
  }

  join: user_session_facts {
    view_label: "Users"
    sql_on: ${sessions_trk.looker_visitor_id} = ${user_session_facts.looker_visitor_id} ;;
    relationship: many_to_one
  }
}

explore: track_facts {
  view_label: "Events"
  label: "Events"

  join: tracks {
    view_label: "Events"
    type: left_outer
    relationship: one_to_one
    sql_on: tracks.timestamp = track_facts.timestamp and
      tracks.anonymous_id = track_facts.anonymous_id
       ;;
  }

  join: sessions_trk {
    view_label: "Sessions"
    type: left_outer
    sql_on: ${track_facts.session_id} = ${sessions_trk.session_id} ;;
    relationship: many_to_one
  }

  #     - join: accounts
  #       view_label: Sessions
  #       type: left_outer
  #       sql_on: ${track_facts.session_id} = ${sessions_trk.session_id}
  #       relationship: many_to_one

  join: session_trk_facts {
    view_label: "Sessions"
    type: left_outer
    sql_on: ${track_facts.session_id} = ${session_trk_facts.session_id} ;;
    relationship: many_to_one
  }

  join: user_session_facts {
    view_label: "Users"
    type: left_outer
    sql_on: ${track_facts.looker_visitor_id} = ${user_session_facts.looker_visitor_id} ;;
    relationship: many_to_one
  }


  join: tracks_flow {
    view_label: "Events Flow"
    sql_on: ${track_facts.event_id} = ${tracks_flow.event_id} ;;
    relationship: one_to_one
  }
}



# explore: 3_day_churn {}

# explore: 3_day_churn_all_features {}

# explore: 3_day_churn_all_features_predict_output_1 {
#   join: 3_day_churn_all_features_predict_output_1__predicted_within_3_days_probs {
#     view_label: "3day Churn All Features Predict Output 1: Predicted Within 3 Days Probs"
#     sql: LEFT JOIN UNNEST(${3_day_churn_all_features_predict_output_1.predicted_within_3_days_probs}) as 3_day_churn_all_features_predict_output_1__predicted_within_3_days_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: 3_day_churn_coin_balance {}

# explore: 3_day_churn_evt_cnt {}

# explore: 3_day_churn_extended {}

# explore: 3_day_churn_extended_with_coin_balance {}

# explore: 3_day_churn_model_all_features_input_1 {}

# explore: 3_day_churn_model_all_features_input_1_large {}

# explore: 3_day_churn_model_all_features_input_1_new {}

# explore: 3_day_churn_model_all_features_predict_input_1 {}

# explore: 3_day_churn_model_input_1 {}

# explore: 3_day_churn_model_input_1_with_coin_balance {}

# explore: 3_day_churn_model_predict_input_1 {}

# explore: 3_day_churn_model_with_coin_balance_predict_input_1 {}

# explore: 3_day_churn_predict_output_1 {
#   join: 3_day_churn_predict_output_1__predicted_within_3_days_probs {
#     view_label: "3day Churn Predict Output 1: Predicted Within 3 Days Probs"
#     sql: LEFT JOIN UNNEST(${3_day_churn_predict_output_1.predicted_within_3_days_probs}) as 3_day_churn_predict_output_1__predicted_within_3_days_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: 3_day_churn_with_coin_balance_predict_output_1 {
#   join: 3_day_churn_with_coin_balance_predict_output_1__predicted_within_3_days_probs {
#     view_label: "3day Churn With Coin Balance Predict Output 1: Predicted Within 3 Days Probs"
#     sql: LEFT JOIN UNNEST(${3_day_churn_with_coin_balance_predict_output_1.predicted_within_3_days_probs}) as 3_day_churn_with_coin_balance_predict_output_1__predicted_within_3_days_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: 3day_churn_output_dates {}

# explore: 3day_churn_probabilty_output {}

# explore: auto_spin_selection {}

# explore: auto_tbl_3_day_churn {}

# explore: auto_tbl_3_day_churn_extended {}

# explore: auto_tbl_3_day_churn_model_building_input {}

# explore: auto_tbl_7_day_churn {}

# explore: auto_tbl_7_day_churn_extended {}

# explore: auto_tbl_7_day_churn_model_building_input {}

# explore: auto_tbl_churn_base_till_7_days_back {}

# explore: auto_tbl_cnt_evt_by_usr_3_day_churn {}

# explore: auto_tbl_cnt_evt_by_usr_7_day_churn {}

# explore: auto_tbl_coin_balance_3_day_churn {}

# explore: auto_tbl_coin_balance_7_day_churn {}

# explore: auto_tbl_fe_11_0_7 {}

# explore: auto_tbl_fe_11_21_1000 {}

# explore: auto_tbl_fe_11_day_churn {}

# explore: auto_tbl_fe_11_day_churn_bucket_0_7 {}

# explore: auto_tbl_fe_11_day_churn_bucket_21_1000 {}

# explore: auto_tbl_fe_15_0_7 {}

# explore: auto_tbl_fe_15_1_7 {}

# explore: auto_tbl_fe_15_21_1000 {}

# explore: auto_tbl_fe_15_8_14 {}

# explore: auto_tbl_fe_15_day_churn {}

# explore: auto_tbl_fe_15_day_churn_bucket_0_7 {}

# explore: auto_tbl_fe_15_day_churn_bucket_1_7 {}

# explore: auto_tbl_fe_15_day_churn_bucket_21_1000 {}

# explore: auto_tbl_fe_15_day_churn_bucket_8_14 {}

# explore: auto_tbl_fe_3_0_3_cn {}

# explore: auto_tbl_fe_3_0_3_cp {}

# explore: auto_tbl_fe_3_day_churn_cn {}

# explore: auto_tbl_fe_3_day_churn_cp {}

# explore: auto_tbl_first_rev {}

# explore: auto_tbl_first_spin {}

# explore: auto_tbl_game_count_by_id {}

# explore: auto_tbl_last_spin {}

# explore: auto_tbl_revenue {}

# explore: auto_tbl_revenue_till_cutoff {}

# explore: batch_error {}

# explore: battle_disconnected {}

# explore: battle_end {}

# explore: battle_match_making {}

# explore: battle_player_spins_ended {}

# explore: battle_reconnected {}

# explore: battle_redeem {}

# explore: battle_send_emote {}

# explore: battle_spin_result {}

# explore: battle_view_opponent_profile {}

# explore: bingo_reward_claim_event {}

# explore: booking_success {}

# explore: bundle_load_error {}

# explore: buy_product_click {}

# explore: casino_game_load_time {}

# explore: churn {}

# explore: claim_tournament_reward {}

# explore: clan_creation {}

# explore: clan_revenue_share {}

# explore: close_high_roller_room {}

# explore: custom_churn_predict {
#   join: custom_churn_predict__predicted_within_1_week_probs {
#     view_label: "Custom Churn Predict: Predicted Within 1 Week Probs"
#     sql: LEFT JOIN UNNEST(${custom_churn_predict.predicted_within_1_week_probs}) as custom_churn_predict__predicted_within_1_week_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: custom_churn_predict_2 {
#   join: custom_churn_predict_2__predicted_within_1_week_probs {
#     view_label: "Custom Churn Predict 2: Predicted Within 1 Week Probs"
#     sql: LEFT JOIN UNNEST(${custom_churn_predict_2.predicted_within_1_week_probs}) as custom_churn_predict_2__predicted_within_1_week_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: custom_churn_predict_3 {
#   join: custom_churn_predict_3__predicted_within_1_week_probs {
#     view_label: "Custom Churn Predict 3: Predicted Within 1 Week Probs"
#     sql: LEFT JOIN UNNEST(${custom_churn_predict_3.predicted_within_1_week_probs}) as custom_churn_predict_3__predicted_within_1_week_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: custom_churn_predict_for_week_2 {
#   join: custom_churn_predict_for_week_2__predicted_within_2_week_probs {
#     view_label: "Custom Churn Predict For Week 2: Predicted Within 2 Week Probs"
#     sql: LEFT JOIN UNNEST(${custom_churn_predict_for_week_2.predicted_within_2_week_probs}) as custom_churn_predict_for_week_2__predicted_within_2_week_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: custom_input_view {}

# explore: custom_input_view_2 {}

# explore: custom_input_view_3 {}

# explore: custom_input_view_rev {}

# explore: daily_rewards_claim {}

# explore: deep_link_rewarded {}

# explore: feature_game_selection {}

# explore: game_init_time {}

# explore: help_button_click_event {}

# explore: hyper_bonus_cancel {}

# explore: hyper_bonus_click {}

# explore: hyper_bonus_purchase {}

# explore: inbox_message_click {}

# explore: input_view {}

# explore: lobby_fps {}

# explore: new_1_week_churn_fsfp {}

# explore: new_1_week_churn_model_input_1 {}

# explore: new_1_week_churn_predict {
#   join: new_1_week_churn_predict__predicted_label_probs {
#     view_label: "New 1week Churn Predict: Predicted Label Probs"
#     sql: LEFT JOIN UNNEST(${new_1_week_churn_predict.predicted_label_probs}) as new_1_week_churn_predict__predicted_label_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: new_1_week_churn_predict_input {}

# explore: new_1_week_churn_tbl_first_rev {}

# explore: new_1_week_churn_tbl_first_spin {}

# explore: new_1_week_churn_tbl_last_spin {}

# explore: not_enough_credit {}

# explore: offer_buy_click {}

# explore: offer_dismiss_click {}

# explore: offer_displayed {}

# explore: open_high_roller_room {}

# explore: open_leaderboard {}

# explore: open_loyalty_rewards {}

# explore: open_tournaments {}

# explore: out_of_sync_spin_event {}

# explore: player_home_load_time {}

# explore: player_level_up {}

# explore: push_notification_click {}

# explore: push_notification_received {}

# explore: quest_button_click {}

# explore: quest_claim {}

# explore: quest_item_claim {}

# explore: quest_time_expired {}

# explore: rate_us_popup_click_later {}

# explore: rate_us_popup_click_rate {}

# explore: rate_us_popup_shown {}

# explore: resume_game_invoked {}

# explore: rev_input_view {}

# explore: revenue {}

# explore: rudder_staging_auto_spin_selection_b5a123e1_0d1f_4878_a188_e97eb3ef9c93 {}

# explore: rudder_staging_batch_error_7a82e90b_a307_4459_a138_2f1dd90f3149 {}

# explore: rudder_staging_battle_disconnected_26952db7_91a2_449c_8f55_beb0108bce25 {}

# explore: rudder_staging_battle_end_f9596e94_fe1e_4ad3_bbbe_235bd810f0d0 {}

# explore: rudder_staging_battle_match_making_211d05db_a0b7_4c0b_9a6a_82a3a5490dd5 {}

# explore: rudder_staging_battle_player_spins_ended_c9034d65_6478_4f69_9935_3419c9026ab6 {}

# explore: rudder_staging_battle_reconnected_16f779a5_48f1_405b_a01f_7a76cb2ce1ca {}

# explore: rudder_staging_battle_send_emote_12059f5c_8a53_4273_9cc7_23fc2a6a19ff {}

# explore: rudder_staging_battle_spin_result_6ada4e8c_da80_4a9f_bf0f_2a336de27315 {}

# explore: rudder_staging_battle_view_opponent_profile_b11b900c_1201_43f9_944f_5f0d08a8eb3d {}

# explore: rudder_staging_bingo_reward_claim_event_c595e356_ad17_4854_a4ff_0eef5440320a {}

# explore: rudder_staging_booking_success_bc23f413_c9c7_40c2_87a6_5d14d25c9d42 {}

# explore: rudder_staging_buy_product_click_193729fa_192b_4754_98ce_0373c91053fd {}

# explore: rudder_staging_casino_game_load_time_b3d37488_6480_4c1c_81c8_3c0d0324f129 {}

# explore: rudder_staging_claim_tournament_reward_4c76ebdd_78cf_40b5_8f93_ced2b0c1159e {}

# explore: rudder_staging_close_high_roller_room_e4bd3a2b_4ba0_4b4e_94bd_4eaf7b2b4612 {}

# explore: rudder_staging_daily_rewards_claim_5ea75e81_21a8_4efc_918f_e0d106b87196 {}

# explore: rudder_staging_deep_link_rewarded_8332b15e_85de_4ab4_ac05_41fa27595535 {}

# explore: rudder_staging_feature_game_selection_53126909_7bc1_4958_90b7_5d785d840d45 {}

# explore: rudder_staging_game_init_time_6ddd8cb0_b3e9_488e_9a15_a13ff151adab {}

# explore: rudder_staging_help_button_click_event_7b422353_040f_4d45_97d6_d1746c095213 {}

# explore: rudder_staging_hyper_bonus_cancel_3da96a4c_1c0b_4eec_bc77_f51807961f0e {}

# explore: rudder_staging_hyper_bonus_click_91139a96_3c4b_4682_8271_710756ada561 {}

# explore: rudder_staging_hyper_bonus_purchase_c58a5883_cf52_4aba_a87b_04e7487eb003 {}

# explore: rudder_staging_inbox_message_click_3c84379b_09d7_47cc_8697_cac661f456c6 {}

# explore: rudder_staging_lobby_fps_dbc87137_2d61_4d78_add0_b14eec863df6 {}

# explore: rudder_staging_not_enough_credit_849542eb_115d_428c_b1f2_d5e88f828c67 {}

# explore: rudder_staging_offer_buy_click_da754d8e_5ab7_4e45_8e31_72c62c621cb8 {}

# explore: rudder_staging_offer_dismiss_click_6274e5d3_f1a8_4031_a83e_76736fe5273a {}

# explore: rudder_staging_offer_displayed_46adba13_b1d9_4a3b_9672_07e55d964873 {}

# explore: rudder_staging_open_high_roller_room_71cd4497_202b_4fbf_9304_e796e229e86b {}

# explore: rudder_staging_open_leaderboard_ca908838_1b5e_434c_91ee_9decfdf73a48 {}

# explore: rudder_staging_open_loyalty_rewards_a6ba3a8a_44a9_4721_9433_0271c6605142 {}

# explore: rudder_staging_open_tournaments_af0ac72f_90ff_4de0_aa5a_997994e3fbce {}

# explore: rudder_staging_out_of_sync_spin_event_975f4f2a_9d4d_45fe_99fb_5036e19508b6 {}

# explore: rudder_staging_player_home_load_time_4f36bf3f_4ab1_41d8_bbb8_29968f17d735 {}

# explore: rudder_staging_player_level_up_6f1ef33a_15ee_47cc_a789_ef5f7f765ec5 {}

# explore: rudder_staging_push_notification_click_7f752590_187b_417e_9bed_7c9b24af0f3f {}

# explore: rudder_staging_push_notification_received_bb674d3f_9359_4f58_8181_833eb0466986 {}

# explore: rudder_staging_quest_button_click_964c123a_7c7f_4eb5_8991_5be837d3183e {}

# explore: rudder_staging_quest_claim_e2326b56_0c6d_4733_8e92_5532f576ce31 {}

# explore: rudder_staging_quest_item_claim_ac518502_c246_41f4_89c1_41671eef1932 {}

# explore: rudder_staging_quest_time_expired_2e74b798_175a_4a0a_98b0_f1bacf5d3a8f {}

# explore: rudder_staging_rate_us_popup_click_later_d639cea3_2f06_4ac2_81ab_d7e2d6cd2bcb {}

# explore: rudder_staging_rate_us_popup_click_rate_95baa462_5550_4192_aa68_5e72b41d3408 {}

# explore: rudder_staging_rate_us_popup_shown_e301626e_c0de_4f78_bbab_3d899a62f1b1 {}

# explore: rudder_staging_resume_game_invoked_13a8ee14_2bc1_472f_ab24_79bc9bd7d400 {}

# explore: rudder_staging_revenue_9b7c44bd_1995_4777_8fe5_07e4afcfd150 {}

# explore: rudder_staging_sent_gift_ef94518f_6df8_4d5c_a1a9_d34aa5d4f0bc {}

# explore: rudder_staging_server_response_error_11a7ae3f_6dcd_49ee_b7af_d092edcebb52 {}

# explore: rudder_staging_service_method_time_a467f481_ecb4_4ef5_a85d_a2da7da954f4 {}

# explore: rudder_staging_settings_view_closed_8c2741b1_120c_4c7c_abbc_d0b492f44b84 {}

# explore: rudder_staging_spin_result_678753b8_b46b_4410_b429_9df708a8e6f7 {}

# explore: rudder_staging_store_open_76e118e8_a86d_450a_895d_ebdd578cd85e {}

# explore: rudder_staging_sync_state_error_event_1d1d6dbf_0f74_4faf_84c4_51cb8a08c1c9 {}

# explore: rudder_staging_tracks_efd01524_562d_42e7_a799_2fef0bb04613 {}

# explore: sent_gift {}

# explore: server_response_error {}

# explore: service_method_time {}

# explore: settings_view_closed {}

# explore: spin_result {}

# explore: staging_auto_spin_selection_bbe552f0_1052_4162_b48d_15a74a055fe8 {}

# explore: staging_batch_error_c678d7a9_d209_439d_abb1_9a514a4a49a1 {}

# explore: staging_battle_disconnected_5c59bd9b_f2f9_4a41_8dd3_0cb55ea452f8 {}

# explore: staging_battle_disconnected_6e473dbe_a77d_4957_b4ed_dc650af15041 {}

# explore: staging_battle_end_e65e6620_a456_4c2f_bb20_f2883b032bb8 {}

# explore: staging_battle_match_making_48fbf024_4d78_44bf_95e8_965f07d6b976 {}

# explore: staging_battle_match_making_4c116e8a_f3a9_4cc6_964b_5ff4f030d8ff {}

# explore: staging_battle_player_spins_ended_f7ca38b1_0cd9_44e2_9ab6_cdf745134989 {}

# explore: staging_battle_reconnected_0220ea03_18a6_482d_83df_a76678349063 {}

# explore: staging_battle_reconnected_cc4ab6ac_ecce_4cad_8f41_c9245d5d229c {}

# explore: staging_battle_send_emote_fc0b5038_1f44_4092_be3a_b1793fdea25a {}

# explore: staging_battle_spin_result_99d384ce_4f08_449c_b2a9_751f8880019b {}

# explore: staging_battle_view_opponent_profile_15d3fb7f_cab9_4465_b65c_fac6ef190a5f {}

# explore: staging_bingo_reward_claim_event_2ccce035_36e6_4948_8612_07f33df4bca6 {}

# explore: staging_bingo_reward_claim_event_39ab25c0_1617_4ec5_9746_0e372cc3bf31 {}

# explore: staging_bundle_load_error_84a05f10_83ad_4033_b760_a562bbf6d530 {}

# explore: staging_buy_product_click_7201d6d9_c45f_4288_81f7_b018656e4ca5 {}

# explore: staging_casino_game_load_time_54d25fce_d97d_4b8d_a7cf_50730109678d {}

# explore: staging_claim_tournament_reward_1dfb3e24_fdca_4855_82bc_c7b1fc910c3b {}

# explore: staging_claim_tournament_reward_80b1f02d_4e6c_4cff_8314_e3c2165387d3 {}

# explore: staging_close_high_roller_room_04beac37_e788_43fe_9427_16c46bad348d {}

# explore: staging_close_high_roller_room_944481da_3b73_4281_a612_6101d78172fb {}

# explore: staging_daily_rewards_claim_fbe71ddc_874f_4917_b68d_bdfe8a62e50a {}

# explore: staging_deep_link_rewarded_61c15254_7e9f_4a3c_bd3e_4e11507f1399 {}

# explore: staging_feature_game_selection_50ffc97b_097c_4a35_b3a4_ba95a8bcaf49 {}

# explore: staging_game_init_time_40b542bc_f5a9_4061_89c5_6c8434726ef0 {}

# explore: staging_game_init_time_b435b206_b272_4dba_bada_42b3452822c5 {}

# explore: staging_help_button_click_event_9882334b_ebc9_4d50_b3bc_e8110a9d537e {}

# explore: staging_hyper_bonus_cancel_b941ded7_e770_4b62_97b1_7f5e943bab22 {}

# explore: staging_hyper_bonus_click_7340d902_81c4_4ac0_ad6c_b6ea45bcde77 {}

# explore: staging_hyper_bonus_click_9754b55a_56d9_4260_be3b_beb6413ffd13 {}

# explore: staging_hyper_bonus_purchase_c7fb5ff6_07f6_492c_84ee_602c4f24b49f {}

# explore: staging_inbox_message_click_d5dac456_3dbe_45e0_a65c_b6965b92b3ed {}

# explore: staging_lobby_fps_b94084a8_1fc4_4125_b250_281aa8b30feb {}

# explore: staging_not_enough_credit_875169a7_6f57_4d68_a6fe_52e0503d02d7 {}

# explore: staging_offer_buy_click_92b48fbd_eb00_4194_8fe2_e4ee049d5ebe {}

# explore: staging_offer_dismiss_click_f27f1a67_e213_41cd_97a6_81da75a9fd23 {}

# explore: staging_offer_displayed_f8d0bd1c_dfdd_45cf_8d4e_fbc27075aa9c {}

# explore: staging_open_high_roller_room_6aa9b7cb_a6dd_432c_99bd_a6b2153a0171 {}

# explore: staging_open_leaderboard_0ced4f29_e2b3_42a5_af1e_f70991b488f0 {}

# explore: staging_open_leaderboard_d1988d30_ea0a_4fd9_bbd5_ac196b88e7c9 {}

# explore: staging_open_loyalty_rewards_be1f04aa_5b52_4109_aaa9_586279329446 {}

# explore: staging_open_tournaments_9b08a923_86dd_40a0_b094_4f3cb336169f {}

# explore: staging_player_home_load_time_4ac6f4d2_5819_44c7_bcad_21e6c5253eae {}

# explore: staging_player_level_up_e4b9cefe_9551_4547_8473_0ed9417d916e {}

# explore: staging_push_notification_click_d5402015_2096_4b7f_9bb9_15448f344101 {}

# explore: staging_push_notification_received_4581a16d_c0aa_425f_98c5_23a8ae1f159b {}

# explore: staging_push_notification_received_e4f6f4e4_e2e4_4800_889d_c6170c44f53f {}

# explore: staging_quest_button_click_2b6f9041_4b5b_4542_ac7c_45c2db631e55 {}

# explore: staging_quest_button_click_a2505a59_d0bf_4fb5_96af_997b0fdf1aea {}

# explore: staging_quest_button_click_e8e3a065_f341_44cc_bbad_8faf53ced988 {}

# explore: staging_quest_claim_9e66b807_21db_4c93_b8c4_76adef093501 {}

# explore: staging_quest_item_claim_63fe89c6_efe7_463f_b3c3_c9b50af681e5 {}

# explore: staging_quest_time_expired_fe4a3343_f8bf_4491_9fd0_a01a505135a0 {}

# explore: staging_rate_us_popup_click_later_31bed725_4904_4c37_96e6_18edf00b1d8f {}

# explore: staging_rate_us_popup_click_rate_39e183ba_472e_4d61_828d_b0429314f669 {}

# explore: staging_rate_us_popup_shown_6b9de2f2_9c84_45bd_afab_d2101e5507b5 {}

# explore: staging_resume_game_invoked_8ab07d2e_484e_4e5b_9fc9_9365521a5af6 {}

# explore: staging_resume_game_invoked_f291fa51_91e4_4c18_a919_33949753c7d6 {}

# explore: staging_revenue_8f2ebfcc_7f62_46d8_a98c_661fa25726b6 {}

# explore: staging_revenue_e2480daa_a98a_4b2c_9fa1_a56a69bf4911 {}

# explore: staging_server_response_error_dbbc44f7_c6b3_4f11_a3fb_3d74a15d5cf4 {}

# explore: staging_settings_view_closed_b1f9cb04_1bc9_418f_a184_e24d938c3690 {}

# explore: staging_spin_result_09254e45_9d38_4d0e_ab57_421c277fcab0 {}

# explore: staging_spin_result_136fa460_8e07_4ef0_b999_2696b1d0f68e {}

# explore: staging_store_open_62947c44_7f06_4b13_b8ad_3f7a2724dead {}

# explore: staging_sync_state_error_event_315e9bac_5c7c_4cc0_921e_70b01de73b08 {}

# explore: staging_sync_state_error_event_bc74ebfd_7e1e_47c6_ad47_1d032427f819 {}

# explore: staging_tracks_844fde2e_a17b_4363_91e2_0682c9d13074 {}

# explore: store_open {}

# explore: sync_state_error_event {}

# explore: tbl_churn_extended {}

# explore: tbl_churn_extended_2 {}

# explore: tbl_cnt_evt_by_usr {}

# explore: tbl_count_drc {}

# explore: tbl_count_drc_rev {}

# explore: tbl_count_hbc {}

# explore: tbl_count_hbc_rev {}

# explore: tbl_count_hbp {}

# explore: tbl_count_hbp_rev {}

# explore: tbl_count_odc {}

# explore: tbl_count_odc_rev {}

# explore: tbl_count_qbc {}

# explore: tbl_count_qbc_rev {}

# explore: tbl_eod_coin_balance {}

# explore: tbl_evt_cnt_by_user {}

# explore: tbl_revenue_model {}

# explore: tbl_revenue_model_prediction {
#   join: tbl_revenue_model_prediction__predicted_target_column_probs {
#     view_label: "Tbl Revenue Model Prediction: Predicted Target Column Probs"
#     sql: LEFT JOIN UNNEST(${tbl_revenue_model_prediction.predicted_target_column_probs}) as tbl_revenue_model_prediction__predicted_target_column_probs ;;
#     relationship: one_to_many
#   }
# }

# explore: tbl_total_bet_win_spin_per_game_per_paying_user {}

# explore: temp_custom_tbl {}

# explore: temp_table_for_rev {}

# explore: total_bet_win_spin_per_game_per_non_paying_user {}

# explore: tracks_backup {}
