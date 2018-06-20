using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SageFrame.Category
{
    public class CategoryInfo
    {
        public int CategoryID { get; set; }
        public string Title { get; set; }
        public string Detail { get; set; }
        public bool IsActive { get; set; }
        public DateTime AddedOn { get; set; }
        public string AddedBy { get; set; }
        public int PortalID { get; set; }
        public int UserModuleID { get; set; }
        public string CultureCode { get; set; }
        public string Username { get; set; }
    }
}
