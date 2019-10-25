# terraform-workspaces-demo
demo of using terraform workspaces

`terraform workspace new {ENV}`

eg. `terraform workspace new dev`

### S3 location

state file structure

```
s3://terraform-workspaces-demo

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
