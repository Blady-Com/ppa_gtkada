with Gtk.Main;
with Glib; use type Glib.Gdouble;
package body Hello_Callback is
   procedure Dessine (CR : Cairo.Cairo_Context) is
   begin
      Cairo.Save (CR);
      Cairo.Translate (CR, 10.0, 10.0);
      Cairo.Scale (CR, 5.0, 5.0);
      Cairo.Set_Font_Size (CR, 5.0);
      Cairo.Move_To (CR, 0.0, 0.0);
      Cairo.Line_To (CR, 30.0, 0.0);
      Cairo.Line_To (CR, 29.0, 1.0);
      Cairo.Move_To (CR, 25.0, 5.0);
      Cairo.Show_Text (CR, "X");
      Cairo.Move_To (CR, 0.0, 0.0);
      Cairo.Line_To (CR, 0.0, 30.0);
      Cairo.Line_To (CR, 1.0, 29.0);
      Cairo.Move_To (CR, 1.0, 30.0);
      Cairo.Show_Text (CR, "Y");
      Cairo.Move_To (CR, 1.0, 5.0);
      Cairo.Show_Text (CR, "0");
      Cairo.New_Sub_Path (CR);
      Cairo.Arc (CR, 10.0, 10.0, 10.0, 0.0, 3.14 / 2.0);
      Cairo.Line_To (CR, 11.0, 21.0);
      Cairo.Move_To (CR, 20.0, 10.0);
      Cairo.Show_Text (CR, "0");
      Cairo.Move_To (CR, 10.0, 25.0);
      Cairo.Show_Text (CR, "Pi/2");
      Cairo.Restore (CR);
      Cairo.Stroke (CR);
   end Dessine;

   function On_Main_Window_Delete_Event
     (Object : access Gtk.Window.Gtk_Window_Record'Class)
      return   Boolean
   is
      pragma Unreferenced (Object);
   begin
      Gtk.Main.Main_Quit;
      return True;
   end On_Main_Window_Delete_Event;

   function Redraw
     (Area : access Gtk.Drawing_Area.Gtk_Drawing_Area_Record'Class;
      Cr   : Cairo.Cairo_Context)
      return Boolean
   is
      pragma Unreferenced (Area);
   begin
      Dessine (Cr);
      return False;
   end Redraw;
end Hello_Callback;
