class StatusController < UIViewController

  def viewDidLoad
    #super
    self.title = "Balanced Status"

    self.stylesheet = :status
    self.view.stylename = :root

    subview(UITextField.alloc.initWithFrame(CGRectZero), :status_api)
    #subview(UILabel.alloc.initWithFrame(CGRectZero), :status_api_label)

    subview(UITextField.alloc.initWithFrame(CGRectZero), :status_js)
    subview(UITextField.alloc.initWithFrame(CGRectZero), :status_dashboard)

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Dashboard"
    @label.textColor = UIColor.blackColor
    @label.backgroundColor = UIColor.clearColor
    @label.sizeToFit
    @label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2]

    self.view.addSubview(@label)
  end

end
