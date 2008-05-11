using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Reflection;

namespace HOT.Common
{
    public class EnumHelper
    {
        public static List<T> EnumToList<T>()
        {
            Type enumType = typeof(T);

            // Can't use type constraints on value types, so have to do check like this
            if (enumType.BaseType != typeof(Enum))
                throw new ArgumentException("T must be of type System.Enum");

            Array enumValArray = Enum.GetValues(enumType);

            List<T> enumValList = new List<T>(enumValArray.Length);

            foreach (int val in enumValArray)
            {
                enumValList.Add((T)Enum.Parse(enumType, val.ToString()));
            }

            return enumValList;
        }

        //TODO:寻找更好的避免此方法抛出异常的方式
        public static bool  TryGetEnumItemDescription<T>(object item, out string description)
        {
            description = "";
            Type enumType = typeof(T);

            // Can't use type constraints on value types, so have to do check like this
            if (enumType.BaseType != typeof(Enum))
                throw new ArgumentException("T must be of type System.Enum");

            if (item != null)
            {
                //目前只支持int
                if (Enum.GetUnderlyingType(enumType) == typeof(int))
                {
                    int enumBaseValue;
                    //trick:使用TryParse避免了转换出现异常 
                    if (int.TryParse(item.ToString(), out enumBaseValue))
                    {
                        if(Enum.IsDefined(enumType,enumBaseValue))
                        {
                        Enum enumItem = (Enum)Enum.ToObject(enumType, enumBaseValue);
                        description = EnumMapHelper.GetStringFromEnum(enumItem);

                        return true;
                        }
                    }
                }
            }

            return false;
        }
    }

    public class EnumMapHelper
    {
        // maps用于保存每种枚举及其对应的EnumMap对象
        private static Dictionary<Type, EnumMap> maps;

        // 由于C#中没有static indexer的概念，所以在这里我们用静态方法
        public static string GetStringFromEnum(Enum item)
        {
            if (maps == null)
            {
                maps = new Dictionary<Type, EnumMap>();
            }

            Type enumType = item.GetType();

            EnumMap mapper = null;
            if (maps.ContainsKey(enumType))
            {
                mapper = maps[enumType];
            }
            else
            {
                mapper = new EnumMap(enumType);
                maps.Add(enumType, mapper);
            }
            return mapper[item];
        }

        private class EnumMap
        {
            private Type internalEnumType;
            private Dictionary<Enum, string> map;

            public EnumMap(Type enumType)
            {
                if (!enumType.IsSubclassOf(typeof(Enum)))
                {
                    throw new InvalidCastException();
                }
                internalEnumType = enumType;
                FieldInfo[] staticFiles = enumType.GetFields(BindingFlags.Public | BindingFlags.Static);

                map = new Dictionary<Enum, string>(staticFiles.Length);

                for (int i = 0; i < staticFiles.Length; i++)
                {
                    if (staticFiles[i].FieldType == enumType)
                    {
                        string description = "";
                        object[] attrs = staticFiles[i].GetCustomAttributes(typeof(EnumItemDescriptionAttribute), true);
                        description = attrs.Length > 0 ?
                            ((EnumItemDescriptionAttribute)attrs[0]).Description :
                            //若没找到EnumItemDescription标记，则使用该枚举值的名字
                            description = staticFiles[i].Name;

                        map.Add((Enum)staticFiles[i].GetValue(enumType), description);
                    }
                }
            }

            public string this[Enum item]
            {
                get
                {
                    if (item.GetType() != internalEnumType)
                    {
                        throw new ArgumentException();
                    }
                    return map[item];
                }
            }
        }
    }

    public class EnumItemDescriptionAttribute : DescriptionAttribute
    {
        public EnumItemDescriptionAttribute(string description)
            : base(description)
        {
        }
        public override string Description
        {
            get
            {
                return base.DescriptionValue;
            }
        }
    }
}
