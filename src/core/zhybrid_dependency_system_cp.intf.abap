INTERFACE zhybrid_dependency_system_cp PUBLIC.
  TYPES codepage TYPE n LENGTH 4. " CPCODEPAGE

  METHODS get_system_codepage RETURNING VALUE(result) TYPE codepage.
ENDINTERFACE.
