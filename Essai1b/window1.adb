with Gtk; use Gtk;
with Gtk; use Gtk;
with Gtk.Main;
with Gtk.Widget; use Gtk.Widget;
with Window1_Pkg; use Window1_Pkg;

procedure Window1 is
   Window1 : Window1_Access;

begin
   Gtk.Main.Set_Locale;
   Gtk.Main.Init;
   Gtk_New (Window1);
   Show_All (Window1);
   Gtk.Main.Main;
end Window1;
