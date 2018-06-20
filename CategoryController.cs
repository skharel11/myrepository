using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SageFrame.Category
{
    public class CategoryController
    {
        public List<CategoryInfo> GetAllCategory(int portalID, int userModuleID, string cultureCode)
        {
            CategoryProvider provider = new CategoryProvider();
            return provider.GetAllCategory(portalID,userModuleID,cultureCode);
        }


        public void CategoryAddUpdate(CategoryInfo objCategory)
        {
            CategoryProvider provider = new CategoryProvider();
            provider.CategoryAddUpdate(objCategory);
        }
        
    }
}
