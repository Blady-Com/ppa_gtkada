with Gtk.Main;
with Gtk.Widget;
with Gtkada.Handlers;
with Ada.Text_IO; use Ada.Text_IO;

with Glib.Error; use Glib.Error;
with Gdk.Pixbuf; use Gdk.Pixbuf;
with Gtk.Image;  use Gtk.Image;
with Gtk.Window; use Gtk.Window;
with Gtk.Enums;  use Gtk.Enums;
with Gtk.Box;    use Gtk.Box;

procedure Image_Display is

   Main_Window : Gtk.Window.Gtk_Window;
   VBox        : Gtk.Box.Gtk_Vbox;

   function Quit
     (Widget : access Gtk.Widget.Gtk_Widget_Record'Class) return Boolean
   is
      pragma Unreferenced (Widget);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end Quit;

   -- Need to set: export DYLD_LIBRARY_PATH="$gtk_root/lib/gdk-pixbuf-2.0/2.10.0/loaders"
   function Load_Pixbuf (Name : String) return Gtk_Image is
      Pixbuf : Gdk_Pixbuf;
      Error  : GError;
      Image  : Gtk_Image;
   begin
      Gdk_New_From_File (Pixbuf, Name, Error);
      if Error /= null then
         Put_Line (Get_Message (Error));
         Error_Free (Error);
      else
         Image := Gtk_Image_New_From_Pixbuf (Pixbuf);
      end if;
      return Image;
   end Load_Pixbuf;

   function Load_Animation (Name : String) return Gtk_Image is
      Animation : Gdk_Pixbuf_Animation;
      Error     : GError;
      Image     : Gtk_Image;
   begin
      Gdk_New_From_File (Animation, Name, Error);
      if Error /= null then
         Put_Line (Get_Message (Error));
         Error_Free (Error);
      else
         Image := Gtk_Image_New_From_Animation (Animation);
      end if;
      return Image;
   end Load_Animation;

begin
   Gtk.Main.Init;
   Gtk.Window.Gtk_New
     (Window => Main_Window, The_Type => Gtk.Enums.Window_Toplevel);
   Gtk.Window.Set_Title
     (Window => Main_Window, Title => "Hello Image Display");
   Gtk.Window.Set_Default_Size
     (Window => Main_Window, Width => 230, Height => 150);
   Gtk.Window.Set_Position
     (Window => Main_Window, Position => Gtk.Enums.Win_Pos_Center);
   Gtkada.Handlers.Return_Callback.Connect
     (Main_Window, "delete_event", Quit'Unrestricted_Access);
   Gtk_New_Vbox (VBox);
   Add (Main_Window, VBox);
   Show_All (Main_Window);
   Pack_Start (VBox, Load_Pixbuf ("gnome-foot.png")); -- ok
   Pack_Start (VBox, Load_Animation ("floppybuddy.gif")); -- ok
   --  Gtk_New_From_Resource (Image, Name); -- depuis un fichier ressource.xml
   Pack_Start (VBox, Gtk_Image_New_From_File ("gnu-keys.png")); -- ok
   Pack_Start
     (VBox,
      Gtk_Image_New_From_Icon_Name ("gtk3-demo", Icon_Size_Dialog)); -- ok

   Pack_Start
     (VBox, Gtk_Image_New_From_Icon_Name ("go-home", Icon_Size_Dialog));
   Pack_Start
     (VBox, Gtk_Image_New_From_Icon_Name ("document-open", Icon_Size_Dialog));
   Pack_Start
     (VBox,
      Gtk_Image_New_From_Icon_Name ("application-exit", Icon_Size_Dialog));
   Pack_Start
     (VBox, Gtk_Image_New_From_Icon_Name ("emblem-ok", Icon_Size_Dialog));
   Show_All (Main_Window);
   Gtk.Main.Main;
end Image_Display;
