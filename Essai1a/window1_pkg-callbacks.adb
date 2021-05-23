with System; use System;
with Glib; use Glib;
with Gdk.Event; use Gdk.Event;
with Gdk.Types; use Gdk.Types;
with Gtk.Accel_Group; use Gtk.Accel_Group;
with Gtk.Enums; use Gtk.Enums;
with Gtk.Style; use Gtk.Style;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Main;

package body Window1_Pkg.Callbacks is

   use Gtk.Arguments;

   ------------------------
   -- On_Button1_Clicked --
   ------------------------

   procedure On_Button1_Clicked
     (Object : access Gtk_Button_Record'Class)
   is
   begin
      Gtk.Main.Main_Quit;
   end On_Button1_Clicked;

   ------------------------
   -- On_Button2_Clicked --
   ------------------------

   procedure On_Button2_Clicked
     (Object : access Gtk_Button_Record'Class)
   is
      S : UTF8_String := Get_Text(Get_Window.Entry1);
      function Factorielle (N : Natural) return Positive is
         F : Positive := 1;
      begin
         for I in 2..N loop
            F := F * I;
         end loop;
         return F;
      end Factorielle;
   begin
      Set_Text(Get_Window.Entry1, Positive'Image(Factorielle(Natural'Value(S))));
   exception
      when others =>
         Set_Text(Get_Window.Entry1, "Erreur!");
   end On_Button2_Clicked;

   -----------------------------
   -- On_Window1_Delete_Event --
   -----------------------------

   function On_Window1_Delete_Event
     (Object : access Gtk_Widget_Record'Class;
      Params : Gtk.Arguments.Gtk_Args) return Boolean
   is
      Arg1 : Gdk_Event := To_Event (Params, 1);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end On_Window1_Delete_Event;

end Window1_Pkg.Callbacks;
