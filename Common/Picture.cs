using System;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Collections;

using System.IO;
using System.Drawing.Imaging;
using System.Web;
using System.Drawing;

namespace HOT.Common
{
   public class Picture
    {
        #region Helper


        /// <summary>
        /// ��ȡͼ���������������������Ϣ
        /// </summary>
        /// <param name="mimeType">��������������Ķ���;�����ʼ�����Э�� (MIME) ���͵��ַ���</param>
        /// <returns>����ͼ���������������������Ϣ</returns>
        static ImageCodecInfo GetCodecInfo(string mimeType)
        {
            ImageCodecInfo[] CodecInfo = ImageCodecInfo.GetImageEncoders();
            foreach (ImageCodecInfo ici in CodecInfo)
            {
                if (ici.MimeType == mimeType) return ici;
            }
            return null;
        }

        static internal readonly string AllowExt = "jpe|jpeg|jpg|png|tif|tiff|bmp|gif|wbmp|swf|psd";

        /// <summary>
        /// �����չ������Ч��
        /// </summary>
        /// <param name="sExt">�ļ�����չ��</param>
        /// <returns>�����չ����Ч,����true,���򷵻�false.</returns>
        public static bool CheckValidExt(string sExt)
        {
            bool flag = false;
            string[] aExt = AllowExt.Split('|');
            foreach (string filetype in aExt)
            {
                if (filetype.ToLower() == sExt.Replace(".", ""))
                {
                    flag = true;
                    break;
                }
            }
            return flag;
        }

        public static string GetHtmime(string ext)
        {
            Hashtable htmimes = new Hashtable();

            switch (ext.ToLower())
            {
                case ".jpe":
                case ".jpeg":
                case ".jpg":
                    htmimes[ext] = "image/jpeg";
                    break;
                case ".png":
                    htmimes[ext] = "image/png";
                    break;
                case ".tif":
                case ".tiff":
                    htmimes[ext] = "image/tiff";
                    break;
                case ".bmp":
                    htmimes[ext] = "image/bmp";
                    break;
                case ".gif":
                    htmimes[ext] = "image/gif";
                    break;
                case ".swf":
                    htmimes[ext] = "image/swf";
                    break;
                case ".wbmp":
                    htmimes[ext] = "image/wbmp";
                    break;
                case ".psd":
                    htmimes[ext] = "image/psd";
                    break;


            }
            return (string)htmimes[ext];
        }


        /// <summary>
        /// ����ͼƬ
        /// </summary>
        /// <param name="image">Image ����</param>
        /// <param name="savePath">����·��</param>
        /// <param name="ici">ָ����ʽ�ı�������</param>
        public static void SaveImage(System.Drawing.Image image, string savePath, ImageCodecInfo ici)
        {
            //���� ԭͼƬ ����� EncoderParameters ����
            EncoderParameters parameters = new EncoderParameters(1);
            parameters.Param[0] = new EncoderParameter(Encoder.Quality, ((long)90));
            image.Save(savePath, ici, parameters);
            parameters.Dispose();
        }
        #endregion

        #region Methods


        /// <summary>
        /// ��ָ����С�Զ���������ͼ
        /// </summary>
        /// <param name="sourceImagePath">ԭͼƬ·��(���·��)</param>
        /// <param name="thumbnailImagePath">���ɵ�����ͼ·��,���Ϊ���򱣴�ΪԭͼƬ·��(���·��)</param>
        /// <param name="thumbnailImageWidth">����ͼ�Ŀ��</param>
        /// <param name="thumbnailImageHeight">����ͼ�ĸ߶�</param>
        /// <param name="backgroundcolor">����ͼ�ı�����ɫ,</param>
        public static void ToThumbnailImages(string sourceImagePath, string thumbnailImagePath, int thumbnailImageWidth, int thumbnailImageHeight, string backgroundcolor)
        {
            string SourceImagePath = sourceImagePath;
            string ThumbnailImagePath = thumbnailImagePath;
            int ThumbnailImageWidth = thumbnailImageWidth;
            string sExt = SourceImagePath.Substring(SourceImagePath.LastIndexOf(".")).ToLower();
            if (SourceImagePath.ToString() == System.String.Empty) throw new NullReferenceException("SourceImagePath is null!");
            if (!CheckValidExt(sExt))
            {
                throw new ArgumentException("ԭͼƬ�ļ���ʽ����ȷ,֧�ֵĸ�ʽ��[ " + AllowExt + " ]", "SourceImagePath");
            }

            System.Drawing.Image image = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath(SourceImagePath));
            Bitmap bitmap = new Bitmap(thumbnailImageWidth, thumbnailImageHeight, PixelFormat.Format32bppArgb);

            int dstTop = 0, dstLeft = 0, dstWidth = image.Width, dstHeight = image.Height;

            //�����ͼ��λ��
            float defaultSizeScale = (float)thumbnailImageHeight / thumbnailImageWidth;
            float imageSizeScale = (float)image.Height / image.Width;

