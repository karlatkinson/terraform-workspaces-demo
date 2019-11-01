# terraform-workspaces-demo

Useful info:
* https://www.terraform.io/docs/state/workspaces.html
* https://www.youtube.com/watch?v=PtxtGPxCaQ8 - video showing workspaces along gitlab ci
* https://www.terraform.io/docs/cloud/guides/recommended-practices/part1.html#the-recommended-terraform-workspace-structure
* https://www.capitalone.com/tech/software-engineering/deploying-multiple-environments-with-terraform/ more examples showing how workspaces are useful

usually would have a single s3 bucket to store your state files. you could have one per application but seems excessive unless you needed really fine grained perms.

### Managing workspaces

By default, everything is under the 'default' workspace and state for this is stored in the standard 'key' location.
For other workspaces, terraform prefixes 'env:' onto the key. This can be configured in your state configuration to something else.

To create a workspace...

`terraform workspace new {NAME}`

eg. `terraform workspace new dev`

and switch to it using `terraform workspace select {NAME}`
you can then reference `terraform.workspace` within your terraform to access the workspace running.

### What this looks like in s3

```
s3://karls-terraform-state-bucket

├── terraform-workspace-demo (default state if used)
│   ├── state.tfstate
├── env:
│   ├── dev
│   │   ├── terraform-workspace-demo
│   │       ├── state.tfstate
│   ├── test
│   │   ├── terraform-workspace-demo
│   │       ├── state.tfstate
│   ├── prod
│   │   ├── terraform-workspace-demo
│   │       ├── state.tfstate 
```
