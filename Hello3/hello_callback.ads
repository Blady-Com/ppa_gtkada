with Gtk.Window, Gtk.Handlers;
package Hello_Callback is
   package Window_Cb is new Gtk.Handlers.Return_Callback (
      Gtk.Window.Gtk_Window_Record,
      Boolean);
   function Quit
     (Widget : access Gtk.Window.Gtk_Window_Record'Class)
      return   Boolean;
end Hello_Callback;
