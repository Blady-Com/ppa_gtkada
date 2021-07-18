with Gtk.Box;    use Gtk.Box;
with Gtk.Button; use Gtk.Button;
with Gtk.Label;  use Gtk.Label;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Main;
with Gtk.Window; use Gtk.Window;
with Gdk.Threads;
with Main_Callback; use Main_Callback;

procedure Main is
   Win : Gtk_Window;
   Box : Gtk_Vbox;

begin
   -- Initialize GtkAda with task-safe mode
   Gdk.Threads.G_Init;
   Gdk.Threads.Init;
   Gtk.Main.Init;

   -- Create a window
   Gtk_New (Win);
   Win.Set_Default_Size (200, 200);
   Window_Cb.Connect
     (Win,
      Signal_Delete_Event,
      Window_Cb.To_Marshaller (Quit'Access));

   -- Create a box to organize vertically the contents of the window
   Gtk_New_Vbox (Box);
   Win.Add (Box);

   -- Add a label
   Gtk_New (Label, "Bonjour avec GtkAda.");
   Box.Add (Label);

   -- Add a button
   Gtk_New (Button, "Diminue");
   Box.Add (Button);
   My_Handler_ID :=
      My_handler.Connect
        (Button,
         "clicked",
         My_handler.To_Marshaller (Diminue'Access));

   -- Show the window
   Win.Show_All;

   -- Start our task
   Augmente.Start;

   -- Start the Gtk+ main loop in task-safe mode
   Gdk.Threads.Enter;
   Gtk.Main.Main;
   Gdk.Threads.Leave;
end Main;
