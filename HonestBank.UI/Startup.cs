using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HonestBank.UI.Startup))]
namespace HonestBank.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
