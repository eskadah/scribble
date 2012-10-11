
class CanvasView < UIView
  def initWithFrame(frame)
    if super
      @hue = 0.5
    end
    self
  end

  def touchesMoved(touches, withEvent:event)
    @touch = touches.anyObject
    self.setNeedsDisplay()
  end

  def drawRect(rect)
    if @touch
      context = UIGraphicsGetCurrentContext()
      color = UIColor.colorWithHue(@hue, saturation:0.7, brightness:1.0, alpha:1.0)

      CGContextSetStrokeColorWithColor(context, color.CGColor)
      CGContextSetLineCap(context, KCGLineCapRound)
      CGContextSetLineWidth(context, 15)

      last_point = @touch.previousLocationInView(self)
      new_point = @touch.locationInView(self)

      CGContextMoveToPoint(context, last_point.x, last_point.y)
      CGContextAddLineToPoint(context, new_point.x, new_point.y)
      CGContextStrokePath(context)
    end
  end
end
