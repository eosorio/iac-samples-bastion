terraform {
  backend "s3" {
    bucket                 = "my_bucket_name_here"
    dynamodb_table         = "my_dynamodb_table_name_here"
    key                    = "my_tf_state_file_name_here"
    region                 = "us-east-1"
  }
}