            if (defaultSizeScale > imageSizeScale)
            {
                dstLeft = 0;
                dstTop = (int)((thumbnailImageHeight - (imageSizeScale * thumbnailImageWidth)) / 2);
                dstWidth = thumbnailImageWidth;
                dstHeight = (int)(imageSizeScale * thumbnailImageWidth);
            }
            else if (defaultSizeScale == imageSizeScale)
            {
                dstLeft = 0;
                dstTop = 0;
                dstWidth = thumbnailImageWidth;
                dstHeight = thumbnailImageHeight;
            }
            else
            {
                dstLeft = (int)((thumbnailImageWidth - (thumbnailImageHeight / imageSizeScale)) / 2);
                dstTop = 0;
                dstWidth = (int)(thumbnailImageHeight / imageSizeScale);
                dstHeight = thumbnailImageHeight;
            }

            //��䱳����ɫ
            Graphics graphics = Graphics.FromImage(bitmap);
            if (string.IsNullOrEmpty(backgroundcolor))
                graphics.Clear(Color.Transparent);
            else
            {
                ColorConverter colorConverter = new ColorConverter();

                Color color = new Color();
                color = (Color)colorConverter.ConvertFromString(backgroundcolor);
                graphics.Clear(color);
            }

            Rectangle srcRect = new Rectangle(0, 0, image.Width, image.Height);
            Rectangle dstRect = new Rectangle(dstLeft, dstTop, dstWidth, dstHeight);

            graphics.DrawImage(image, dstRect, srcRect, GraphicsUnit.Pixel);


            image.Dispose();
            try
            {
                //���� ԭͼƬ ��ָ����ʽ����ָ���ı����������浽ָ���ļ� 
                string savepath = (ThumbnailImagePath == null ? SourceImagePath : ThumbnailImagePath);
                SaveImage(bitmap, HttpContext.Current.Server.MapPath(savepath), GetCodecInfo(GetHtmime(sExt)));
            }
            catch (System.Exception e)
            {
                throw e;
            }
            finally
            {
                bitmap.Dispose();
                graphics.Dispose();
            }
        }

        /// <summary>
        /// ��ԴͼƬ�����Զ���������ͼ
        /// </summary>
        /// <param name="sourceImagePath">ԭͼƬ·��(���·��)</param>
        /// <param name="thumbnailImagePath">���ɵ�����ͼ·��,���Ϊ���򱣴�ΪԭͼƬ·��(���·��)</param>
        /// <param name="thumbnailImageWidth">����ͼ�Ŀ�ȣ��߶��밴ԴͼƬ�����Զ����ɣ�</param>
        public static void ToThumbnailImages(string sourceImagePath, string thumbnailImagePath, int thumbnailImageWidth, string backgroundcolor)
        {
            string SourceImagePath = sourceImagePath;
            string ThumbnailImagePath = thumbnailImagePath;
            int ThumbnailImageWidth = thumbnailImageWidth;
            string sExt = SourceImagePath.Substring(SourceImagePath.LastIndexOf(".")).ToLower();
            if (SourceImagePath.ToString() == System.String.Empty) throw new NullReferenceException("SourceImagePath is null!");
            if (!CheckValidExt(sExt))
            {
                throw new ArgumentException("ԭͼƬ�ļ���ʽ����ȷ,֧�ֵĸ�ʽ��[ " + AllowExt + " ]", "SourceImagePath");
            }
            //�� ԭͼƬ ���� Image ����
            System.Drawing.Image image = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath(SourceImagePath));
            int num = ((ThumbnailImageWidth / 4) * 3);
            int width = image.Width;
            int height = image.Height;
            //����ͼƬ�ı���
            if ((((double)width) / ((double)height)) >= 1.3333333333333333f)
            {
                num = ((height * ThumbnailImageWidth) / width);
            }
            else
            {
                ThumbnailImageWidth = ((width * num) / height);
            }
            if ((ThumbnailImageWidth < 1) || (num < 1))
            {
                return;
            }
            //��ָ���Ĵ�С�͸�ʽ��ʼ�� Bitmap �����ʵ��
            Bitmap bitmap = new Bitmap(ThumbnailImageWidth, num, PixelFormat.Format32bppArgb);
            //��ָ���� Image ���󴴽��� Graphics ����
            Graphics graphics = Graphics.FromImage(bitmap);
            //���������ͼ�沢��͸������ɫ���
            //graphics.Clear(Color.Transparent);

            if (string.IsNullOrEmpty(backgroundcolor))
                graphics.Clear(Color.Transparent);
            else
            {
                ColorConverter colorConverter = new ColorConverter();

                Color color = new Color();
                color = (Color)colorConverter.ConvertFromString(backgroundcolor);
                graphics.Clear(color);
            }

            //��ָ��λ�ò��Ұ�ָ����С���� ԭͼƬ ����
            graphics.DrawImage(image, new Rectangle(0, 0, ThumbnailImageWidth, num));
            image.Dispose();
            try
            {
                //���� ԭͼƬ ��ָ����ʽ����ָ���ı����������浽ָ���ļ� 
                string savepath = (ThumbnailImagePath == null ? SourceImagePath : ThumbnailImagePath);
                SaveImage(bitmap, HttpContext.Current.Server.MapPath(savepath), GetCodecInfo(GetHtmime(sExt)));
            }
            catch (System.Exception e)
            {
                throw e;
            }
            finally
            {
                bitmap.Dispose();
                graphics.Dispose();
            }
        }

        #endregion
    }
}