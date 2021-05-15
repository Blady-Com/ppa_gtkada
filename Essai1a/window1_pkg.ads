with Gtk.Window; use Gtk.Window;
with Gtk.Fixed; use Gtk.Fixed;
with Gtk.Button; use Gtk.Button;
with Gtk.GEntry; use Gtk.GEntry;
with Glib.Unicode; use Glib.Unicode;
with Gtk.Label; use Gtk.Label;
package Window1_Pkg is

   type Window1_Record is new Gtk_Window_Record with record
      Fixed1 : Gtk_Fixed;
      Button1 : Gtk_Button;
      Entry1 : Gtk_Entry;
      Label1 : Gtk_Label;
      Button2 : Gtk_Button;
   end record;
   type Window1_Access is access all Window1_Record'Class;

   procedure Gtk_New (Window1 : out Window1_Access);
   procedure Initialize (Window1 : access Window1_Record'Class);

   function Get_Window return Window1_Access;

end Window1_Pkg;
