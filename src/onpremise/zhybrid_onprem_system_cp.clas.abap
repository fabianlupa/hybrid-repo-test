CLASS zhybrid_onprem_system_cp DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zhybrid_dependency_system_cp.
ENDCLASS.


CLASS zhybrid_onprem_system_cp IMPLEMENTATION.
  METHOD zhybrid_dependency_system_cp~get_system_codepage.
    CALL FUNCTION 'SCP_GET_CODEPAGE_NUMBER'
      EXPORTING database_also = abap_false
      IMPORTING appl_codepage = result.
  ENDMETHOD.
ENDCLASS.
