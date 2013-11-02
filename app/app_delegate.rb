class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @status_controller = StatusController.alloc.initWithNibName(nil, bundle:nil)

    @window.rootViewController = @status_controller
    @window.makeKeyAndVisible

    true
  end
end
