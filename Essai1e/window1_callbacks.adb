-----------------------------------------------------------------------------
--  Legal licensing note : !!! Edit the file gate3_license.txt !!!
--
--  Copyright (c) F. J. FABIEN - 2013
--  Berry
--  FRANCE
--  Send bug reports or feedback to : francois_fabien@hotmail.com
--
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--  DEALINGS IN THE SOFTWARE.
--  NB: this is the MIT License, as found 12-Sep-2007 on the site
--  http://www.opensource.org/licenses/mit-license.php
-----------------------------------------------------------------------------
-- units from Gtk
with Glib;       use Glib;
with Glib.Object;use Glib.Object;
with Gtk.Enums;  use Gtk.Enums;
with Gtk.Widget; use Gtk.Widget;
with Gtk.GEntry; use Gtk.GEntry;
with Gtk.Main;       use Gtk.Main;
with Gtk.Builder;    use Gtk.Builder;
with Gtk.Widget;     use Gtk.Widget;

-- Ada predefined units
with Ada.Text_IO;    use Ada.Text_IO;

-- Application specific units

package body Window1_Callbacks  is

   -----------------------------------------------
   -- On_Window1_Delete_Event
   -----------------------------------------------

   function On_Window1_Delete_Event  (Builder : access Gtkada_Builder_Record'Class)
      return Boolean is
      pragma Unreferenced (Builder);
   begin
      Gtk.Main.Main_Quit;
      return False;
   end On_Window1_Delete_Event;

   -----------------------------------------------
   -- On_Button1_Clicked
   -----------------------------------------------

   procedure On_Button1_Clicked (Builder : access Gtkada_Builder_Record'Class) is
   begin
      Gtk.Main.Main_Quit;
   end On_Button1_Clicked;

   -----------------------------------------------
   -- On_Button2_Clicked
   -----------------------------------------------

   procedure On_Button2_Clicked (Builder : access Gtkada_Builder_Record'Class) is
      S : constant UTF8_String := Get_Text(Gtk_Entry (Get_Object (Builder, "entry1")));
      function Factorielle (N : Natural) return Long_Long_Integer is
         F : Long_Long_Integer := 1;
      begin
         for I in 2 .. N loop
            F := F * Long_Long_Integer(I);
         end loop;
         return F;
      end Factorielle;
   begin
      Set_Text(Gtk_Entry (Get_Object (Builder, "entry1")),
               Long_Long_Integer'Image(Factorielle(Natural'Value(S))));
   exception
      when others =>
         Set_Text(Gtk_Entry (Get_Object (Builder, "entry1")), "Erreur!");
   end On_Button2_Clicked;


end Window1_Callbacks;

