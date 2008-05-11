using System;
using System.Collections.Generic;
using System.Text;
using HOT.Common;

namespace HOT.BLL
{
    public enum TransType
    {
        [EnumItemDescription("按点击计费")]
        ByClick = 2,
        [EnumItemDescription("按时长计费")]
        ByPeriod = 5
    }
}
