with Gtk.Main, Gtk.Window, Gtk.Enums, Gtk.Label;
with Hello_Callback;
with Restore_GPS_Startup_Values;
procedure Hello3 is
   Main_Window : Gtk.Window.Gtk_Window;
   Label       : Gtk.Label.Gtk_Label;
begin
   Restore_GPS_Startup_Values;
   Gtk.Main.Init;
   Gtk.Window.Gtk_New
     (Window   => Main_Window,
      The_Type => Gtk.Enums.Window_Toplevel);
   Gtk.Window.Set_Title (Window => Main_Window, Title => "Hello");
   Gtk.Window.Set_Default_Size
     (Window => Main_Window,
      Width  => 230,
      Height => 150);
   Gtk.Window.Set_Position
     (Window   => Main_Window,
      Position => Gtk.Enums.Win_Pos_Center);
   Gtk.Label.Gtk_New (Label, "Hello with GTKAda.");
   Gtk.Window.Add (Main_Window, Label);
   Hello_Callback.Window_Cb.Connect
     (Main_Window,
      "delete_event",
      Hello_Callback.Quit'Access);
   Gtk.Window.Show_All (Main_Window);
   Gtk.Main.Main;
end Hello3;
