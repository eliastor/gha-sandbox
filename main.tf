resource "time_rotating" "trigger" {
  rotation_minutes = "12m"
}

resource "terraform_data" "resource" {
  input = uuid()

  triggers_replace = time_rotating.trigger.unix
}

output "resource" {
  value = terraform_data.resource.output
}
