# forbid_resource_type

This is a lint rule to forbid given Terraform resource types.

## Why?

This rule is useful if you want to forbid some resource types for consistency and security.
For example, you may want to forbid resource types which stores secrets to Terraform State.

In another case, Google Provider has several resource types for [IAM Policy for projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam).
Using these different resource types may cause troubles, so you may want users to use only a specific resource type such as [google_project_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member).

## Usage

```jsonnet
function(param) {
  targets: [
    {
      data_files: [
        '**/tfplan.json',
      ],
      modules: [
        {
          path: 'github_archive/github.com/lintnet-modules/terraform/plan_file/forbid_resource_type/main.jsonnet@0f350f659c7c64c7398249ea0fc23d1cec45c12a:v0.1.0',
          config: {
            types: ['google_secret_manager_secret_version'],
          },
        },
      ],
    },
  ],
}
```

## Config

- `types` (Required): A list of forbidden resource types
