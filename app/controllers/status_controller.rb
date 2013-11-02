class StatusController < UIViewController

  def viewDidLoad
    super

    self.title = "Balanced Payments Dashboard"

    self.view.backgroundColor = UIColor.whiteColor

    @status_api_label = UILabel.alloc.initWithFrame(CGRectZero)
    @status_api_label.text = "API Status"
    @status_api_label.textColor = UIColor.blackColor
    @status_api_label.backgroundColor = UIColor.clearColor
    @status_api_label.textAlignment = UITextAlignmentCenter
    @status_api_label.sizeToFit
    @status_api_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 230]

    self.view.addSubview(@status_api_label)

    @status_api = UILabel.alloc.initWithFrame(CGRectZero)
    @status_api.text = "tap refresh for status"
    @status_api.textColor = UIColor.blackColor
    @status_api.backgroundColor = UIColor.clearColor
    @status_api.textAlignment = UITextAlignmentCenter
    @status_api.sizeToFit
    @status_api.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 200]

    self.view.addSubview(@status_api)

    @status_js_label = UILabel.alloc.initWithFrame(CGRectZero)
    @status_js_label.text = "JS Status"
    @status_js_label.textColor = UIColor.blackColor
    @status_js_label.backgroundColor = UIColor.clearColor
    @status_js_label.textAlignment = UITextAlignmentCenter
    @status_js_label.sizeToFit
    @status_js_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 130]

    self.view.addSubview(@status_js_label)

    @status_js = UILabel.alloc.initWithFrame(CGRectZero)
    @status_js.text = "tap refresh for status"
    @status_js.textColor = UIColor.blackColor
    @status_js.backgroundColor = UIColor.clearColor
    @status_js.textAlignment = UITextAlignmentCenter
    @status_js.sizeToFit
    @status_js.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 100]

    self.view.addSubview(@status_js)

    @status_dashboard_label = UILabel.alloc.initWithFrame(CGRectZero)
    @status_dashboard_label.text = "Dashboard Status"
    @status_dashboard_label.textColor = UIColor.blackColor
    @status_dashboard_label.backgroundColor = UIColor.clearColor
    @status_dashboard_label.textAlignment = UITextAlignmentCenter
    @status_dashboard_label.sizeToFit
    @status_dashboard_label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 30]

    self.view.addSubview(@status_dashboard_label)

    @status_dashboard = UILabel.alloc.initWithFrame(CGRectZero)
    @status_dashboard.text = "tap refresh for status"
    @status_dashboard.textColor = UIColor.blackColor
    @status_dashboard.backgroundColor = UIColor.clearColor
    @status_dashboard.textAlignment = UITextAlignmentCenter
    @status_dashboard.sizeToFit
    @status_dashboard.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2]

    self.view.addSubview(@status_dashboard)

    @refresh = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @refresh.setTitle("Refresh", forState:UIControlStateNormal)
    @refresh.setTitle("Loading", forState:UIControlStateDisabled)
    @refresh.sizeToFit
    @refresh.center = [
        self.view.frame.size.width / 2,
        @status_dashboard_label.center.y + 80]
    self.view.addSubview(@refresh)

    @refresh.when(UIControlEventTouchUpInside) do
      @refresh.enabled = false

      StatusResponse.refresh do |response|
        puts "api status: #{response.api_status}"
        puts "js status: #{response.js_status}"
        puts "dash status: #{response.dashboard_status}"
        puts "time: #{response.time}"

        @status_api.text = "refreshing..."
        @status_js.text = "refreshing..."
        @status_dashboard.text = "refreshing..."

        if response.api_status.include? "UP"
          @status_api.text = "UP!"
          @status_api.textColor = UIColor.greenColor
        else
          @status_api.text = "DOWN :("
          @status_api.textColor = UIColor.redColor
        end

        if response.js_status.include? "UP"
          @status_js.text = "UP!"
          @status_js.textColor = UIColor.greenColor
        else
          @status_js.text = "DOWN :("
          @status_js.textColor = UIColor.redColor
        end

        if response.dashboard_status.include? "UP"
          @status_dashboard.text = "UP!"
          @status_dashboard.textColor = UIColor.greenColor
        else
          @status_dashboard.text = "DOWN :("
          @status_dashboard.textColor = UIColor.redColor
        end

        @refresh.enabled = true
      end
    end

  end

end
