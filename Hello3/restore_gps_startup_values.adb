with Ada.Environment_Variables;
with Ada.Strings.Fixed;
procedure Restore_GPS_Startup_Values is
  procedure Internal_RGSV (Saved_Var_Name, Saved_Var_Value : String) is
     GPS_STARTUP : constant String  := "GPS_STARTUP_";
     Ind         : constant Natural :=
       Ada.Strings.Fixed.Index (Saved_Var_Name, GPS_STARTUP);
     Oringinal_Var_Name : constant String :=
       Saved_Var_Name (Ind + GPS_STARTUP'Length .. Saved_Var_Name'Last);
  begin
     if Ind > 0
       and then Ada.Environment_Variables.Exists (Oringinal_Var_Name)
     then
        if Saved_Var_Value /= "" then
           Ada.Environment_Variables.Set
             (Oringinal_Var_Name,
              Saved_Var_Value);
        else
           Ada.Environment_Variables.Clear (Oringinal_Var_Name);
        end if;
     end if;
  end Internal_RGSV;
begin
  Ada.Environment_Variables.Iterate (Internal_RGSV'Access);
end Restore_GPS_Startup_Values;
