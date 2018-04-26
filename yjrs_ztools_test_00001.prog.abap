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
        lo_message_pool_rel_data TYPE REF TO ztl_cl_message_pool,

        lwa_bapireturn1 TYPE bapireturn1.

  lwa_bapireturn1-type = 'W'.
  lwa_bapireturn1-id = 'ZTOOLS'.
  lwa_bapireturn1-number = '001'.

  CREATE OBJECT lo_message_pool.

  CALL METHOD lo_message_pool->add_message_from_dynamic
    EXPORTING
      iv_message_data = lwa_bapireturn1.

  CREATE OBJECT lo_message_pool_rel_data.

  PERFORM validate_doc_group CHANGING lo_message_pool_rel_data.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form VALIDATE_DOC_GROUP
*&---------------------------------------------------------------------*
FORM validate_doc_group  CHANGING pc_message_pool_rel_data TYPE REF TO ztl_cl_message_pool.
  DATA: lo_message_pool_rel_data TYPE REF TO ztl_cl_message_pool.

  PERFORM validate_document CHANGING lo_message_pool_rel_data.

  CALL METHOD pc_message_pool_rel_data->add_message_from_dynamic
      EXPORTING
        iv_message_data           = lo_message_pool_rel_data
        iv_related_data           = 'GRP00001'.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form VALIDATE_DOCUMENT
*&---------------------------------------------------------------------*
FORM validate_document CHANGING pc_message_pool_rel_data TYPE REF TO ztl_cl_message_pool.
  DATA: lo_message_pool_rel_data TYPE REF TO ztl_cl_message_pool.

  IF NOT pc_message_pool_rel_data IS BOUND.
    CREATE OBJECT pc_message_pool_rel_data.
  ENDIF.

  DO 4 TIMES.
    CLEAR lo_message_pool_rel_data.

    PERFORM validate_pos USING sy-index
                      CHANGING lo_message_pool_rel_data.

    CALL METHOD pc_message_pool_rel_data->add_message_from_dynamic
      EXPORTING
        iv_message_data           = lo_message_pool_rel_data
        iv_related_data           = 'DOC00001'.
  ENDDO.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form VALIDATE_POS
*&---------------------------------------------------------------------*
FORM validate_pos  USING    pe_index
                   CHANGING pc_message_pool_rel_data TYPE REF TO ztl_cl_message_pool.
  DATA: lwa_bapireturn1 TYPE bapireturn1.

        lwa_bapireturn1-type = 'W'.
        lwa_bapireturn1-id = 'ZTOOLS'.
        lwa_bapireturn1-number = '001'.

  IF NOT pc_message_pool_rel_data IS BOUND.
    CREATE OBJECT pc_message_pool_rel_data.
  ENDIF.

  IF pe_index MOD 2 = 0.
    CALL METHOD pc_message_pool_rel_data->add_message_from_dynamic
    EXPORTING
      iv_message_data           = lwa_bapireturn1
      iv_related_data           = pe_index.
  ENDIF.
ENDFORM.
