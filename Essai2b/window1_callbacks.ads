------------------------------------------------------------------------------
-- COPYRIGHT                        : (c) Pascal Pignard 2012-2013
-- LICENCE                          : CeCILL V2 (http://www.cecill.info)
-- CONTACT                          : http://blady.pagesperso-orange.fr
-----------------------------------------------------------------------------

with Gtkada.Builder; use Gtkada.Builder;

package Window1_Callbacks  is

   function On_Window1_Delete_Event  (Builder : access Gtkada_Builder_Record'Class)
      return Boolean;

   procedure On_Button1_Clicked (Builder : access Gtkada_Builder_Record'Class);

   procedure On_Button2_Clicked (Builder : access Gtkada_Builder_Record'Class);


end Window1_Callbacks;
