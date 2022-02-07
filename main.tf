terraform {
  required_providers {
    tfe = {
      version = "~> 0.27.0"
    }
  }
}

resource "tfe_agent_pool" "test_agent_pool" {
  name         = var.tfc_agent_pool_name
  organization = var.tfc_organization
}

resource "tfe_agent_token" "test_agent_token" {
  agent_pool_id = tfe_agent_pool.test_agent_pool.id
  description   = "my-agent-token-name"
}

variable "tfc_agent_pool_name" {
  type = string
}

variable "tfc_organization" {
  type = string
}

output "tfc_agent_pool_name" {
  value = tfe_agent_pool.test_agent_pool.name
}

output "tfc_agent_token" {
  value = tfe_agent_token.test_agent_token.token
}

