with Gtk.Main;
package body Hello_Callback is
   function Quit
     (Widget : access Gtk.Window.Gtk_Window_Record'Class)
      return   Boolean
   is
      pragma Unreferenced (Widget);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end Quit;
end Hello_Callback;
