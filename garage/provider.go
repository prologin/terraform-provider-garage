package garage

import (
	"context"

	garage "git.deuxfleurs.fr/garage-sdk/garage-admin-sdk-golang"
	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Provider -
func Provider() *schema.Provider {
	return &schema.Provider{
		Schema: map[string]*schema.Schema{
			"host": {
				Type:        schema.TypeString,
				Optional:    true,
				DefaultFunc: schema.EnvDefaultFunc("GARAGE_HOST", nil),
			},
			"scheme": {
				Type:        schema.TypeString,
				Optional:    true,
				DefaultFunc: schema.EnvDefaultFunc("GARAGE_SCHEME", "https"),
			},
			"token": {
				Type:        schema.TypeString,
				Optional:    true,
				Sensitive:   true,
				DefaultFunc: schema.EnvDefaultFunc("GARAGE_TOKEN", nil),
			},
		},
		ResourcesMap:         map[string]*schema.Resource{},
		DataSourcesMap:       map[string]*schema.Resource{},
		ConfigureContextFunc: providerConfigure,
	}
}

func providerConfigure(ctx context.Context, d *schema.ResourceData) (interface{}, diag.Diagnostics) {
	host := d.Get("host").(string)
	scheme := d.Get("scheme").(string)
	token := d.Get("token").(string)

	var diags diag.Diagnostics

	if host == "" || token == "" {
		diags = append(diags, diag.Diagnostic{
			Severity: diag.Error,
			Summary:  "Unable to find host or token",
			Detail:   "Those values must be set",
		})
		return nil, diags
	}

	// TODO: add more configuration values
	configuration := garage.NewConfiguration()
	configuration.Host = host
	configuration.Scheme = scheme

	client := garage.NewAPIClient(configuration)

	ctx = context.WithValue(ctx, garage.ContextAccessToken, token)

	return client, diags
}
