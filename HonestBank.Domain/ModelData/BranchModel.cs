using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HonestBank.Domain.ModelData
{
    public class BranchModel
    {
        [Editable(false)]
        [DisplayName("Branch ID")]
        public int BranchID { get; set; }
        
        [Required(ErrorMessage="Please Enter an Name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Please Enter an Address")]
        public string Address { get; set; }
        
        [Required(ErrorMessage = "Please Enter a city")]
        public string City { get; set; }

        public string State { get; set; }
        
        [Required(ErrorMessage="Please enter a zip code")]
        [DisplayName("Zip Code")]
        public string ZipCode { get; set; }
    }
}
