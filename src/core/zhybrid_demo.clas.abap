CLASS zhybrid_demo DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS get_dependency_implementation IMPORTING dependency    TYPE data
                                          RETURNING VALUE(result) TYPE REF TO object
                                          RAISING no_implementation_found.
ENDCLASS.


CLASS zhybrid_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA dependency TYPE REF TO zhybrid_dependency_system_cp.

    TRY.
        dependency ?= get_dependency_implementation( dependency ).
        out->write( |System codepage: { dependency->get_system_codepage( ) }| ).
      CATCH no_implementation_found.
        out->write( 'No implementation found' ).
    ENDTRY.
  ENDMETHOD.

  METHOD get_dependency_implementation.
    CASE TYPE OF dependency.
      WHEN TYPE zhybrid_dependency_system_cp.
        DATA(tries) = 0.
        TRY.
            tries = tries + 1.
            CASE tries.
              WHEN 1.
                CREATE OBJECT result TYPE ('ZHYBRID_ONPREM_SYSTEM_CP').
              WHEN 2.
                CREATE OBJECT result TYPE ('ZHYBRID_CLOUD_SYSTEM_CP').
              WHEN OTHERS.
                RAISE EXCEPTION TYPE no_implementation_found.
            ENDCASE.
          CATCH cx_sy_create_object_error.
            RETRY.
        ENDTRY.
      WHEN OTHERS.
        RAISE EXCEPTION TYPE no_implementation_found.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
