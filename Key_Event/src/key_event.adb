with Gtk.Main, Gtk.Window, Gtk.Enums;
with Gtk.Widget;
with Gdk.Event;
with Gdk.Display;
with Gdk.Types.Keysyms;
with Gtkada.Handlers;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Gtk.Accel_Group;

procedure Key_Event is

   Main_Window : Gtk.Window.Gtk_Window;
   --  Display     : Gdk.Display.Gdk_Display := Gdk.Display.Get_Default;

   function On_Key_Press_Event
     (Object : access Gtk.Widget.Gtk_Widget_Record'Class;
      Event  : Gdk.Event.Gdk_Event) return Boolean
   is
      use Gdk.Types.Keysyms;
      use Gdk.Event;
   begin
      Put (Integer (Get_Key_Val (Event)), 10);
      Put ("  -  ");
      Put (Integer (Get_State (Event)), 15, 16);
      Put
        ("  -  " &
         Gtk.Accel_Group.Accelerator_Get_Label
           (Get_Key_Val (Event), Get_State (Event)));
      New_Line;
      return True;
   end On_Key_Press_Event;

begin
   Gtk.Main.Init;
   Gtk.Window.Gtk_New
     (Window => Main_Window, The_Type => Gtk.Enums.Window_Toplevel);
   Gtk.Window.Set_Title (Window => Main_Window, Title => "Hello key event");
   Gtk.Window.Set_Default_Size
     (Window => Main_Window, Width => 230, Height => 150);
   Gtk.Window.Set_Position
     (Window => Main_Window, Position => Gtk.Enums.Win_Pos_Center);
   Gtkada.Handlers.Return_Callback.Connect
     (Main_Window, Gtk.Widget.Signal_Key_Press_Event,
      Gtkada.Handlers.Return_Callback.To_Marshaller
        (On_Key_Press_Event'Unrestricted_Access));
   Gtk.Window.Show_All (Main_Window);
   Put ("Get_Default_Mod_Mask:");
   Put (Integer (Gtk.Accel_Group.Get_Default_Mod_Mask), 15, 16);
   New_Line;
   Put_Line ("     Key    -     Modifier      - Label");
   Gtk.Main.Main;
end Key_Event;
