with Gtk.Arguments;
with Gtk.Widget; use Gtk.Widget;

package Window1_Pkg.Callbacks is
   procedure On_Button1_Clicked
     (Object : access Gtk_Button_Record'Class);

   procedure On_Button2_Clicked
     (Object : access Gtk_Button_Record'Class);

   function On_Window1_Delete_Event
     (Object : access Gtk_Widget_Record'Class;
      Params : Gtk.Arguments.Gtk_Args) return Boolean;

end Window1_Pkg.Callbacks;
