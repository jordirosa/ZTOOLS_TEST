*&---------------------------------------------------------------------*
*& Report yjrs_ztools_test_00001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yjrs_ztools_test_00001.

START-OF-SELECTION.
  PERFORM start_of_selection.

*&---------------------------------------------------------------------*
*& FORM start_of_selection
*&---------------------------------------------------------------------*
FORM start_of_selection.
  DATA: lo_message_pool TYPE REF TO ztl_cl_message_pool,

        lwa_bapireturn1 TYPE bapireturn1.

  lwa_bapireturn1-type = 'W'.
  lwa_bapireturn1-id = 'ZTOOLS'.
  lwa_bapireturn1-number = '001'.

  CREATE OBJECT lo_message_pool.

  CALL METHOD lo_message_pool->add_message_from_dynamic
    EXPORTING
      i_message_info = lwa_bapireturn1.
ENDFORM.
