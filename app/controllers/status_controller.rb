class StatusController < UIViewController

  def viewDidLoad
    super

    self.title = "Balanced Payments Dashboard"

    self.view.backgroundColor = UIColor.whiteColor

    @page_label = UILabel.alloc.initWithFrame(CGRectZero)
    @page_label.text = "Balanced Payments Dashboard"
    @page_label.textColor = UIColor.blackColor
    @page_label.backgroundColor = UIColor.clearColor
    @page_label.textAlignment = UITextAlignmentCenter
    @page_label.sizeToFit
    @page_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 230]

    self.view.addSubview(@page_label)

    @api_status_label = UILabel.alloc.initWithFrame(CGRectZero)
    @api_status_label.text = "API Status"
    @api_status_label.textColor = UIColor.blackColor
    @api_status_label.backgroundColor = UIColor.clearColor
    @api_status_label.textAlignment = UITextAlignmentCenter
    @api_status_label.sizeToFit
    @api_status_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 130]

    self.view.addSubview(@api_status_label)

    @api_status = UILabel.alloc.initWithFrame(CGRectZero)
    @api_status.text = "loading..."
    @api_status.textColor = UIColor.blackColor
    @api_status.backgroundColor = UIColor.clearColor
    @api_status.textAlignment = UITextAlignmentCenter
    @api_status.sizeToFit
    @api_status.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 100]

    self.view.addSubview(@api_status)

    @js_status_label = UILabel.alloc.initWithFrame(CGRectZero)
    @js_status_label.text = "JS Status"
    @js_status_label.textColor = UIColor.blackColor
    @js_status_label.backgroundColor = UIColor.clearColor
    @js_status_label.textAlignment = UITextAlignmentCenter
    @js_status_label.sizeToFit
    @js_status_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 60]

    self.view.addSubview(@js_status_label)

    @js_status = UILabel.alloc.initWithFrame(CGRectZero)
    @js_status.text = "loading..."
    @js_status.textColor = UIColor.blackColor
    @js_status.backgroundColor = UIColor.clearColor
    @js_status.textAlignment = UITextAlignmentCenter
    @js_status.sizeToFit
    @js_status.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 30]

    self.view.addSubview(@js_status)

    @dashboard_status_label = UILabel.alloc.initWithFrame(CGRectZero)
    @dashboard_status_label.text = "Dashboard Status"
    @dashboard_status_label.textColor = UIColor.blackColor
    @dashboard_status_label.backgroundColor = UIColor.clearColor
    @dashboard_status_label.textAlignment = UITextAlignmentCenter
    @dashboard_status_label.sizeToFit
    @dashboard_status_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 + 10]

    self.view.addSubview(@dashboard_status_label)

    @dashboard_status = UILabel.alloc.initWithFrame(CGRectZero)
    @dashboard_status.text = "loading..."
    @dashboard_status.textColor = UIColor.blackColor
    @dashboard_status.backgroundColor = UIColor.clearColor
    @dashboard_status.textAlignment = UITextAlignmentCenter
    @dashboard_status.sizeToFit
    @dashboard_status.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 + 40]

    self.view.addSubview(@dashboard_status)

    @refresh = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @refresh.setTitle("Refresh", forState:UIControlStateNormal)
    @refresh.setTitle("Loading", forState:UIControlStateDisabled)
    @refresh.sizeToFit
    @refresh.center = [
        self.view.frame.size.width / 2,
        @dashboard_status_label.center.y + 150]

    self.view.addSubview(@refresh)

    refresh_status

    @refresh.when(UIControlEventTouchUpInside) do
      @refresh.enabled = false

      refresh_status
    end

  end

  def refresh_status
    StatusResponse.refresh do |response|
      puts "api status: #{response.api_status}"
      puts "js status: #{response.js_status}"
      puts "dash status: #{response.dashboard_status}"
      puts "time: #{response.time}"

      @api_status.text = "refreshing..."
      @js_status.text = "refreshing..."
      @dashboard_status.text = "refreshing..."

      if response.api_status.include? "UP"
        @api_status.text = "UP"
        @api_status.textColor = UIColor.greenColor
      else
        @api_status.text = "DOWN"
        @api_status.textColor = UIColor.redColor
      end

      if response.js_status.include? "UP"
        @js_status.text = "UP"
        @js_status.textColor = UIColor.greenColor
      else
        @js_status.text = "DOWN"
        @js_status.textColor = UIColor.redColor
      end

      if response.dashboard_status.include? "UP"
        @dashboard_status.text = "UP"
        @dashboard_status.textColor = UIColor.greenColor
      else
        @dashboard_status.text = "DOWN"
        @dashboard_status.textColor = UIColor.redColor
      end

      @refresh.enabled = true
    end
  end

end
