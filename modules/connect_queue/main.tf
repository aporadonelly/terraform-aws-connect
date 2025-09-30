# --- Hours of Operation (Mon–Fri, 9–17) ---
resource "aws_connect_hours_of_operation" "weekdays" {
  instance_id = var.instance_id
  name        = "${var.project_prefix}-hours"
  description = "Standard business hours"
  time_zone   = "Europe/Brussels"

  config {
    day = "MONDAY"
    start_time {
      hours   = 9
      minutes = 0
    }
    end_time {
      hours   = 17
      minutes = 0
    }
  }

  config {
    day = "TUESDAY"
    start_time {
      hours   = 9
      minutes = 0
    }
    end_time {
      hours   = 17
      minutes = 0
    }
  }

  config {
    day = "WEDNESDAY"
    start_time {
      hours   = 9
      minutes = 0
    }
    end_time {
      hours   = 17
      minutes = 0
    }
  }

  config {
    day = "THURSDAY"
    start_time {
      hours   = 9
      minutes = 0
    }
    end_time {
      hours   = 17
      minutes = 0
    }
  }

  config {
    day = "FRIDAY"
    start_time {
      hours   = 9
      minutes = 0
    }
    end_time {
      hours   = 17
      minutes = 0
    }
  }
}

# --- Optional wait (helps AWS propagate the Hours resource) ---
resource "null_resource" "wait_for_hours" {
  depends_on = [aws_connect_hours_of_operation.weekdays]

  provisioner "local-exec" {
    command = "sleep 20"
  }
}

# --- Queue ---
resource "aws_connect_queue" "default_queue" {
  instance_id = var.instance_id
  name        = "${var.project_prefix}-queue"
  description = "Default queue"

  # Extract only the HoursOfOperationId (second part after :)
  hours_of_operation_id = aws_connect_hours_of_operation.weekdays.hours_of_operation_id

  depends_on = [null_resource.wait_for_hours]
}


# --- Routing Profile ---
resource "aws_connect_routing_profile" "default" {
  instance_id = var.instance_id
  name        = "${var.project_prefix}-routing-profile"
  #   default_outbound_queue_id = aws_connect_queue.default_queue.id
  description = "Default routing profile"

  # Only pass the raw queue ID, not instance:queue
  default_outbound_queue_id = aws_connect_queue.default_queue.queue_id

  media_concurrencies {
    channel     = "VOICE"
    concurrency = 1
  }

  depends_on = [aws_connect_queue.default_queue]
}

# --- Security Profile ---
resource "aws_connect_security_profile" "agent" {
  instance_id = var.instance_id
  name        = "${var.project_prefix}-agent-profile"
  description = "Security profile for agents"
}
