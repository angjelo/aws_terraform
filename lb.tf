/*
  Application Load Balancer  
*/

resource "aws_alb" "front_end" {  
  name            = "front-end"  
  subnets         = ["${aws_subnet.public_sub.id}","${aws_subnet.public_sub2.id}"]
  security_groups = ["${aws_security_group.lb.id}"]
  internal           = false
  load_balancer_type = "application"   
  tags {    
    Name    = "Application LB"    
  }   
}

/*
  Load Balancer Listener  
*/


resource "aws_alb_listener" "front_end" {  
  load_balancer_arn = "${aws_alb.front_end.arn}"  
  port              = "80"  
  protocol          = "HTTP"

   default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Please navigate to /contact or /about"
      status_code  = "200"
    }
  }
}

/*
  Load Balancer Rules  
*/

resource "aws_lb_listener_rule" "static" {
  listener_arn = "${aws_alb_listener.front_end.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.contact.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/contact.html"]
  }
}

/*
  Load Balancer Rules  
*/

resource "aws_lb_listener_rule" "path" {
  listener_arn = "${aws_alb_listener.front_end.arn}"
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.about.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/about.html"]
  }
}
