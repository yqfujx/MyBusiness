using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyBusiness.Startup))]
namespace MyBusiness
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
