-----------------------------------------------------------------------------
--  Legal licensing note : !!! Edit the file gate3_license.txt !!!
--
--  Copyright (c) surname name
--  FRANCE
--  Send bug reports to : capitaine.nemo@jules-verne.fr
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
with Gtkada.Builder; use Gtkada.Builder;

package Window1_Callbacks  is

   function On_Window1_Delete_Event  (Builder : access Gtkada_Builder_Record'Class)
      return Boolean;

   procedure On_Button1_Clicked (Builder : access Gtkada_Builder_Record'Class);

   procedure On_Button2_Clicked (Builder : access Gtkada_Builder_Record'Class);


end Window1_Callbacks;
