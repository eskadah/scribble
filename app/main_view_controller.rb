
class MainViewController < UIViewController
  def viewDidLoad
    super

    @canvas = CanvasView.alloc.initWithFrame([[10,80],[300,370]])
    self.view.addSubview(@canvas)
  end
end


