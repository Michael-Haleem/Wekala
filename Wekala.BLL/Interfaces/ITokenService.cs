using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Interfaces
{
    public interface ITokenService
    {
        Task<string> CreateToken(ApplicationUser user, UserManager<ApplicationUser> userManager);
    }
}
