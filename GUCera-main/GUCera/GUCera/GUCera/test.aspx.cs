using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;  
using System.Drawing.Imaging;
using Image = System.Drawing.Image;
using System.IO;

namespace GUCera
{
	public partial class test : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
			using (Image b = (Image)Bitmap.FromFile(Server.MapPath("Stock/Guceracertificate.jpg")))
			{
				using (Graphics g =Graphics.FromImage(b))
				{
					StringFormat stringformat = new StringFormat();
					stringformat.Alignment = StringAlignment.Center;
					stringformat.LineAlignment = StringAlignment.Center;



					Color StringColor = System.Drawing.ColorTranslator.FromHtml("#000000");//direct color adding    

					string Str_TextOnImage = "Ahmed Ramadan";//Your Text On Image    
				    string Str_TextOnImage2 = "Math5";//Your Text On Image    
					string Str_sign = "Slim";
					string Str_date = "11/11/1111";

					g.DrawString(Str_TextOnImage, new Font("Informal Roman", 40,
                    FontStyle.Regular), new SolidBrush(StringColor), new Point(500, 430),
                   stringformat); 

					g.DrawString(Str_TextOnImage2, new Font("Informal Roman", 40,
					FontStyle.Bold), new SolidBrush(StringColor), new Point(500, 280),
					stringformat);

					g.DrawString(Str_sign, new Font("Magneto", 25,
                    FontStyle.Bold), new SolidBrush(StringColor), new Point(730, 510),
                    stringformat);

					g.DrawString(Str_date, new Font("Informal Roman", 40,
                    FontStyle.Bold), new SolidBrush(StringColor), new Point(280, 500),
                    stringformat);

				}
				string projectDir =
                    Path.GetFullPath(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\.."));
				String full = @"\DB\GUCera\GUCera\Certificates\cer34.png";
					b.Save( (projectDir+full));

				///string startupPath = System.IO.Directory.GetCurrentDirectory();
				///	string startupPath = Environment.CurrentDirectory;
				///	Response.Write(projectDir);
				

				////	
					Image1.ImageUrl = "Certificates/cer34.png";
				///File.Delete(@"C:\Users\Ahmed Ramadan\Desktop\DB\GUCera\GUCera\Stock\cer3.png");
			}









			//creating a image object    
			/*Image bitmap = (Image)Bitmap.FromFile(Server.MapPath("Stock/certi2.png")); // set image     
			bitmap.Save(@"C:\\Users\\Ahmed Ramadan\\Desktop\\GEUEARA");																							 //draw the image object using a Graphics object    
			Graphics graphicsImage = Graphics.FromImage(bitmap);

			//Set the alignment based on the coordinates       
			StringFormat stringformat = new StringFormat();
			stringformat.Alignment = StringAlignment.Far;
			stringformat.LineAlignment = StringAlignment.Far;

			StringFormat stringformat2 = new StringFormat();
			stringformat2.Alignment = StringAlignment.Center;
			stringformat2.LineAlignment = StringAlignment.Center;

			//Set the font color/format/size etc..      
			Color StringColor = System.Drawing.ColorTranslator.FromHtml("#933eea");//direct color adding    
			Color StringColor2 = System.Drawing.ColorTranslator.FromHtml("#e80c88");//customise color adding    
			string Str_TextOnImage = "Happy";//Your Text On Image    
			string Str_TextOnImage2 = "Onam";//Your Text On Image    

			graphicsImage.DrawString(Str_TextOnImage, new Font("arial", 40,
			FontStyle.Regular), new SolidBrush(StringColor), new Point(268, 245),
			stringformat); Response.ContentType = "image/jpeg";

			graphicsImage.DrawString(Str_TextOnImage2, new Font("Edwardian Script ITC", 111,
			FontStyle.Bold), new SolidBrush(StringColor2), new Point(145, 255),
			stringformat2); Response.ContentType = "image/jpeg";
			///bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);*/
		}


	}
}