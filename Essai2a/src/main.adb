with Gtk.Widget;        use Gtk.Widget;
with Gtk.Main;
with Gtkada.Builder;    use Gtkada.Builder;
with Window1_Callbacks; use Window1_Callbacks;
with Glib.Error;        use Glib.Error;
with Ada.Text_IO;

procedure Main is
   Builder          : Gtkada_Builder;
   Error            : aliased Glib.Error.GError;
   Default_Filename : constant String := "Essai2.glade";
   use Glib;
begin
   --  Initialize GtkAda.
   Gtk.Main.Init;

   --  Create from UI description
   Gtk_New (Builder);
   if Add_From_File (Builder, Default_Filename, Error'Access) = 0 then
      Ada.Text_IO.Put_Line ("Error : " & Get_Message (Error));
      Error_Free (Error);
      return;
   end if;
   Register_Handler
     (Builder      => Builder,
      Handler_Name => "on_window1_delete_event",
      Handler      => On_Window1_Delete_Event'Access);
   Register_Handler
     (Builder      => Builder,
      Handler_Name => "on_button1_clicked",
      Handler      => On_Button1_Clicked'Access);
   Register_Handler
     (Builder      => Builder,
      Handler_Name => "on_button2_clicked",
      Handler      => On_Button2_Clicked'Access);
   Do_Connect (Builder);
   Show_All (Gtk_Widget (Get_Object (Builder, "window1")));

   --  Start the Gtk+ main loop
   Gtk.Main.Main;
end Main;
