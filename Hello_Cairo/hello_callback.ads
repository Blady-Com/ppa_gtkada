with Gtk.Window, Gtk.Handlers;
with Gtk.Drawing_Area;
with Cairo;
package Hello_Callback is
   procedure Dessine (CR : Cairo.Cairo_Context);

   package Window_Cb is new Gtk.Handlers.Return_Callback (
      Gtk.Window.Gtk_Window_Record,
      Boolean);

   function On_Main_Window_Delete_Event
     (Object : access Gtk.Window.Gtk_Window_Record'Class)
      return   Boolean;

   package Event_Cb is new Gtk.Handlers.Return_Callback (
      Gtk.Drawing_Area.Gtk_Drawing_Area_Record,
      Boolean);

   function Redraw
     (Area : access Gtk.Drawing_Area.Gtk_Drawing_Area_Record'Class;
      Cr   : Cairo.Cairo_Context)
      return Boolean;
end Hello_Callback;
