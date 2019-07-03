using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Nacosti_.Startup))]
namespace Nacosti_
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
