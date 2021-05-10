/*
 Target groups
*/

resource "aws_alb_target_group" "contact" {  
  name     = "contact"  
  port     = "80"  
  protocol = "HTTP"  
  vpc_id   = aws_vpc.main.id
  tags {    
    name = "1st group"    
  }   
  
  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 9    
    timeout             = 5    
    interval            = 10    
    path                = "/contact.html"    
    port                = "80"  
  }
}
resource "aws_alb_target_group" "about" {  
  name     = "about"  
  port     = "80"  
  protocol = "HTTP"  
  vpc_id   = aws_vpc.main.id
  tags {    
    name = "2nd group"    
  }   
  
  health_check {    
    healthy_threshold   = 5    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10    
    path                = "/about.html"    
    port                = "80"  
  }
}

/*
  Hook up Attatchments 
*/
 
resource "aws_alb_target_group_attachment" "contact" {
  target_group_arn = aws_alb_target_group.contact.arn
  target_id        = aws_instance.a.id
  port             = 80
}

resource "aws_alb_target_group_attachment" "about" {
  target_group_arn = aws_alb_target_group.about.arn
  target_id        = aws_instance.b.id
  port             = 80
}

