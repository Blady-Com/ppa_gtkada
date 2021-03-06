------------------------------------------------------------------------------
--                                                                          --
--  File generated by gate3                                                 --
--  Glade3 original file : Essai2.glade
--  Generation date  : 2012-12-28 18:11:29                                  --
--                                                                          --
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- COPYRIGHT                        : (c) Pascal Pignard 2012-2013
-- LICENCE                          : CeCILL V2 (http://www.cecill.info)
-- CONTACT                          : http://blady.pagesperso-orange.fr
------------------------------------------------------------------------------
-- units from Gtk
with Gtk;            use Gtk;
with Gtk.Main;
with Glib.Error;     use Glib.Error;
with Gtk.Widget;     use Gtk.Widget;
with Gtkada.Builder; use Gtkada.Builder;

-- Ada predefined units
with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

-- Application specific units
with Window1_Callbacks; use Window1_Callbacks;

procedure Essai2 is

   Builder       : Gtkada_Builder;
   Error         : aliased Glib.Error.GError;
   GladeFileName : constant String := "Essai2.glade";
   use Glib;

begin

   Gtk.Main.Init;

   -- Step 1: create a Builder and add the XML data

   Gtk_New (Builder);
   if Add_From_File (Builder, GladeFileName, Error'Access) = 0 then
      Put_Line ("Error : " & Get_Message (Error));
      Error_Free (Error);
      return;
   end if;

   --  Step 2: add calls to "Register_Handler" to associate your
   --  handlers with your callbacks.

   Register_Handler (Builder, "on_window1_delete_event", On_Window1_Delete_Event'Access);
   Register_Handler (Builder, "on_button1_clicked", On_Button1_Clicked'Access);
   Register_Handler (Builder, "on_button2_clicked", On_Button2_Clicked'Access);

   -- Step 3: call Do_Connect. Once to connect all registered handlers

   Do_Connect (Builder);

   Put_Line ("Essai2 : loading and connexion of builder OK ");

   -- Step 3.5 : display the windows and all of their children.
   --            Remove objects than are not windows as necessary.

   Show_All (Gtk_Widget (Get_Object (Builder, "window1")));
   Gtk.Main.Main;

   --  Step 4: when the application terminates
   --          call Unref to free memory associated with the Builder.
   Unref (Builder);
   Put_Line ("Program Essai2 is finished !");

exception
   when Error : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (Error));

end Essai2;
