with Glib; use Glib;
with Gtk; use Gtk;
with Gdk.Types; use Gdk.Types;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Enums; use Gtk.Enums;
with Gtkada.Handlers; use Gtkada.Handlers;
with Callbacks_Essai1; use Callbacks_Essai1;
with Essai1_Intl; use Essai1_Intl;
with Window1_Pkg.Callbacks; use Window1_Pkg.Callbacks;

package body Window1_Pkg is

   My_Window1 : Window1_Access := null;

procedure Gtk_New (Window1 : out Window1_Access) is
begin
   Window1 := new Window1_Record;
   Window1_Pkg.Initialize (Window1);
   My_Window1 := Window1;
end Gtk_New;

procedure Initialize (Window1 : access Window1_Record'Class) is
   pragma Suppress (All_Checks);
   Pixmaps_Dir : constant String := "pixmaps/";
begin
   Gtk.Window.Initialize (Window1, Window_Toplevel);
   Set_Title (Window1, -"Essai 1");

   Gtk_New (Window1.Fixed1);

   Gtk_New (Window1.Button1, -"Quitter");

   Set_Size_Request (Window1.Button1, 100, 30);
   Put (Window1.Fixed1, Window1.Button1, 320, 210);
   Gtk_New (Window1.Entry1);
   Set_Invisible_Char (Window1.Entry1, UTF8_Get_Char ("n"));

   Set_Size_Request (Window1.Entry1, 101, 30);
   Put (Window1.Fixed1, Window1.Entry1, 130, 110);
   Gtk_New (Window1.Label1, -("Saisir un nombre :"));

   Set_Size_Request (Window1.Label1, 120, 30);
   Put (Window1.Fixed1, Window1.Label1, 3, 110);
   Gtk_New (Window1.Button2, -"Factorielle");

   Set_Size_Request (Window1.Button2, 100, 30);
   Put (Window1.Fixed1, Window1.Button2, 264, 110);
   Add (Window1, Window1.Fixed1);

   --  Connect signals

   Button_Callback.Connect
     (Window1.Button1, "clicked",
      Button_Callback.To_Marshaller (On_Button1_Clicked'Access), False);
   Button_Callback.Connect
     (Window1.Button2, "clicked",
      Button_Callback.To_Marshaller (On_Button2_Clicked'Access), False);
   Return_Callback.Connect
     (Window1, "delete_event", On_Window1_Delete_Event'Access, False);
end Initialize;

   function Get_Window return Window1_Access is
   begin
      return My_Window1;
   end;

end Window1_Pkg;
