with Glib;                        use Glib;
with Gtk.Object;                  use Gtk.Object;
with Gtk.Enums;                   use Gtk.Enums;
with Gtk.Main;
with Ada.Long_Long_Float_Text_IO;

with Gtk.GEntry;       use Gtk.GEntry;
with Gtk.Scale;        use Gtk.Scale;
with Gtk.Check_Button; use Gtk.Check_Button;
with Gtk.Label;        use Gtk.Label;

package body Window1_Callbacks is

   ------------------------
   -- On_Button1_Clicked --
   ------------------------

   procedure On_Button1_Clicked (Builder : access Gtkada_Builder_Record'Class) is
      pragma Unreferenced (Builder);
   begin
      Gtk.Main.Main_Quit;
   end On_Button1_Clicked;

   ------------------------
   -- On_Button2_Clicked --
   ------------------------

   procedure On_Button2_Clicked (Builder : access Gtkada_Builder_Record'Class) is
      S : constant UTF8_String := Get_Text (Gtk_Entry (Get_Widget (Builder, "entry1")));
      function Factorielle (N : Natural) return Long_Long_Integer is
         F : Long_Long_Integer := 1;
      begin
         for I in 2 .. N loop
            F := F * Long_Long_Integer (I);
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
         Ada.Long_Long_Float_Text_IO.Put
           (S,
            F,
            Integer (Gtk_Hscale (Get_Widget (Builder, "hscale1")).Get_Value),
            6);
         return S;
      end Factorielle;
   begin
      if Gtk_Check_Button (Get_Widget (Builder, "checkbutton1")).Get_Active then
         Set_Text
           (Gtk_Label (Get_Widget (Builder, "label3")),
            Long_Long_Integer'Image (Factorielle (Natural'Value (S))));
      else
         Set_Text (Gtk_Label (Get_Widget (Builder, "label3")), Factorielle (Natural'Value (S)));
      end if;
   exception
      when others =>
         Set_Text (Gtk_Label (Get_Widget (Builder, "label3")), "Erreur!");
   end On_Button2_Clicked;

   -----------------------------
   -- On_Window1_Delete_Event --
   -----------------------------

   function On_Window1_Delete_Event
     (Builder : access Gtkada_Builder_Record'Class)
      return    Boolean
   is
      pragma Unreferenced (Builder);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end On_Window1_Delete_Event;

end Window1_Callbacks;