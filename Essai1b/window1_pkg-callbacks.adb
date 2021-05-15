with System;                      use System;
with Glib;                        use Glib;
with Gdk.Event;                   use Gdk.Event;
with Gdk.Types;                   use Gdk.Types;
with Gtk.Accel_Group;             use Gtk.Accel_Group;
with Gtk.Object;                  use Gtk.Object;
with Gtk.Enums;                   use Gtk.Enums;
with Gtk.Style;                   use Gtk.Style;
with Gtk.Widget;                  use Gtk.Widget;
with Gtk.Main;
with Ada.Long_Long_Float_Text_IO;

package body Window1_Pkg.Callbacks is

   use Gtk.Arguments;

   ------------------------
   -- On_Button1_Clicked --
   ------------------------

   procedure On_Button1_Clicked (Object : access Gtk_Button_Record'Class) is
   begin
      Gtk.Main.Main_Quit;
   end On_Button1_Clicked;

   ------------------------
   -- On_Button2_Clicked --
   ------------------------

   procedure On_Button2_Clicked (Object : access Gtk_Button_Record'Class) is
      S : UTF8_String := Get_Text (Get_Window.Entry1);
      function Factorielle (N : Natural) return Long_Long_Integer is
         F : Long_Long_Integer := 1;
      begin
         for I in 2 .. N loop
            F := F * Long_Long_Integer(I);
         end loop;
         return F;
      end Factorielle;
      function Factorielle (N : Natural) return String is
         F : Long_Long_Float := 1.0;
         S : String (1 .. 20);
      begin
         for I in 2 .. N loop
            F := F * Long_Long_Float (I);
         end loop;
         Ada.Long_Long_Float_Text_IO.Put (S, F, Integer (Get_Window.Hscale1.Get_Value), 6);
         return S;
      end Factorielle;
   begin
      if Get_Window.Checkbutton1.Get_Active then
         Set_Text (Get_Window.Label3, Long_Long_Integer'Image (Factorielle (Natural'Value (S))));
      else
         Set_Text (Get_Window.Label3, Factorielle (Natural'Value (S)));
      end if;
   exception
      when others =>
         Set_Text (Get_Window.Label3, "Erreur!");
   end On_Button2_Clicked;

   -----------------------------
   -- On_Window1_Delete_Event --
   -----------------------------

   function On_Window1_Delete_Event
     (Object : access Gtk_Widget_Record'Class;
      Params : Gtk.Arguments.Gtk_Args)
      return   Boolean
   is
      Arg1 : Gdk_Event := To_Event (Params, 1);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end On_Window1_Delete_Event;

end Window1_Pkg.Callbacks;
