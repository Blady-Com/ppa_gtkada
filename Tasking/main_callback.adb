with Gtk.Main;
with Gdk.Threads;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
package body Main_Callback is
   function Quit
     (Widget : access Gtk.Window.Gtk_Window_Record'Class)
      return   Boolean
   is
      pragma Unreferenced (Widget);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end Quit;

   Size : Natural := 1;
   procedure Diminue (Widget : access Gtk.Button.Gtk_Button_Record'Class) is
      pragma Unreferenced (Widget);
   begin
      if Size > 0 then
         Size := Size - 1;
         Label.Set_Text (Size * '*');
      end if;
   end Diminue;
   task body Augmente is
   begin
      accept Start;
      while Size < 20 loop
         delay 2.000 / Size;
         Gdk.Threads.Enter;
         Size := Size + 1;
         Label.Set_Text (Size * '*');
         Gdk.Threads.Leave;
      end loop;
      -- Blow up ;-)
      Gdk.Threads.Enter;
      Gtk.Handlers.Disconnect (Button, My_Handler_ID);
      Label.Set_Text ("Perdu ");
      Gdk.Threads.Leave;
      delay 1.500;
      Gtk.Main.Main_Quit;
   end Augmente;
end Main_Callback;
