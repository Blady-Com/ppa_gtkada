------------------------------------------------------------------------------
-- COPYRIGHT                        : (c) Pascal Pignard 2012-2013
-- LICENCE                          : CeCILL V2 (http://www.cecill.info)
-- CONTACT                          : http://blady.pagesperso-orange.fr
-----------------------------------------------------------------------------

with Glib;       use Glib;
with Gtk.Enums;  use Gtk.Enums;
with Gtk.Widget; use Gtk.Widget;
with Gtk.GEntry; use Gtk.GEntry;
-- units from Gtk
with Gtk.Main;       use Gtk.Main;

-- Ada predefined units
with Ada.Text_IO;    use Ada.Text_IO;

-- Application specific units

package body Window1_Callbacks  is

   -----------------------------------------------
   -- On_Window1_Delete_Event
   -----------------------------------------------

   function On_Window1_Delete_Event  (Builder : access Gtkada_Builder_Record'Class)
      return Boolean is
      pragma Unreferenced (Builder);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end On_Window1_Delete_Event;

   -----------------------------------------------
   -- On_Button1_Clicked
   -----------------------------------------------

   procedure On_Button1_Clicked (Builder : access Gtkada_Builder_Record'Class) is
      pragma Unreferenced (Builder);
   begin
      Gtk.Main.Main_Quit;
   end On_Button1_Clicked;

   -----------------------------------------------
   -- On_Button2_Clicked
   -----------------------------------------------

   procedure On_Button2_Clicked (Builder : access Gtkada_Builder_Record'Class) is
      S : constant UTF8_String := Get_Text(Gtk_Entry (Get_Object (Builder, "entry1")));
      function Factorielle (N : Natural) return Long_Long_Integer is
         F : Long_Long_Integer := 1;
      begin
         for I in 2 .. N loop
            F := F * Long_Long_Integer(I);
         end loop;
         return F;
      end Factorielle;
   begin
      Set_Text(Gtk_Entry (Get_Object (Builder, "entry1")),
         Long_Long_Integer'Image(Factorielle(Natural'Value(S))));
   exception
      when others =>
         Set_Text(Gtk_Entry (Get_Object (Builder, "entry1")), "Erreur!");
    end On_Button2_Clicked;


end Window1_Callbacks;

