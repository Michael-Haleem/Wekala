using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly ITokenService tokenService;
        private readonly IMapper mapper;

        public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, ITokenService tokenService, IMapper mapper)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.tokenService = tokenService;
            this.mapper = mapper;
        }

        [HttpPost("login")]
        public async Task<ActionResult<UserDto>> Login(LoginDto loginDto)
        {
            var user = await userManager.FindByEmailAsync(loginDto.Email);
            if (user == null) return Unauthorized();
            var result = await signInManager.CheckPasswordSignInAsync(user, loginDto.Password, false);
            if (!result.Succeeded) return Unauthorized();
            return Ok(new UserDto()
            {
                FullName = $"{user.FirstName} {user.LastName}",
                Email = user.Email,
                Token = await tokenService.CreateToken(user, userManager)
            });
        }

        [HttpPost("register")]
        public async Task<ActionResult<UserDto>> Register(RegisterDto registerDto)
        {
            if (CheckEmailExist(registerDto.Email).Result.Value)
                return BadRequest(error:"This email is already Exists!");
            var user = mapper.Map<RegisterDto, ApplicationUser>(registerDto);
            user.UserName = $"{user.FirstName}{user.LastName}";

            var result = await userManager.CreateAsync(user, registerDto.Password);
            if (!result.Succeeded) return BadRequest();
            if (user.UserType.ToLower() == "admin")
            {
                await userManager.AddToRoleAsync(user, "Admin");
            }else if(user.UserType.ToLower() == "supplier")
            {
                await userManager.AddToRoleAsync(user, "Supplier");
            }
            else
            {
                await userManager.AddToRoleAsync(user, "User");
            }
            return Ok(new UserDto()
            {
                FullName = $"{user.FirstName} {user.LastName}",
                Email = user.Email,
                Token = await tokenService.CreateToken(user, userManager)
            });
        }

        [HttpGet("emailexists")]
        public async Task<ActionResult<bool>> CheckEmailExist([FromQuery] string email)
        {
            return await userManager.FindByEmailAsync(email) != null;
        }
    }
}
