*"* use this source file for your ABAP unit test classes
CLASS ltcl_nept_qz_data_provider DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS available_quiz FOR TESTING RAISING cx_static_check.
    METHODS available_metrics FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_nept_qz_data_provider IMPLEMENTATION.

  METHOD available_quiz.

    CALL METHOD zcl_nept_qz_data_provider=>read_available_test
      IMPORTING
        et_db_tests = DATA(lt_db_tests).

    IF lt_db_tests IS INITIAL.
      cl_abap_unit_assert=>fail( 'No quiz content is available for the current user' ).
    ENDIF.

  ENDMETHOD.

  METHOD available_metrics.

    CALL METHOD zcl_nept_qz_data_provider=>read_available_metrics
      IMPORTING
        et_db_tests_key = DATA(lt_db_tests_key).

    IF lt_db_tests_key IS INITIAL.
      cl_abap_unit_assert=>fail( 'No metrics data is available for the current user' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
