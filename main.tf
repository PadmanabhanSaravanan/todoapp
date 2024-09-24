provider "google" {
  project = "stalwartl-1667731023284"  
  region  = "us-east1"               
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"    
  location = "us-east1-b"             

  initial_node_count = 3                

  node_config {
    machine_type = "e2-medium"          
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",  
    ]
  }
}
