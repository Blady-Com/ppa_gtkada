with Gtkada.Intl; use Gtkada.Intl;

package body Essai1_Intl is

   function "-" (Msg : String) return String is
   begin
      return Dgettext ("Essai1", Msg);
   end "-";

end Essai1_Intl;
