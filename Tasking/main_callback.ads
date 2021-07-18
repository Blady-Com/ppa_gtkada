with Gtk.Window;
with Gtk.Handlers;
with Gtk.Button;
with Gtk.Label;
package Main_Callback is
   package Window_Cb is new Gtk.Handlers.Return_Callback (
      Gtk.Window.Gtk_Window_Record,
      Boolean);
   function Quit
     (Widget : access Gtk.Window.Gtk_Window_Record'Class)
      return   Boolean;

   Label         : Gtk.Label.Gtk_Label;
   Button        : Gtk.Button.Gtk_Button;
   My_Handler_ID : Gtk.Handlers.Handler_Id;
   package My_handler is new Gtk.Handlers.Callback (
      Gtk.Button.Gtk_Button_Record);
   procedure Diminue (Widget : access Gtk.Button.Gtk_Button_Record'Class);
   task Augmente is
      entry Start;
   end Augmente;
end Main_Callback;
