Teacup::Stylesheet.new :status do

  style :root,
    backgroundColor: UIColor.colorWithRed(0.902, green: 0.906, blue: 0.91, alpha:1)

  style :status_api_label,
    borderStyle:UITextBorderStyleRoundedRect,
    center: ['50%','50% - 200'],
    frame:[CGPointZero, [150,32]],
    text:"Status",
    textAlignment: UITextAlignmentCenter,
    autocapitalizationType: UITextAutocapitalizationTypeNone

  style :status_api,
    borderStyle:UITextBorderStyleRoundedRect,
    center: ['50%','50% - 100'],
    frame:[CGPointZero, [150,32]],
    placeholder: 'Status: Bad',
    textAlignment: UITextAlignmentCenter,
    autocapitalizationType: UITextAutocapitalizationTypeNone
  style :status_js,
    borderStyle:UITextBorderStyleRoundedRect,
    center: ['50%','50% + 100'],
    frame:[CGPointZero, [150,32]],
    placeholder: 'Status: Bad',
    textAlignment: UITextAlignmentCenter,
    autocapitalizationType: UITextAutocapitalizationTypeNone
  style :status_dashboard,
    borderStyle:UITextBorderStyleRoundedRect,
    center: ['50%','50% + 200'],
    frame:[CGPointZero, [150,32]],
    placeholder: 'Status: Bad',
    textAlignment: UITextAlignmentCenter,
    autocapitalizationType: UITextAutocapitalizationTypeNone
end
