with Gtkada.Builder; use Gtkada.Builder;

package Window1_Callbacks is

   procedure On_Button1_Clicked (Builder : access Gtkada_Builder_Record'Class);

   procedure On_Button2_Clicked (Builder : access Gtkada_Builder_Record'Class);

   function On_Window1_Delete_Event
     (Builder : access Gtkada_Builder_Record'Class)
      return    Boolean;

end Window1_Callbacks;
