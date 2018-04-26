CLASS yjrs_cl_dyncnv_00001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: ztl_i_dynamic_type_conversion.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS yjrs_cl_dyncnv_00001 IMPLEMENTATION.
  METHOD ztl_i_dynamic_type_conversion~convert.
    FIELD-SYMBOLS: <lwa_bapireturn1> TYPE bapireturn1,
                   <lwa_message_info> TYPE ztl_cl_message_pool=>t_message_info.

    ASSIGN iv_source TO <lwa_bapireturn1>.
    ASSIGN ev_destination TO <lwa_message_info>.

    IF <lwa_bapireturn1> IS ASSIGNED AND
       <lwa_message_info> IS ASSIGNED.
      <lwa_message_info>-type = <lwa_bapireturn1>-type.
      <lwa_message_info>-id = <lwa_bapireturn1>-id.
      <lwa_message_info>-number = <lwa_bapireturn1>-number.
      <lwa_message_info>-v1 = <lwa_bapireturn1>-message_v1.
      <lwa_message_info>-v2 = <lwa_bapireturn1>-message_v2.
      <lwa_message_info>-v3 = <lwa_bapireturn1>-message_v3.
      <lwa_message_info>-v4 = <lwa_bapireturn1>-message_v4.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
