using System;
using System.Collections.Generic;
using System.Text;
using HOT.Common;

namespace HOT.BLL
{
    public enum MediaType
    {
        /// <summary>
        /// ���ֹ��λ
        /// </summary>
        [EnumItemDescription("���ֹ��")]
        Text = 2,
        /// <summary>
        /// ͼƬ���λ
        /// </summary>
        [EnumItemDescription("ͼƬ/Flash���")]
        Picture = 5,
    }
}
