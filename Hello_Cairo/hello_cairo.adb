with Gtk.Widget;          use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;          use Gtk.Window;
with Glib;                use type Glib.Gdouble;
with Cairo;
with Cairo.Image_Surface;
with Cairo.Png;
with Cairo.PDF;
with Cairo.SVG;
with Cairo.Surface;
with Gtk.Drawing_Area;    use Gtk.Drawing_Area;
with Hello_Callback;      use Hello_Callback;

procedure Hello_Cairo is

   procedure Dessine_PNG is
      CR : Cairo.Cairo_Context;
      CS : Cairo.Cairo_Status;
      pragma Unreferenced (CS);
      Surface : Cairo.Cairo_Surface;
   begin
      Surface :=
         Cairo.Image_Surface.Create
           (Cairo.Image_Surface.Cairo_Format_ARGB32,
            200,
            200);
      CR      := Cairo.Create (Surface);
      Dessine (CR);
      Cairo.Destroy (CR);
      CS := Cairo.Png.Write_To_Png (Surface, "image.png");
      Cairo.Surface.Destroy (Surface);
   end Dessine_PNG;

   procedure Dessine_PDF is
      CR      : Cairo.Cairo_Context;
      Surface : Cairo.Cairo_Surface;
   begin
      Surface := Cairo.PDF.Create ("image.pdf", 200.0, 200.0);
      CR      := Cairo.Create (Surface);
      Dessine (CR);
      Cairo.Destroy (CR);
      Cairo.Surface.Show_Page (Surface);
      Cairo.Surface.Destroy (Surface);
   end Dessine_PDF;

   procedure Dessine_SVG is
      CR      : Cairo.Cairo_Context;
      Surface : Cairo.Cairo_Surface;
   begin
      Surface := Cairo.SVG.Create ("image.svg", 200.0, 200.0);
      CR      := Cairo.Create (Surface);
      Dessine (CR);
      Cairo.Destroy (CR);
      Cairo.Surface.Show_Page (Surface);
      Cairo.Surface.Destroy (Surface);
   end Dessine_SVG;

   Win       : Gtk_Window;
   Area_Draw : Gtk.Drawing_Area.Gtk_Drawing_Area;

begin
   --  Initialize GtkAda.
   --     Gtk.Main.Set_Locale;
   Gtk.Main.Init;

   --  Create a window with a size of 400x400
   Gtk_New (Win);
   Win.Set_Default_Size (200, 200);
   Gtk.Drawing_Area.Gtk_New (Area_Draw);
   Win.Add (Area_Draw);

   Event_Cb.Connect
     (Area_Draw,
      Signal_Draw,
      Event_Cb.To_Marshaller (Redraw'Access));
   Window_Cb.Connect
     (Win,
      Signal_Delete_Event,
      Window_Cb.To_Marshaller (On_Main_Window_Delete_Event'Access));

   --  Show the window
   Win.Show_All;

   -- Dessine avec Cairo
   Dessine_PNG;
   Dessine_PDF;
   Dessine_SVG;

   --  Start the Gtk+ main loop
   Gtk.Main.Main;
end Hello_Cairo;
