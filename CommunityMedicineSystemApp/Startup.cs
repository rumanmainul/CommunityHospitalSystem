using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CommunityMedicineSystemApp.Startup))]
namespace CommunityMedicineSystemApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
