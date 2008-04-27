using System;
using System.Collections.Generic;
using System.Text;
using HOT.Common;

namespace HOT.BLL
{
    public enum MediaType
    {
        /// <summary>
        /// 文字广告位
        /// </summary>
        [EnumItemDescription("文字广告")]
        Text = 2,
        /// <summary>
        /// 图片广告位
        /// </summary>
        [EnumItemDescription("图片/Flash广告")]
        Picture = 5,
    }
}
