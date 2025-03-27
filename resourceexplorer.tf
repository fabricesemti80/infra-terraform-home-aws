
# Step 1: Create AWS Resource Explorer Aggregator
resource "aws_resourceexplorer2_index" "aggregator" {
  type    = "AGGREGATOR" # Enables global search
}

resource "aws_resourceexplorer2_view" "aggregator" {
  name = "aggregator-view"

#   filters {
#     filter_string = "resourcetype:ec2:instance"
#   }

#   included_property {
#     name = "tags"
#   }

  depends_on = [aws_resourceexplorer2_index.aggregator]
}