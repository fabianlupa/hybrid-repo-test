CLASS zhybrid_cloud_system_cp DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zhybrid_dependency_system_cp.
ENDCLASS.


CLASS zhybrid_cloud_system_cp IMPLEMENTATION.
  METHOD zhybrid_dependency_system_cp~get_system_codepage.
    result = cl_abap_conv_codepage=>get_sap_codepage( ).
  ENDMETHOD.
ENDCLASS.
