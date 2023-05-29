using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(project_aspx.Startup))]
namespace project_aspx
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
